//
//  KGAddGagViewController.m
//  Kgag
//
//  Created by Lart Ace Ignacio on 13/10/2015.
//  Copyright © 2015 Lart Ace Ignacio. All rights reserved.
//

#import "KGAddGagViewController.h"
#import <CZPhotoPickerController/CZPhotoPickerController.h>

#import "KGGagRequestManager.h"
#import "KGRootViewController.h"

@interface KGAddGagViewController ()

@property (nonatomic, strong) CZPhotoPickerController *photoPicker;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UITextView *messageTextView;

@end

@implementation KGAddGagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - IBAction
- (IBAction)disShow:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addPhotoAction:(id)sender
{
    __weak typeof(self) weakSelf = self;
    
    self.photoPicker = [[CZPhotoPickerController alloc] initWithPresentingViewController:self withCompletionBlock:^(UIImagePickerController *imagePickerController, NSDictionary *imageInfoDict) {
        if (imageInfoDict[UIImagePickerControllerOriginalImage])
        {
            weakSelf.imageView.image = imageInfoDict[UIImagePickerControllerOriginalImage];
        }
        
        [weakSelf.photoPicker dismissAnimated:YES];
        weakSelf.photoPicker = nil;
    }];
    
    [self.photoPicker showFromBarButtonItem:self.navigationItem.rightBarButtonItem];
}

- (IBAction)uploadGag:(id)sender
{
    NSData *data = UIImageJPEGRepresentation(self.imageView.image, 0.3f);
    
    NSDictionary *imageDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                     data, @"data",
                                     @"fileName1.jpg", @"fileName",
                                     @"fileName1", @"name", nil];
    
    RequestFinishedBlock requestFinishedBlock = ^(NSDictionary *params) {
        [self dismissViewControllerAnimated:YES completion:nil];
    };
    
    RequestErrorBlock errorBlock = ^(NSError *error, NSDictionary *params) {
        
    };
    
    RequestCancelBlock cancelBlock = ^(void) {
        
    };
    
    KGGagRequestManager *gagRequestManager = [[KGGagRequestManager alloc] init];
    
    [gagRequestManager requestAddGag:imageDictionary
                             message:self.messageTextView.text
                       finishedBlock:requestFinishedBlock
                          errorBlock:errorBlock
                         cancelBlock:cancelBlock];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
