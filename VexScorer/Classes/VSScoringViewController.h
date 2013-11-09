//
//  VSScoringViewController.h
//  VexScorer
//
//  Created by Nick McGuire on 2013-10-22.
//  Copyright (c) 2013 RND Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, VSModes) {
	VSModeAutonomous,
	VSModeTeleop,
	VSModeScore
};

@class Match, Score;

@interface VSScoringViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic) VSModes currentMode;

@property (strong, nonatomic) Match *currentMatch;

@property (strong, nonatomic) UIPopoverController *matchPickerPopover;


@property (weak, nonatomic) IBOutlet UIScrollView *controlsView;
@property (weak, nonatomic) IBOutlet UIButton *modeButton;
@property (weak, nonatomic) IBOutlet UILabel *matchLabel;
@property (weak, nonatomic) IBOutlet UILabel *modeLabel;

@property (weak, nonatomic) IBOutlet UIView *autonomousView;
@property (weak, nonatomic) IBOutlet UILabel *redAutonomousScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *blueAutonomousScoreLabel;

@property (weak, nonatomic) IBOutlet UIView *teleopView;
@property (weak, nonatomic) IBOutlet UILabel *redCornerScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *redGoalScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *redFinaleScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *blueCornerScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *blueGoalScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *blueFinaleScoreLabel;

@property (weak, nonatomic) IBOutlet UIView *scoreView;
@property (weak, nonatomic) IBOutlet UILabel *redScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *blueScoreLabel;


- (IBAction)updateAutonomousScore:(UIButton *)sender;
- (IBAction)updateCornerScore:(UIButton *)sender;
- (IBAction)updateGoalScore:(UIButton *)sender;
- (IBAction)updateFinaleScore:(UIButton *)sender;

- (IBAction)pressedModeChange:(id)sender;

@end
