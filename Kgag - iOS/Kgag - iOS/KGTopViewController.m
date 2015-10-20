//
//  KGTopViewController.m
//  
//
//  Created by Lart Ace Ignacio on 05/10/2015.
//
//

#import "KGTopViewController.h"
#import "KGGagRequestManager.h"

#import "KGGagCell.h"

#import "KGGag.h"

#import "UIScrollView+SVPullToRefresh.h"
#import "UIScrollView+SVInfiniteScrolling.h"

@interface KGTopViewController ()

@property NSMutableArray *gags;

@property (nonatomic, strong) KGGagRequestManager *gagManager;

@end

@implementation KGTopViewController

- (id)init
{
    self = [super init];
    
    if (self)
    {

    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.gagManager = [[KGGagRequestManager alloc] init];
    
    self.gags = [NSMutableArray array];
    [self requestGagList];
    
    __weak typeof(self) weakSelf = self;
    [self.tableView addPullToRefreshWithActionHandler:^{
        [weakSelf.gagManager resetPaginationParameters];
        [weakSelf requestGagList];
    }];
    
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        [weakSelf requestGagList];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions
- (IBAction)refreshButtonAction:(id)sender
{
    [self.gagManager resetPaginationParameters];
    [self requestGagList];
}

#pragma mark - API Request
- (void)requestGagList
{
    RequestFinishedBlock requestFinishedBlock = ^(NSDictionary *params)
    {
        if ([self.gagManager isFirstPage])
            self.gags = [NSMutableArray array];
        
        for (NSDictionary *gagDictionary in [params objectForKey:@"data"])
        {
            KGGag *gag = [[KGGag alloc] initWithDictionary:gagDictionary];
            [self.gags addObject:gag];
        }
        
        [self.tableView reloadData];
        [self.tableView.pullToRefreshView stopAnimating];
        [self.tableView.infiniteScrollingView stopAnimating];
    };
    
    RequestErrorBlock errorBlock = ^(NSError *error, NSDictionary *params)
    {
        
    };
    
    RequestCancelBlock cancelBlock = ^(void)
    {
        
    };
    
    [self.gagManager requestGagList:requestFinishedBlock
                         errorBlock:errorBlock
                        cancelBlock:cancelBlock];
}

#pragma mark - CellInitialization
- (KGGagCell *)loadGagCellWithIndexPath:(NSIndexPath *)indexPath
{
    KGGagCell *cell = [self.tableView dequeueReusableCellWithIdentifier:[KGGagCell reuseIdentifier]];

    if (cell == nil)
        cell = [KGGagCell loadNib];
    
    KGGag *gag = [self.gags objectAtIndex:indexPath.row];
    [cell setGagCell:gag];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [KGGagCell cellHeight];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.gags.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self loadGagCellWithIndexPath:indexPath];
}

@end
