//
//  VSScoringViewController.m
//  VexScorer
//
//  Created by Nick McGuire on 2013-10-22.
//  Copyright (c) 2013 RND Consulting. All rights reserved.
//

#import "VSScoringViewController.h"

#import "VSMatchListViewController.h"

#import "Model/Match.h"
#import "Model/Score.h"

@interface VSScoringViewController ()

@property (strong, nonatomic) UITapGestureRecognizer *matchTapGesture;

@end

@implementation VSScoringViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self.controlsView addSubview:self.autonomousView];
	[self.controlsView addSubview:self.teleopView];
	[self.controlsView addSubview:self.scoreView];
	self.teleopView.frame = CGRectMake(0, 488 * 1, 1024, 488);
	self.scoreView.frame = CGRectMake(0, 488 * 2, 1024, 488);
	self.controlsView.contentSize = CGSizeMake(1024, 488 * 3);
	
	self.matchTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pressedMatchLabel:)];
	[self.matchLabel addGestureRecognizer:self.matchTapGesture];
	
	VSMatchListViewController *matchListVC = [[VSMatchListViewController alloc] initWithStyle:UITableViewStylePlain];
	matchListVC.scoringViewController = self;
	UINavigationController *navContrller = [[UINavigationController alloc] initWithRootViewController:matchListVC];
	self.matchPickerPopover = [[UIPopoverController alloc] initWithContentViewController:navContrller];
	
	[self resetView];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	if ([defaults valueForKey:@"VSLastMatch"]) {
		
	} else {
		Match *match = [[Match all] sortedArrayUsingDescriptors:@[ [NSSortDescriptor sortDescriptorWithKey:@"number" ascending:YES] ]].first;
		self.currentMatch = match;
	}
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
	
	if (self.currentMatch.hasChanges) {
		[self.currentMatch save];
	}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)pressedMatchLabel:(id)sender {
	[self.matchPickerPopover presentPopoverFromRect:self.matchLabel.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

- (void)pressedModeChange:(id)sender {
	if (self.currentMode == VSModeAutonomous) {
		[self.controlsView setContentOffset:CGPointMake(0, 488 * 1) animated:YES];
	} else if (self.currentMode == VSModeTeleop) {
		[self.controlsView setContentOffset:CGPointMake(0, 488 * 2) animated:YES];
	} else if (self.currentMode == VSModeScore) {
		NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:[Match entityName]];
		request.predicate = [NSPredicate predicateWithFormat:@"number > %@", self.currentMatch.number];
		request.sortDescriptors = @[ [NSSortDescriptor sortDescriptorWithKey:@"number" ascending:YES] ];
		request.fetchLimit = 1;
		NSArray *matches = [[[CoreDataManager instance] managedObjectContext] executeFetchRequest:request error:nil];
		if (matches.count) {
			self.currentMatch = matches.first;
		} else {
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oh no!" message:@"There are no more matches!\n\n Tap on the Match heading to select a specific match." delegate:nil cancelButtonTitle:@"Okay!" otherButtonTitles:nil];
			[alert show];
		}
	}
}

- (void)updateAutonomousScore:(UIButton *)sender {
	NSInteger points = (sender.tag % 2 == 0) ? -1 : 1;
	
	if (sender.tag == 0 || sender.tag == 1) {
		self.currentMatch.redScore.autonomousValue += points;
		self.redAutonomousScoreLabel.text = [self.currentMatch.redScore.autonomous stringValue];
	} else if (sender.tag == 2 || sender.tag == 3) {
		self.currentMatch.blueScore.autonomousValue += points;
		self.blueAutonomousScoreLabel.text = [self.currentMatch.blueScore.autonomous stringValue];
	}
}

- (IBAction)updateCornerScore:(UIButton *)sender {
	NSInteger points = (sender.tag % 2 == 0) ? -1 : 1;
	
	if (sender.tag == 0 || sender.tag == 1) {
		self.currentMatch.redScore.cornerValue += points;
		self.redCornerScoreLabel.text = [self.currentMatch.redScore.corner stringValue];
	} else if (sender.tag == 2 || sender.tag == 3) {
		self.currentMatch.blueScore.cornerValue += points;
		self.blueCornerScoreLabel.text = [self.currentMatch.blueScore.corner stringValue];
	}
}

- (IBAction)updateGoalScore:(UIButton *)sender {
	NSInteger points = (sender.tag % 2 == 0) ? -1 : 1;
	
	if (sender.tag == 0 || sender.tag == 1) {
		self.currentMatch.redScore.goalValue += points;
		self.redGoalScoreLabel.text = [self.currentMatch.redScore.goal stringValue];
	} else if (sender.tag == 2 || sender.tag == 3) {
		self.currentMatch.blueScore.goalValue += points;
		self.blueGoalScoreLabel.text = [self.currentMatch.blueScore.goal stringValue];
	}
}

- (IBAction)updateFinaleScore:(UIButton *)sender {
	NSInteger points = (sender.tag % 2 == 0) ? -1 : 1;
	
	if (sender.tag == 0 || sender.tag == 1) {
		self.currentMatch.redScore.finaleValue += points;
		self.redFinaleScoreLabel.text = [self.currentMatch.redScore.finale stringValue];
	} else if (sender.tag == 2 || sender.tag == 3) {
		self.currentMatch.blueScore.finaleValue += points;
		self.blueFinaleScoreLabel.text = [self.currentMatch.blueScore.finale stringValue];
	}
}

- (void)updateModeLabel {
	if (self.currentMode == VSModeAutonomous) {
		[self.modeButton setTitle:@"Next" forState:UIControlStateNormal];
		self.modeLabel.text = @"Autonomous";
	} else if (self.currentMode == VSModeTeleop) {
		[self.modeButton setTitle:@"Finished" forState:UIControlStateNormal];
		self.modeLabel.text = @"Teleop";
	} else if (self.currentMode == VSModeScore) {
		[self.modeButton setTitle:@"Next Match" forState:UIControlStateNormal];
		self.modeLabel.text = @"Scores";
		
		self.redScoreLabel.text = [self.currentMatch.redScore.finalScore stringValue];
		self.blueScoreLabel.text = [self.currentMatch.blueScore.finalScore stringValue];
	}
}

- (void)resetView {
	NSArray *labels = @[self.redAutonomousScoreLabel, self.redCornerScoreLabel, self.redFinaleScoreLabel, self.redGoalScoreLabel, self.blueAutonomousScoreLabel, self.blueCornerScoreLabel, self.blueFinaleScoreLabel, self.blueGoalScoreLabel];
	for (UILabel *label in labels) {
		label.text = @"0";
	}
	
	self.currentMode = VSModeAutonomous;
	self.controlsView.contentOffset = CGPointMake(0, 0);
	[self updateModeLabel];
}

- (void)setupViewWithMatch:(Match *)match {
	self.matchLabel.text = [NSString stringWithFormat:@"Match %@", match.number];
	
	self.redAutonomousScoreLabel.text = [match.redScore.autonomous stringValue];
	self.redCornerScoreLabel.text = [match.redScore.corner stringValue];
	self.redFinaleScoreLabel.text = [match.redScore.finale stringValue];
	self.redGoalScoreLabel.text = [match.redScore.goal stringValue];
	
	self.blueAutonomousScoreLabel.text = [match.blueScore.autonomous stringValue];
	self.blueCornerScoreLabel.text = [match.blueScore.corner stringValue];
	self.blueFinaleScoreLabel.text = [match.blueScore.finale stringValue];
	self.blueGoalScoreLabel.text = [match.blueScore.goal stringValue];
}

- (void)updateAfterScroll:(UIScrollView *)scrollView {
	NSInteger page = (scrollView.contentOffset.y / scrollView.frame.size.height);
	self.currentMode = page;
	[self updateModeLabel];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
	[self updateAfterScroll:scrollView];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
	[self updateAfterScroll:scrollView];
}

- (void)setCurrentMatch:(Match *)currentMatch {
	_currentMatch = currentMatch;
	
	[self resetView];
	[self setupViewWithMatch:_currentMatch];
}

@end
