//
//  AddDrinkViewController.h
//  DrinkMixer
//
//  Created by Matt Bishop on 12/27/10.
//  Copyright 2010 iphone App development club. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrinkDetailViewController.h"


@interface AddDrinkViewController : DrinkDetailViewController {
	BOOL keyboardVisible;
	NSMutableArray *drinkArray;
}

@property (nonatomic, retain)NSMutableArray* drinkArray;

- (void) keyboardDidShow: (NSNotification*) notif;
- (void) keyboardDidHide: (NSNotification*) notif;
- (IBAction) save: (id) sender;
- (IBAction) cancel: (id) sender;
@end
