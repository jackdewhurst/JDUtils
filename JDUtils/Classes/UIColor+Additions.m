//
//  UIColor+Additions.m
//
//  Created by Jack Dewhurst on 10/10/2015.
//  Copyright (c) 2015 Jack Dewhurst. All rights reserved.
//

#import "UIColor+Additions.h"


@implementation UIColor (Additions)


+ (UIColor *)colorWithR:(float)R G:(float)G B:(float)B A:(float)A
{
    return [UIColor colorWithRed:R/255.0f
                           green:G/255.0f
                            blue:B/255.0f
                           alpha:A];
}




+ (UIColor*)colorWithMacro:(NSString *)macro
{
    return [UIColor colorWithHex:macro];
}




+ (UIColor *)colorWithHex:(NSString *)color
{
    unsigned int hexInt = 0;

    NSScanner *scanner = [NSScanner scannerWithString:color];
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    [scanner scanHexInt:&hexInt];

    UIColor *newColor = [UIColor colorWithRed:((CGFloat) ((hexInt & 0xFF0000) >> 16))/255
                                        green:((CGFloat) ((hexInt & 0xFF00) >> 8))/255
                                         blue:((CGFloat) (hexInt & 0xFF))/255
                                        alpha:1.0f];

  return newColor;
}




- (UIColor*)darkerColorWithPercentage:(float)pc
{
    CGFloat r, g, b, a;
    if ([self getRed:&r green:&g blue:&b alpha:&a])
        return [UIColor colorWithRed:MIN(r - pc, 1.0)
                               green:MIN(g - pc, 1.0)
                                blue:MIN(b - pc, 1.0)
                               alpha:a];
    return nil;
}




- (UIColor*)lighterColorWithPercentage:(float)pc
{
    CGFloat r, g, b, a;
    if ([self getRed:&r green:&g blue:&b alpha:&a])
        return [UIColor colorWithRed:MIN(r + pc, 1.0)
                               green:MIN(g + pc, 1.0)
                                blue:MIN(b + pc, 1.0)
                               alpha:a];
    return nil;
    
}




- (UIColor *)lighterColor
{
    return [self lighterColorWithPercentage:0.1];
}




- (UIColor *)muchLighterColor
{
    return [self lighterColorWithPercentage:0.3f];
}




- (UIColor *)darkerColor
{
    return [self darkerColorWithPercentage:0.07f];
}




- (UIColor *)muchDarkerColor
{
    return [self darkerColorWithPercentage:0.14f];
}




+ (UIColor *)appBlack
{
    return [UIColor colorWithMacro:JD_BLACK_COLOR];
}




+ (UIColor *)appWhite
{
    return [UIColor colorWithMacro:JD_WHITE_COLOR];
}




+ (UIColor *)appDarkGrey
{
    return [UIColor colorWithMacro:JD_DARK_GREY_COLOR];
}




+ (UIColor *)appGrey
{
    return [UIColor colorWithMacro:JD_GREY_COLOR];
}




+ (UIColor *)appSemiLightGrey
{
    return [UIColor colorWithMacro:JD_SEMI_LIGHT_GREY_COLOR];
}




+ (UIColor *)appLightGrey
{
    return [UIColor colorWithMacro:JD_LIGHT_GREY_COLOR];
}




+ (UIColor *)appReallyLightGrey
{
    return [UIColor colorWithMacro:JD_REALLY_LIGHT_GREY_COLOR];
}




+ (UIColor *)facebookBlue
{
    return [self colorWithR:59.0f G:87.0f B:157.0f A:1.0f];
}




+ (UIColor *)twitterBlue
{
    return [self colorWithR:31.0f G:55.0f B:144.0f A:1.0f];
}




+ (UIColor *)instagramBrown
{
    return [self colorWithR:31.0f G:55.0f B:144.0f A:1.0f];
}




+ (UIColor *)snapchatYellow
{
    return [self colorWithR:31.0f G:55.0f B:144.0f A:1.0f];
}




+ (UIColor *)pintrestRed
{
    return [self colorWithR:31.0f G:55.0f B:144.0f A:1.0f];
}




@end
