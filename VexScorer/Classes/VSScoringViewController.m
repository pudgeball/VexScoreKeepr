//
//  VSScoringViewController.m
//  VexScorer
//
//  Created by Nick McGuire on 2013-10-22.
//  Copyright (c) 2013 RND Consulting. All rights reserved.
//

#import "VSScoringViewController.h"

@interface VSScoringViewController ()

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
	self.currentMode = Autonomous;
	
	[self.controlsView addSubview:self.autonomousView];
	[self.controlsView addSubview:self.teleopView];
	self.teleopView.frame = CGRectMake(0, 488, 1024, 488);
	self.controlsView.contentSize = CGSizeMake(1024, 488 * 2);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)pressedModeChange:(id)sender {
	if (self.currentMode == Autonomous) {
		[self.controlsView setContentOffset:CGPointMake(0, 488) animated:YES];
	} else {
		
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
		self.redAutonomousScoreLabel.text = [@(self.redAutonomousScoreLabel.text.integerValue + points) stringValue];
	} else if (sender.tag == 2 || sender.tag == 3) {
		self.blueAutonomousScoreLabel.text = [@(self.blueAutonomousScoreLabel.text.integerValue + points) stringValue];
	}
}

- (IBAction)updateGoalScore:(UIButton *)sender {
	NSInteger points = (sender.tag % 2 == 0) ? -1 : 1;
	if (sender.tag == 0 || sender.tag == 1) {
		self.redAutonomousScoreLabel.text = [@(self.redAutonomousScoreLabel.text.integerValue + points) stringValue];
	} else if (sender.tag == 2 || sender.tag == 3) {
		self.blueAutonomousScoreLabel.text = [@(self.blueAutonomousScoreLabel.text.integerValue + points) stringValue];
	}
}

- (IBAction)updateFinaleScore:(UIButton *)sender {
	NSInteger points = (sender.tag % 2 == 0) ? -1 : 1;
	if (sender.tag == 0 || sender.tag == 1) {
		self.redAutonomousScoreLabel.text = [@(self.redAutonomousScoreLabel.text.integerValue + points) stringValue];
	} else if (sender.tag == 2 || sender.tag == 3) {
		self.blueAutonomousScoreLabel.text = [@(self.blueAutonomousScoreLabel.text.integerValue + points) stringValue];
	}
}

- (void)resetView {
	
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
	NSInteger page = (scrollView.contentOffset.y / scrollView.frame.size.height);
	self.currentMode = page;
}

@end
