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
	
	
	[self.controlsView addSubview:self.autonomousView];
	[self.controlsView addSubview:self.teleopView];
	self.teleopView.frame = CGRectMake(0, 488, 1024, 488);
	self.controlsView.contentSize = CGSizeMake(1024, 488 * 2);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)pressedModeChange:(id)sender {
	if (self.currentMode == Autonomous) {
		
	} else {
		
	}
}

- (void)resetView {
	
}

@end
