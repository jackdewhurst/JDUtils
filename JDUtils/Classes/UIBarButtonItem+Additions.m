//
//  UIBarButtonItem+Additions.m
//
//  Created by Jack Dewhurst on 10/10/2015.
//  Copyright (c) 2015 Jack Dewhurst. All rights reserved.
//

#import "UIBarButtonItem+Additions.h"
#import "JDAdditions.h"


@implementation UIBarButtonItem (Additions)


+ (UIBarButtonItem*)buttonWithImage:(UIImage*)image target:(id)target selector:(SEL)selector
{
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        
        image = [UIImage imageWithCGImage:image.CGImage scale:2 orientation:image.imageOrientation];
    
        return [[UIBarButtonItem alloc] initWithImage:image
                                                style:UIBarButtonItemStylePlain
                                               target:target
                                               action:selector];
    }
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setBackgroundImage:[image stretchableImageWithLeftCapWidth:7.0 topCapHeight:0.0]
                      forState:UIControlStateNormal];

    button.frame = CGRectMake(5.0,
                              0.0,
                              image.size.width * 0.5f,
                              image.size.height * 0.5f);

    [button addTarget:target
               action:selector
     forControlEvents:UIControlEventTouchUpInside];

    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0.0,
                                                         0.0,
                                                         button.frame.size.width + 5,
                                                         button.frame.size.height)];

    [v addSubview:button];

    return [[UIBarButtonItem alloc] initWithCustomView:v];
    
}



@end
