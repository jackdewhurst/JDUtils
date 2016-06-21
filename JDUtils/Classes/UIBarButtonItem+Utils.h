//
//  UIBarButtonItem+Utils.h
//  JDUtils
//
//  Created by Jack Dewhurst on 10/10/2015.
//  Copyright (c) 2015 Jack Dewhurst. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIBarButtonItem (Utils)

+ (UIBarButtonItem*)buttonWithImage:(UIImage*)image target:(id)target selector:(SEL)selector;

@end
