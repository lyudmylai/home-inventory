//
//  JETAddDetailsViewController.m
//  HomeInventory
//
//  Created by Lyudmyla Ivanova on 1/13/18.
//  Copyright © 2018 Lyudmyla Ivanova. All rights reserved.
//

#import "JETAddDetailsViewController.h"

@interface JETAddDetailsViewController ()

@end

@implementation JETAddDetailsViewController

static NSString *const kViewControllerTitle = @"Add Details";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:kViewControllerTitle];
    self.addDetailsView = [[JETAddDetailsView alloc]initWithFrame:self.view.frame];
    if (self.titleText) {
        [self.addDetailsView.titleTextField setText:self.titleText];
    }
    UIBarButtonItem *doneButton =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                  target:self
                                                  action:@selector(onDoneButtonTapped:)];
    self.navigationItem.rightBarButtonItem = doneButton;
    self.view = self.addDetailsView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)onDoneButtonTapped:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
