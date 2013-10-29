//
//  VSScoringViewController.h
//  VexScorer
//
//  Created by Nick McGuire on 2013-10-22.
//  Copyright (c) 2013 RND Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, VSModes) {
	Autonomous,
	Teleop
};

@interface VSScoringViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic) VSModes currentMode;

@property (weak, nonatomic) IBOutlet UIScrollView *controlsView;
@property (weak, nonatomic) IBOutlet UIView *autonomousView;
@property (weak, nonatomic) IBOutlet UILabel *redAutonomousScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *blueAutonomousScoreLabel;


@property (weak, nonatomic) IBOutlet UIView *teleopView;
@property (weak, nonatomic) IBOutlet UILabel *redCornerScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *redGoalScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *redFinaleScoreLabel;





- (IBAction)pressedModeChange:(id)sender;

- (IBAction)updateAutonomousScore:(UIButton *)sender;
- (IBAction)updateCornerScore:(UIButton *)sender;
- (IBAction)updateGoalScore:(UIButton *)sender;
- (IBAction)updateFinaleScore:(UIButton *)sender;

@end
