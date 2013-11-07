//
//  VSMatchesViewController.m
//  VexScorer
//
//  Created by Nick McGuire on 2013-10-22.
//  Copyright (c) 2013 RND Consulting. All rights reserved.
//

#import "VSMatchesViewController.h"

#import "VSMatchCell.h"
#import "Model/Match.h"
#import "Model/Score.h"

static NSString * kCellID = @"MatchCellID";
static NSString * kCacheName = @"VSMatchesCache";

@interface VSMatchesViewController ()

@property (strong, nonatomic) UICollectionViewFlowLayout *flowLayout;

@property (strong, nonatomic) UIBarButtonItem *editButton;
@property (strong, nonatomic) UIBarButtonItem *addMatchButton;
@property (strong, nonatomic) UIBarButtonItem *clearAllButton;
@property (strong, nonatomic) UIBarButtonItem *deleteButton;

@property (strong, nonatomic) NSMutableArray *objectChanges;
@property (strong, nonatomic) NSMutableArray *sectionChanges;

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
	
	_objectChanges = [NSMutableArray array];
    _sectionChanges = [NSMutableArray array];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
	[NSFetchedResultsController deleteCacheWithName:kCacheName];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSFetchedResultsController *)fetchedResultsController {
	if (_fetchedResultsController) return _fetchedResultsController;
	
	NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:[Match entityName]];
	request.sortDescriptors = @[ [NSSortDescriptor sortDescriptorWithKey:@"number" ascending:NO] ];
	
	_fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
																	managedObjectContext:[[CoreDataManager instance] managedObjectContext]
																	  sectionNameKeyPath:nil
																			   cacheName:kCacheName];
	self.fetchedResultsController.delegate = self;
	
	NSError *error = nil;
	if (![self.fetchedResultsController performFetch:&error]) {
		NSLog(@"Error fetching matches: %@", error);
	}
	
	return _fetchedResultsController;
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
	Match *match = [Match insertInManagedObjectContext:[[CoreDataManager instance] managedObjectContext]];
	match.number = @100;
	NSLog(@"woo, %@", match);
	[[CoreDataManager instance] saveContext];
}

- (void)pressedClearButton:(id)sender {
	
}

- (void)pressedDeleteButton:(id)sender {
	
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController.sections objectAtIndex:section];
	return [sectionInfo numberOfObjects];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
	return [self.fetchedResultsController.sections count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	VSMatchCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellID forIndexPath:indexPath];
	[self configureCell:cell atIndexPath:indexPath];
	return cell;
}

- (void)configureCell:(VSMatchCell *)cell atIndexPath:(NSIndexPath *)indexPath {
	Match *match = [self.fetchedResultsController objectAtIndexPath:indexPath];
	[cell setMatchNumber:match.number];
	[cell setRedScore:match.redScore.finalScore];
	[cell setBlueScore:match.blueScore.finalScore];
}

#pragma mark – UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
	return CGSizeMake(200, 150);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(40, 30, 20, 30);
}

//To allow me to use NSFetchedResultsController with UICollectionView I'm using this code from
// https://github.com/AshFurrow/UICollectionView-NSFetchedResultsController
- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    NSMutableDictionary *change = [NSMutableDictionary new];
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            change[@(type)] = @(sectionIndex);
            break;
        case NSFetchedResultsChangeDelete:
            change[@(type)] = @(sectionIndex);
            break;
    }
    
    [_sectionChanges addObject:change];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath {
	
    NSMutableDictionary *change = [NSMutableDictionary new];
    switch(type) {
        case NSFetchedResultsChangeInsert:
            change[@(type)] = newIndexPath;
            break;
        case NSFetchedResultsChangeDelete:
            change[@(type)] = indexPath;
            break;
        case NSFetchedResultsChangeUpdate:
            change[@(type)] = indexPath;
            break;
        case NSFetchedResultsChangeMove:
            change[@(type)] = @[indexPath, newIndexPath];
            break;
    }
    [_objectChanges addObject:change];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
	if ([_sectionChanges count] > 0) {
		[self.collectionView performBatchUpdates:^{
			for (NSDictionary *change in _sectionChanges) {
				[change enumerateKeysAndObjectsUsingBlock:^(NSNumber *key, id obj, BOOL *stop) {
					
					NSFetchedResultsChangeType type = [key unsignedIntegerValue];
					switch (type) {
						case NSFetchedResultsChangeInsert:
							[self.collectionView insertSections:[NSIndexSet indexSetWithIndex:[obj unsignedIntegerValue]]];
							break;
						case NSFetchedResultsChangeDelete:
							[self.collectionView deleteSections:[NSIndexSet indexSetWithIndex:[obj unsignedIntegerValue]]];
							break;
						case NSFetchedResultsChangeUpdate:
							[self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:[obj unsignedIntegerValue]]];
							break;
					}
				}];
			}
		} completion:nil];
	}
	
	if ([_objectChanges count] > 0 && [_sectionChanges count] == 0) {
		if ([self shouldReloadCollectionViewToPreventKnownIssue] || self.collectionView.window == nil) {
			// This is to prevent a bug in UICollectionView from occurring.
			// The bug presents itself when inserting the first object or deleting the last object in a collection view.
			// http://stackoverflow.com/questions/12611292/uicollectionview-assertion-failure
			// This code should be removed once the bug has been fixed, it is tracked in OpenRadar
			// http://openradar.appspot.com/12954582
			[self.collectionView reloadData];
		} else {
			[self.collectionView performBatchUpdates:^{
				for (NSDictionary *change in _objectChanges) {
					[change enumerateKeysAndObjectsUsingBlock:^(NSNumber *key, id obj, BOOL *stop) {
						NSFetchedResultsChangeType type = [key unsignedIntegerValue];
						switch (type) {
							case NSFetchedResultsChangeInsert:
								[self.collectionView insertItemsAtIndexPaths:@[obj]];
								break;
							case NSFetchedResultsChangeDelete:
								[self.collectionView deleteItemsAtIndexPaths:@[obj]];
								break;
							case NSFetchedResultsChangeUpdate:
								[self.collectionView reloadItemsAtIndexPaths:@[obj]];
								break;
							case NSFetchedResultsChangeMove:
								[self.collectionView moveItemAtIndexPath:obj[0] toIndexPath:obj[1]];
								break;
						}
					}];
				}
			} completion:nil];
		}
	}
	
	[_sectionChanges removeAllObjects];
	[_objectChanges removeAllObjects];
}

- (BOOL)shouldReloadCollectionViewToPreventKnownIssue {
    __block BOOL shouldReload = NO;
    for (NSDictionary *change in self.objectChanges) {
        [change enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            NSFetchedResultsChangeType type = [key unsignedIntegerValue];
            NSIndexPath *indexPath = obj;
            switch (type) {
                case NSFetchedResultsChangeInsert:
                    if ([self.collectionView numberOfItemsInSection:indexPath.section] == 0) {
                        shouldReload = YES;
                    } else {
                        shouldReload = NO;
                    }
                    break;
                case NSFetchedResultsChangeDelete:
                    if ([self.collectionView numberOfItemsInSection:indexPath.section] == 1) {
                        shouldReload = YES;
                    } else {
                        shouldReload = NO;
                    }
                    break;
                case NSFetchedResultsChangeUpdate:
                    shouldReload = NO;
                    break;
                case NSFetchedResultsChangeMove:
                    shouldReload = NO;
                    break;
            }
        }];
    }
    return shouldReload;
}

@end
