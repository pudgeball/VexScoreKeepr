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
@property (strong, nonatomic) UIPopoverController *matchPickerPopover;

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
	self.teleopView.frame = CGRectMake(0, 488, 1024, 488);
	self.controlsView.contentSize = CGSizeMake(1024, 488 * 2);
	
	self.matchTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pressedMatchLabel:)];
	[self.matchLabel addGestureRecognizer:self.matchTapGesture];
	
	VSMatchListViewController *matchListVC = [[VSMatchListViewController alloc] initWithStyle:UITableViewStylePlain];
	matchListVC.scoringViewController = self;
	UINavigationController *navContrller = [[UINavigationController alloc] initWithRootViewController:matchListVC];
	self.matchPickerPopover = [[UIPopoverController alloc] initWithContentViewController:navContrller];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self resetView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)pressedMatchLabel:(id)sender {
	[self.matchPickerPopover presentPopoverFromRect:self.matchLabel.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

- (void)pressedModeChange:(id)sender {
	if (self.currentMode == Autonomous) {
		[self.controlsView setContentOffset:CGPointMake(0, 488) animated:YES];
	} else if (self.currentMode == Teleop) {
		
	}
}

- (void)updateAutonomousScore:(UIButton *)sender {
	NSInteger points = (sender.tag % 2 == 0) ? -1 : 1;
	if (sender.tag == 0 || sender.tag == 1) {
		self.redAutonomousScoreLabel.text = [@(self.redAutonomousScoreLabel.text.integerValue + points) stringValue];
	} else if (sender.tag == 2 || sender.tag == 3) {
		self.blueAutonomousScoreLabel.text = [@(self.blueAutonomousScoreLabel.text.integerValue + points) stringValue];
	}
}

- (IBAction)updateCornerScore:(UIButton *)sender {
	NSInteger points = (sender.tag % 2 == 0) ? -1 : 1;
	if (sender.tag == 0 || sender.tag == 1) {
		self.redCornerScoreLabel.text = [@(self.redCornerScoreLabel.text.integerValue + points) stringValue];
	} else if (sender.tag == 2 || sender.tag == 3) {
		self.blueCornerScoreLabel.text = [@(self.blueCornerScoreLabel.text.integerValue + points) stringValue];
	}
}

- (IBAction)updateGoalScore:(UIButton *)sender {
	NSInteger points = (sender.tag % 2 == 0) ? -1 : 1;
	if (sender.tag == 0 || sender.tag == 1) {
		self.redGoalScoreLabel.text = [@(self.redGoalScoreLabel.text.integerValue + points) stringValue];
	} else if (sender.tag == 2 || sender.tag == 3) {
		self.blueGoalScoreLabel.text = [@(self.blueGoalScoreLabel.text.integerValue + points) stringValue];
	}
}

- (IBAction)updateFinaleScore:(UIButton *)sender {
	NSInteger points = (sender.tag % 2 == 0) ? -1 : 1;
	if (sender.tag == 0 || sender.tag == 1) {
		self.redFinaleScoreLabel.text = [@(self.redFinaleScoreLabel.text.integerValue + points) stringValue];
	} else if (sender.tag == 2 || sender.tag == 3) {
		self.blueFinaleScoreLabel.text = [@(self.blueFinaleScoreLabel.text.integerValue + points) stringValue];
	}
}

- (void)updateModeLabel {
	if (self.currentMode == Autonomous) {
		[self.modeButton setTitle:@"Next" forState:UIControlStateNormal];
		self.modeLabel.text = @"Autonomous";
	} else if (self.currentMode == Teleop) {
		[self.modeButton setTitle:@"Finished" forState:UIControlStateNormal];
		self.modeLabel.text = @"Teleop";
	}
}

- (void)resetView {
	NSArray *labels = @[self.redAutonomousScoreLabel, self.redCornerScoreLabel, self.redFinaleScoreLabel, self.redGoalScoreLabel, self.blueAutonomousScoreLabel, self.blueCornerScoreLabel, self.blueFinaleScoreLabel, self.blueGoalScoreLabel];
	for (UILabel *label in labels) {
		label.text = @"0";
	}
	
	self.currentMode = Autonomous;
	self.controlsView.contentOffset = CGPointMake(0, 0);
	[self updateModeLabel];
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
	
	//MORE MATCH STUFF
}

@end
