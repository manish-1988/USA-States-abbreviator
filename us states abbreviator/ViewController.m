//
//  ViewController.m
//  us states abbreviator
//
//  Created by sudeep on 24/03/14.
//  Copyright (c) 2014 esense. All rights reserved.
//

#import "ViewController.h"
#import "USStatesAbbreviator.h"

@interface ViewController () {
    IBOutlet UITextField *locationTextField;
    IBOutlet UILabel *outputLabel;
}

@end

@implementation ViewController

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
    // Do any additional setup after loading the view from its nib.
    
    //[self createPlist];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - User methods

-(IBAction)click {
    USStatesAbbreviator *object = [[USStatesAbbreviator alloc] init];
    NSString *output = [object abbreviateStateOfLocationWithName:locationTextField.text];
    [outputLabel setText:output];
}

@end
