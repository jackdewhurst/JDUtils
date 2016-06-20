//
//  UINavigationBar+Additions.h
//
//  Created by Jack Dewhurst on 10/10/2015.
//  Copyright (c) 2015 Jack Dewhurst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Additions.h"

// Uncomment definition to set custom UINavigationBar height throughout app
//#define NAVBAR_HEIGHT 50.0f


@interface UINavigationBar (Additions)

- (void)hideBottomHairline;
- (void)showBottomHairline;

@end
