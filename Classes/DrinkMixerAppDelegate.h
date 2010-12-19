//
//  DrinkMixerAppDelegate.h
//  DrinkMixer
//
//  Created by Matt Bishop on 12/18/10.
//  Copyright 2010 iphone App development club. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrinkMixerAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

