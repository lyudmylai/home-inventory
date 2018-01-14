//
//  JETPickRecognizedItemsTableViewController.m
//  HomeInventory
//
//  Created by Lyudmyla Ivanova on 1/13/18.
//  Copyright © 2018 Lyudmyla Ivanova. All rights reserved.
//

#import "JETPickRecognizedItemsTableViewController.h"
#import "JETRecognizedItemTableViewCell.h"
#import "JETAddDetailsViewController.h"

@interface JETPickRecognizedItemsTableViewController ()

@end

@implementation JETPickRecognizedItemsTableViewController

static NSString *const kCellIdentifier = @"Cell";
static CGFloat const kCellHeight = 60.0;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[JETRecognizedItemTableViewCell class]forCellReuseIdentifier:kCellIdentifier];
    self.tableView.rowHeight = kCellHeight;
    self.tableView.allowsMultipleSelectionDuringEditing = YES;
    [self.tableView setEditing:YES animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (self.recognizedItems && (self.recognizedItems.count > 0)) {
        [self.tableView reloadData];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.recognizedItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JETRecognizedItemTableViewCell *cell =
                                [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    cell.titleLabel.text = [[self.recognizedItems objectAtIndex:indexPath.row]identifier];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JETAddDetailsViewController *addDetailsVC = [[JETAddDetailsViewController alloc]init];
    addDetailsVC.titleText = [NSString stringWithString:[[self.recognizedItems objectAtIndex:indexPath.row]identifier]];
    [self.navigationController pushViewController:addDetailsVC animated:YES];
}

@end
