//
//  VSScoringViewController.h
//  VexScorer
//
//  Created by Nick McGuire on 2013-10-22.
//  Copyright (c) 2013 RND Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, VSModes) {
	Teleop,
	Autonomous
};

@interface VSScoringViewController : UIViewController

@property (nonatomic) VSModes currentMode;

@property (weak, nonatomic) IBOutlet UIScrollView *controlsView;
@property (weak, nonatomic) IBOutlet UIView *autonomousView;
@property (weak, nonatomic) IBOutlet UIView *teleopView;

- (IBAction)pressedModeChange:(id)sender;
@end
