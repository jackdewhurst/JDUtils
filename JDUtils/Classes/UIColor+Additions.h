//
//  UIColor+Additions.h
//
//  Created by Jack Dewhurst on 10/10/2015.
//  Copyright (c) 2015 Jack Dewhurst. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIColor (Additions)

// Shorter version of "colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha"
+ (UIColor *)colorWithR:(float)R G:(float)G B:(float)B A:(float)A;


// Returns a UIColor from hex string. Optional "#" prefix.
+ (UIColor *)colorWithHex:(NSString *)color;


// Returns a UIColor from given preprocessor macro string.
+ (UIColor *)colorWithMacro:(NSString *)macro;




/* -- Shortcut methods for modifying colours -- */

// Returns a darker IUColor than original with percentage between 0.0 - 1.0
- (UIColor*)darkerColorWithPercentage:(float)percentage;


// Returns a lighter IUColor than original with percentage between 0.0 - 1.0
- (UIColor*)lighterColorWithPercentage:(float)percentage;


// Returns a UIcolor with values 10% lighter than original colour
- (UIColor *)lighterColor;


// Returns a UIcolor with values 30% lighter than original colour
- (UIColor *)muchLighterColor;


// Returns a UIcolor with values 7% darker than original colour
- (UIColor *)darkerColor;


// Returns a UIcolor with values 14% darker than original colour
- (UIColor *)muchDarkerColor;




/* -- Shortcut methods for pre-defined macros -- */

// Black Colour - Macro should be "JD_BLACK_COLOR"
+ (UIColor *)appBlack;


// White Colour - Macro should be "JD_WHITE_COLOR"
+ (UIColor *)appWhite;


// Dark Grey Colour - Macro should be "JD_DARK_GREY_COLOR"
+ (UIColor *)appDarkGrey;


// Grey Colour - Macro should be "JD_GREY_COLOR"
+ (UIColor *)appGrey;


// Semi Light Grey Colour - Macro should be "JD_SEMI_LIGHT_GREY_COLOR"
+ (UIColor *)appSemiLightGrey;


// Light Grey Colour - Macro should be "JD_LIGHT_GREY_COLOR"
+ (UIColor *)appLightGrey;


// Really Light Grey Colour - Macro should be "JD_REALLY_LIGHT_GREY_COLOR"
+ (UIColor *)appReallyLightGrey;



/* -- Social Colours -- */

+ (UIColor *)facebookBlue;
+ (UIColor *)twitterBlue;
+ (UIColor *)instagramBrown;
+ (UIColor *)snapchatYellow;
+ (UIColor *)pintrestRed;


@end
