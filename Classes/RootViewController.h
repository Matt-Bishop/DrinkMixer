//
//  RootViewController.h
//  DrinkMixer
//
//  Created by Matt Bishop on 12/18/10.
//  Copyright 2010 iphone App development club. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController {
	
	NSMutableArray* drinks;
}

@property(nonatomic, retain) NSMutableArray* drinks;

@end
