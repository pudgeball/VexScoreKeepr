//
//  VSMatchesViewController.m
//  VexScorer
//
//  Created by Nick McGuire on 2013-10-22.
//  Copyright (c) 2013 RND Consulting. All rights reserved.
//

#import "VSMatchesViewController.h"

#import "VSMatchCell.h"

static NSString * kCellID = @"MatchCellID";

@interface VSMatchesViewController ()

@property (strong, nonatomic) UICollectionViewFlowLayout *flowLayout;

@property (strong, nonatomic) UIBarButtonItem *editButton;
@property (strong, nonatomic) UIBarButtonItem *addMatchButton;
@property (strong, nonatomic) UIBarButtonItem *clearAllButton;
@property (strong, nonatomic) UIBarButtonItem *deleteButton;

@end

@implementation VSMatchesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = NSLocalizedString(@"MATCHES_TITLE", nil);
	
	self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
	self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:self.flowLayout];
	self.collectionView.delegate = self;
	self.collectionView.dataSource = self;
	self.collectionView.backgroundColor = [UIColor whiteColor];
	self.view = self.collectionView;
	
	[self.collectionView registerClass:[VSMatchCell class] forCellWithReuseIdentifier:kCellID];
	
	self.editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
																	target:self
																	action:@selector(pressedEditButton:)];
	self.addMatchButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"MATCHES_ADD_TITLE", nil)
														   style:UIBarButtonItemStylePlain
														  target:self
														  action:@selector(pressedAddButton:)];
	self.clearAllButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"MATCHES_CLEAR_TITLE", nil)
														   style:UIBarButtonItemStylePlain
														  target:self
														  action:@selector(pressedClearButton:)];
	self.deleteButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"MATCHES_DELETE_TITLE", nil)
														 style:UIBarButtonItemStylePlain
														target:self
														action:@selector(pressedDeleteButton:)];
	
	self.navigationItem.leftBarButtonItem = self.editButton;
	self.navigationItem.rightBarButtonItem = self.addMatchButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)pressedEditButton:(id)sender {
	self.editing = !self.editing;
	
	if (self.editing) {
		self.navigationItem.rightBarButtonItems = @[self.deleteButton, self.clearAllButton];
	} else {
		self.navigationItem.rightBarButtonItems = @[self.addMatchButton];
	}
}

- (void)pressedAddButton:(id)sender {
	NSLog(@"Add Me");
}

- (void)pressedClearButton:(id)sender {
	
}

- (void)pressedDeleteButton:(id)sender {
	
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return 100;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
	return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	VSMatchCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellID forIndexPath:indexPath];
	[self configureCell:cell atIndexPath:indexPath];
	return cell;
}

- (void)configureCell:(VSMatchCell *)cell atIndexPath:(NSIndexPath *)indexPath {
	[cell setMatchNumber:@(indexPath.row)];
	[cell setRedScore:@100];
	[cell setBlueScore:@50];
}

#pragma mark – UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
	return CGSizeMake(200, 150);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(40, 30, 20, 30);
}

@end
