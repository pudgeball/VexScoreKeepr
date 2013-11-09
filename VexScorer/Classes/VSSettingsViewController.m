//
//  VSSettingsViewController.m
//  VexScorer
//
//  Created by Nick McGuire on 11/6/2013.
//  Copyright (c) 2013 RND Consulting. All rights reserved.
//

#import "VSSettingsViewController.h"

#import "VSBatchCreationViewController.h"

#import "Model/Match.h"

static NSString *kCellIdentifier = @"VSSettingsCell";

@interface VSSettingsViewController ()

@end

@implementation VSSettingsViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
	
	self.title = @"Settings";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	NSInteger count = 0;
	switch (section) {
		case 0:
			count = 2;
			break;
	}
	return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
	NSString *labelText = @"";
	switch (indexPath.row) {
		case 0:
			labelText = @"Create Matches (Batch)";
			break;
		case 1:
			labelText = @"Reset Data";
			break;
	}
	cell.textLabel.text = labelText;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	NSString *title = @"";
	switch (section) {
		case 0:
			title = @"Match Operations";
			break;
	}
	return title;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.section == 0 && indexPath.row == 0) {
		VSBatchCreationViewController *batchCreation = [[VSBatchCreationViewController alloc] initWithNibName:@"VSBatchCreationView" bundle:nil];
		batchCreation.modalPresentationStyle = UIModalPresentationFormSheet;
		[self presentViewController:batchCreation animated:YES completion:nil];
	} else if (indexPath.section == 0 && indexPath.row == 1) {
		NSArray *matches = [Match all];
		for (Match *match in matches) {
			[match delete];
		}
		[[CoreDataManager instance] saveContext];
		
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Done!" message:@"Matches have been deleted!" delegate:nil cancelButtonTitle:@"Okay!" otherButtonTitles:nil];
		[alert show];
	}
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
