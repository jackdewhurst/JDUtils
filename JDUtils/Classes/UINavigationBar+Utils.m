//
//  UINavigationBar+Utils.m
//  JDUtils
//
//  Created by Jack Dewhurst on 10/10/2015.
//  Copyright (c) 2015 Jack Dewhurst. All rights reserved.
//

#import "UINavigationBar+Utils.h"

@implementation UINavigationBar (Utils)



- (CGSize)sizeThatFits:(CGSize)size
{
    CGSize newSize = CGSizeMake(self.frame.size.width, JD_NAVBAR_HEIGHT);
    
    for (UIView *view in self.subviews) {
    
        if (view.width > self.width - 20)
            continue;
        
        view.centerY = (JD_NAVBAR_HEIGHT / 2) - 1;
    }

    return newSize;
}




/**
 * Hide 1px hairline of the nav bar
 */
- (void)hideBottomHairline
{
    UIImageView *navBarHairlineImageView = [self findHairlineImageViewUnder:self];
    navBarHairlineImageView.hidden = YES;
}





/**
 * Show 1px hairline of the nav bar
 */
- (void)showBottomHairline
{
    // Show 1px hairline of translucent nav bar
    UIImageView *navBarHairlineImageView = [self findHairlineImageViewUnder:self];
    navBarHairlineImageView.hidden = NO;
}




- (UIImageView *)findHairlineImageViewUnder:(UIView *)view
{
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}




@end
