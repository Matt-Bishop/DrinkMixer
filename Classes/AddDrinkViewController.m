    //
//  AddDrinkViewController.m
//  DrinkMixer
//
//  Created by Matt Bishop on 12/27/10.
//  Copyright 2010 iphone App development club. All rights reserved.
//

#import "AddDrinkViewController.h"
#import "DrinkConstants.h"

@implementation AddDrinkViewController

@synthesize drinkArray;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)] autorelease];
	self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)] autorelease];

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

- (void) viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	NSLog(@"Registering for keyboard events");
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector (keyboardDidShow:) name: UIKeyboardDidShowNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector (keyboardDidHide:) name: UIKeyboardDidHideNotification object:nil];
	//Initially the keyboard is hidden so reset the variable
	keyboardVisible = NO;
	
	if (self.drink != nil) {
		nameTextField.text = [self.drink objectForKey:NAME_KEY];
		ingredientsTextView.text = [self.drink objectForKey:INGREDIENTS_KEY];
		directionsTextView.text = [self.drink objectForKey:DIRECTIONS_KEY];
	}
}

- (void) viewWillDisappear:(BOOL)animated{
	NSLog(@"Unregistering for keyboard events");
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void) keyboardDidShow: (NSNotification*) notif{
	if (keyboardVisible){
		return;
	}
	NSDictionary* info = [notif userInfo];
	NSValue* aValue = [info objectForKey:UIKeyboardBoundsUserInfoKey];
	CGSize keyboardSize = [aValue CGRectValue].size;
	CGRect viewFrame = self.view.frame;
	viewFrame.size.height -= keyboardSize.height;
	scrollView.frame = viewFrame;
	keyboardVisible = YES;
}

- (void) keyboardDidHide: (NSNotification*) notif{
	if (!keyboardVisible){
		return;
	}
	NSDictionary* info = [notif userInfo];
	NSValue* aValue = [info objectForKey:UIKeyboardBoundsUserInfoKey];
	CGSize keyboardSize = [aValue CGRectValue].size;
	CGRect viewFrame = self.view.frame;
	viewFrame.size.height += keyboardSize.height;
	scrollView.frame = viewFrame;
	keyboardVisible = NO;
}

#pragma mark -
#pragma mark save and cancel

- (IBAction) save: (id) sender{
	NSLog(@"SavePressed!");
	if (drink != nil) {
		[drinkArray removeObject:drink];
		self.drink = nil;
	}
	NSMutableDictionary* newDrink = [[NSMutableDictionary alloc] init];
	[newDrink setValue:nameTextField.text forKey: NAME_KEY];
	[newDrink setValue:ingredientsTextView.text forKey: INGREDIENTS_KEY];
	[newDrink setValue:directionsTextView.text forKey: DIRECTIONS_KEY];
	[drinkArray addObject:newDrink];
	
	NSSortDescriptor *nameSorter = [[NSSortDescriptor alloc] initWithKey:NAME_KEY ascending:YES selector:@selector(caseInsensitiveCompare:)];
	[drinkArray sortUsingDescriptors:[NSArray arrayWithObject:nameSorter]];
	[nameSorter release];
	[newDrink release];
	[self dismissModalViewControllerAnimated:YES];
}

- (IBAction) cancel: (id) sender{
	NSLog(@"Cancel Pressed!");
	[self dismissModalViewControllerAnimated:YES];
}

- (void)dealloc {
	[drinkArray release];
    [super dealloc];
}


@end
