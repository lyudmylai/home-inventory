//
//  JETInventoryViewController.m
//  HomeInventory
//
//  Created by Lyudmyla Ivanova on 1/13/18.
//  Copyright © 2018 Lyudmyla Ivanova. All rights reserved.
//

#import "JETInventoryViewController.h"

@interface JETInventoryViewController ()

@property (strong, nonatomic) NSMutableArray *inventoryItems;

@end

@implementation JETInventoryViewController

static NSString *const kViewControllerTitle = @"Inventory";
static NSString *const kReuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
    [self setTitle:kViewControllerTitle];
    UIBarButtonItem *addBarButtonItem =
                        [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                      target:self
                                                                      action:@selector(onAddButtonTapped:)];
    self.navigationItem.rightBarButtonItem = addBarButtonItem;
    self.inventoryItems = [[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)onAddButtonTapped:(id)sender {
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kReuseIdentifier forIndexPath:indexPath];
    
    return cell;
}

@end
