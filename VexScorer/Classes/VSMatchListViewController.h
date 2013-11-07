//
//  VSMatchListViewController.h
//  VexScorer
//
//  Created by Nick McGuire on 10/29/2013.
//  Copyright (c) 2013 RND Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Match, VSScoringViewController;

@interface VSMatchListViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@property (strong, nonatomic) VSScoringViewController *scoringViewController;

@end
