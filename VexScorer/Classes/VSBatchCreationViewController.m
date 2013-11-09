//
//  VSBatchCreationViewController.m
//  VexScorer
//
//  Created by Nicholas McGuire on 11/8/2013.
//  Copyright (c) 2013 RND Consulting. All rights reserved.
//

#import "VSBatchCreationViewController.h"

#import "Model/Match.h"
#import "Model/Score.h"

@interface VSBatchCreationViewController ()

@end

@implementation VSBatchCreationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	
//	self.createBatchButton.enabled = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pressedCreateButton:(id)sender {
	NSInteger initial = self.initialMatchTextField.text.integerValue,
	final = self.lastMatchTextField.text.integerValue,
	offset = self.matchOffsetTextField.text.integerValue;
	
	
	for (int i = initial; i <= final; i += offset) {
		Match *match = [Match create];
		match.redScore = [Score create];
		match.blueScore = [Score create];
		match.number = @(i);
	}
	
	[[CoreDataManager instance] saveContext];
	[self pressedCancelButton:sender];
}

- (void)pressedCancelButton:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}

//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//	if (self.initialMatchTextField.text.length && self.lastMatchTextField.text.length && self.matchOffsetTextField.text.length) {
//		self.createBatchButton.enabled = YES;
//	} else {
//		self.createBatchButton.enabled = NO;
//	}
//	
//	return YES;
//}
@end
