//
//  DrinkDetailViewController.m
//  DrinkMixer
//
//  Created by Matt Bishop on 12/18/10.
//  Copyright 2010 iphone App development club. All rights reserved.
//

#import "DrinkDetailViewController.h"
#import "DrinkConstants.h"


@implementation DrinkDetailViewController
@synthesize drink,nameTextField, ingredientsTextView, directionsTextView, scrollView;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

-(void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	nameTextField.text = [drink objectForKey:NAME_KEY];
	ingredientsTextView.text = [drink objectForKey:INGREDIENTS_KEY];
	directionsTextView.text = [drink objectForKey:DIRECTIONS_KEY];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	//nameTextField.userInteractionEnabled = NO;
	scrollView.contentSize = self.view.frame.size;
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[scrollView release];
    [nameTextField release];
	[ingredientsTextView release];
	[directionsTextView release];
	[drink release];
	[super dealloc];
	
}


@end
