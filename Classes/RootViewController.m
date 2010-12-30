//
//  RootViewController.m
//  DrinkMixer
//
//  Created by Matt Bishop on 12/18/10.
//  Copyright 2010 iphone App development club. All rights reserved.
//

#import "RootViewController.h"
#import "DrinkDetailViewController.h"
#import "DrinkConstants.h"
#import "AddDrinkViewController.h"

@implementation RootViewController
@synthesize drinks, addButtonItem;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
	NSString *path = [[NSBundle mainBundle] pathForResource:@"DrinkDirections" ofType:@"plist"];
	
	NSMutableArray* tmpArray = [[NSMutableArray alloc] initWithContentsOfFile:path];
	self.drinks = tmpArray;
	[tmpArray release];
	
	self.navigationItem.rightBarButtonItem = self.addButtonItem;
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillTerminate:) name: UIApplicationWillTerminateNotification object:nil];
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	[self.tableView reloadData];
}

/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */


#pragma mark -
#pragma mark Table view data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.drinks count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.
	cell.textLabel.text = [[self.drinks objectAtIndex:indexPath.row]objectForKey:NAME_KEY];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	
	 DrinkDetailViewController *drinkDetailViewController = [[DrinkDetailViewController alloc] initWithNibName:@"DrinkDetailViewController" bundle:nil];
     
	drinkDetailViewController.drink = [self.drinks objectAtIndex:indexPath.row];
	 [self.navigationController pushViewController:drinkDetailViewController animated:YES];
	 [drinkDetailViewController release];
	 
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	[[NSNotificationCenter defaultCenter] removeObserver:self];
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void) applicationWillTerminate:(NSNotification *) notification{
	NSString *path = [[NSBundle mainBundle] pathForResource:@"DrinkDirections" ofType:@"plist"];
	[self.drinks writeToFile:path atomically:YES];
}

- (IBAction) addButtonPressed: (id)sender{
	
	//NSLog(@"Add Button pressed!");
	AddDrinkViewController *addDrinkVC = [[AddDrinkViewController alloc] initWithNibName:@"DrinkDetailViewController" bundle:nil];
	UINavigationController *addNavCon = [[UINavigationController alloc] initWithRootViewController:addDrinkVC];
	addDrinkVC.drinkArray = self.drinks;
	[self presentModalViewController:addNavCon animated:YES];
	[addDrinkVC release];
	[addNavCon release];
}


- (void)dealloc {
	[drinks release];
	[addButtonItem release];
    [super dealloc];
	}


@end

