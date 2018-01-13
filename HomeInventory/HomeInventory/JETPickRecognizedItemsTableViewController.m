//
//  JETPickRecognizedItemsTableViewController.m
//  HomeInventory
//
//  Created by Lyudmyla Ivanova on 1/13/18.
//  Copyright © 2018 Lyudmyla Ivanova. All rights reserved.
//

#import "JETPickRecognizedItemsTableViewController.h"

@interface JETPickRecognizedItemsTableViewController ()

@end

@implementation JETPickRecognizedItemsTableViewController

static NSString *const kCellIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class]forCellReuseIdentifier:kCellIdentifier];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [[self.recognizedItems objectAtIndex:indexPath.row]identifier];
    return cell;
}

@end
