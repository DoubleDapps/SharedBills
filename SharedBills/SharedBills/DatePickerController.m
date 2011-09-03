//
//  DatePickerController.m
//  SharedBills
//
//  Created by Donny Amfahr on 9/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DatePickerController.h"

@implementation DatePickerController

@synthesize datePicker;
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    self.view = [[[UIView alloc] init] autorelease];
    self.datePicker = [[[UIDatePicker alloc] init] autorelease];
    [self.view addSubview:self.datePicker];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Done" forState:UIControlStateNormal];
    button.center = CGPointMake(160,230);
    [button addTarget:self action:@selector(done) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
    
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) done {
    [delegate datePickerController:self didPickDate:datePicker.date];
}

- (void) dealloc {
    [datePicker release];
    [super dealloc];
}

@end
