//
//  MasterViewController.m
//  test
//
//  Created by Mathieu Allaire on 2014-11-04.
//  Copyright (c) 2014 Mathieu Allaire. All rights reserved.
//

#import "MasterViewController.h"
#import <PureLayout.h>

@interface MasterViewController ()
@property (strong, nonatomic) UIView *tableHeaderView;
@property (strong, nonatomic) UILabel *tableHeaderLabel;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Test";
    
    self.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    self.tableHeaderView.backgroundColor = [UIColor blackColor];
    self.tableView.tableHeaderView = self.tableHeaderView;
    
    self.tableHeaderLabel = [[UILabel alloc] initForAutoLayout];
    self.tableHeaderLabel.text = @"Hello World";
    self.tableHeaderLabel.textColor = [UIColor whiteColor];
    
    [self.tableHeaderView addSubview:self.tableHeaderLabel];
    
    [self.view setNeedsUpdateConstraints];
    [self.tableHeaderLabel setNeedsUpdateConstraints];
    [self.tableHeaderView setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
    // Always stuck top left corner in iOS 8, looks good with iOS 7.1 SDK
    [self.tableHeaderLabel autoCenterInSuperview];
    
    [super updateViewConstraints];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    return cell;
}

@end
