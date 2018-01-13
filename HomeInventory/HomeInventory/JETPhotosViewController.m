//
//  JETPhotosViewController.m
//  HomeInventory
//
//  Created by Lyudmyla Ivanova on 1/12/18.
//  Copyright © 2018 Lyudmyla Ivanova. All rights reserved.
//

@import Vision;
@import CoreML;
#import "JETPhotosViewController.h"
#import "JETPickRecognizedItemsTableViewController.h"
#import "MobileNet.h"

@interface JETPhotosViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (strong, nonatomic) VNCoreMLRequest *classifficationRequest;
@property (strong, nonatomic) MobileNet *model;
@property (strong, nonatomic) UIImagePickerController *imagePicker;
@property (assign, nonatomic) BOOL shouldLoadImagePicker;

@end

@implementation JETPhotosViewController

static NSString *const kViewControllerTitle = @"Take Photo";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:kViewControllerTitle];
    self.shouldLoadImagePicker = NO;
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:YES completion:^{
        self.shouldLoadImagePicker = NO;
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (!self.imagePicker || self.shouldLoadImagePicker) {
        self.imagePicker = [[UIImagePickerController alloc]init];
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        self.imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
        self.imagePicker.delegate = self;
        self.shouldLoadImagePicker = NO;
        [self presentViewController:self.imagePicker animated:YES completion:^{
            self.shouldLoadImagePicker = NO;
        }];
    }
}

- (void)receivedClassificationResultsForRequest:(VNRequest *)request error:(NSError *)error {
    if (error) {
        return;
    }
    NSArray *results = request.results;
    JETPickRecognizedItemsTableViewController *pickItemsVC = [[JETPickRecognizedItemsTableViewController alloc]init];
    pickItemsVC.recognizedItems = [NSArray arrayWithArray:results];
    [self.navigationController pushViewController:pickItemsVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    self.shouldLoadImagePicker = YES;
}

- (VNCoreMLRequest *)setupRequest {
    if (!self.model) {
        self.model = [[MobileNet alloc]init];
    }
    VNCoreMLModel *model = [VNCoreMLModel modelForMLModel:self.model.model error:nil];
    __weak JETPhotosViewController *weakself = self;
    VNCoreMLRequest *classificationRequest = [[VNCoreMLRequest alloc]initWithModel:model completionHandler:^(VNRequest *request, NSError *error) {
        [weakself receivedClassificationResultsForRequest:request error:error];
    }];
    return classificationRequest;
}

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    CGImagePropertyOrientation orientation = [self CGImagePropertyOrientation:image.imageOrientation];
    CIImage *ciImage = [[CIImage alloc]initWithCGImage:image.CGImage options:nil];
    if (ciImage) {
        __weak JETPhotosViewController *weakself = self;
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSDictionary *options = [[NSDictionary alloc]init];
            VNImageRequestHandler *requestHandler = [[VNImageRequestHandler alloc]initWithCIImage:ciImage
                                                                                      orientation:orientation
                                                                                          options:options];
            [requestHandler performRequests:[NSArray arrayWithObject:[weakself setupRequest]] error:nil];
        });
    }
}

- (CGImagePropertyOrientation)CGImagePropertyOrientation:(UIImageOrientation)orientation {
    switch (orientation) {
        case UIImageOrientationUp:
            return kCGImagePropertyOrientationUp;
        case UIImageOrientationUpMirrored:
            return kCGImagePropertyOrientationUpMirrored;
        case UIImageOrientationDown:
            return kCGImagePropertyOrientationDown;
        case UIImageOrientationDownMirrored:
            return kCGImagePropertyOrientationDownMirrored;
        case UIImageOrientationLeftMirrored:
            return kCGImagePropertyOrientationLeftMirrored;
        case UIImageOrientationRight:
            return kCGImagePropertyOrientationRight;
        case UIImageOrientationRightMirrored:
            return kCGImagePropertyOrientationRightMirrored;
        case UIImageOrientationLeft:
            return kCGImagePropertyOrientationLeft;
    }
}

@end
