//
//  UIFont+Utils.m
//  JDUtils
//
//  Created by Jack Dewhurst on 10/10/2015.
//  Copyright (c) 2015 Jack Dewhurst. All rights reserved.
//

#import "UIFont+Utils.h"


@implementation UIFont (Utils)


+ (void)NSLogInstalledFonts
{
    NSArray *familyNames = [[NSArray alloc] initWithArray:[UIFont familyNames]];
    
    NSArray *fontNames;
    NSInteger indFamily, indFont;
    for (indFamily=0; indFamily<[familyNames count]; ++indFamily)
    {
        NSLog(@"Family name: %@", [familyNames objectAtIndex:indFamily]);
        fontNames = [[NSArray alloc] initWithArray:
                     [UIFont fontNamesForFamilyName:
                      [familyNames objectAtIndex:indFamily]]];
        for (indFont=0; indFont<[fontNames count]; ++indFont)
        {
            NSLog(@"    Font name: %@", [fontNames objectAtIndex:indFont]);
        }
    }
}




+ (UIFont*)fontWithMacro:(NSString*)macro size:(float)size
{
    if (macro == nil) {
        return [UIFont systemFontOfSize:size];
    }
    
    return [UIFont fontWithName:macro size:size];
}




+ (UIFont*)logoFontWithSize:(float)size
{
    return [UIFont fontWithMacro:JD_LOGO_FONT size:size];
}




+ (UIFont*)appBoldWithSize:(float)size
{
    return [UIFont fontWithMacro:JD_APP_BOLD_FONT size:size];

}




+ (UIFont*)appRegularWithSize:(float)size
{
    return [UIFont fontWithMacro:JD_APP_FONT size:size];

}




+ (UIFont*)appLightWithSize:(float)size
{
    return [UIFont fontWithMacro:JD_APP_LIGHT_FONT size:size];

}




@end
