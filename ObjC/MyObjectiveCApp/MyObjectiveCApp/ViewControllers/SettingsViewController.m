//
//  SettingsViewController.m
//  MyObjectiveCApp
//
//  Created by aleksandar.aleksic on 16.7.21..
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController
@synthesize slVol, lbVol, sgDiff, lbDiff;
@synthesize tfName, tfEmail, lbName, lbEmail;

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder] ;
}

-(IBAction)saveData:(id)sender
{
    lbName.text = tfName.text;
//    [lbEmail setText:tfEmail.text] Access var directly
    [lbEmail setText:[tfEmail text]]; //access var by set or get method
}

-(IBAction)sliderValueChanged:(id)sender
{
    [self updateSliderLabel];
}

- (void) updateSliderLabel
{
    float vol = slVol.value;
    NSString *strVol = [NSString stringWithFormat:@"%.2f", vol];
    lbVol.text = strVol;
    
}

-(void)updateSegmentLabel
{
    NSString *str = [sgDiff  titleForSegmentAtIndex:sgDiff.selectedSegmentIndex];
    NSString *textLabel = [NSString stringWithFormat:@"Difficulty: %@", str];
    lbDiff.text = textLabel;
}

-(IBAction)segmentDidChanged:(id)sender
{
    [self updateSegmentLabel];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateSliderLabel];
    [self updateSegmentLabel];
}



@end
