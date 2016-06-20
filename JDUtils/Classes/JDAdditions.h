//
//  JDAdditions.h
//
//  Created by Jack Dewhurst on 10/10/2015.
//  Copyright (c) 2015 Jack Dewhurst. All rights reserved.
//

#import "UIView+Additions.h"
#import "NSObject+Additions.h"
#import "UIBarButtonItem+Additions.h"
#import "UIDevice+Additions.h"
#import "UIFont+Additions.h"
#import "UIImage+Additions.h"
#import "UINavigationBar+Additions.h"
#import "UITableView+Additions.h"
#import "UIView+Additions.h"
#import "UIColor+Additions.h"


#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


#define IS_568_OR_GREATER ([UIScreen mainScreen].bounds.size.height > 480)
#define IS_568_OR_LOWER ([UIScreen mainScreen].bounds.size.height <= 569)
#define IS_568 ([UIScreen mainScreen].bounds.size.height == 568)
#define IS_LOWER_THAN_568 ([UIScreen mainScreen].bounds.size.height < 568)


#define IS_IPAD_DEVICE ([(NSString *)[UIDevice currentDevice].model hasPrefix:@"iPad"])
#define IS_RETINA_IPAD ([(NSString *)[UIDevice currentDevice].model hasPrefix:@"iPad"] && [[UIScreen mainScreen] respondsToSelector:@selector(scale)] && [UIScreen mainScreen].scale > 1)


#define degreesToRadians(degrees) ((degrees) / 180.0 * M_PI)
#define radiansToDegrees(radians) ((radians) * (180.0 / M_PI))


@interface JDAdditions : NSObject

@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@property (nonatomic, strong) NSDateFormatter *isoFormatter;


+ (JDAdditions*)instance;

+ (BOOL)notificationServicesEnabled;
+ (BOOL)locationServicesEnabled;

+ (UIImage*)imageFromColor:(UIColor*)color andSize:(CGSize)size;
- (UIImage *)fixOrientation:(UIImage*)image;

+ (BOOL)validateEmailWithString:(NSString*)email;

+ (NSString *)suffixForDay:(int)day;
- (NSDate*)dateFromISOFormattedString:(NSString*)dateString;

+ (BOOL)date:(NSDate*)date isBetweenDate:(NSDate*)beginDate andDate:(NSDate*)endDate;

+ (NSString*)shareStringForValue:(long)value;

- (void)removeMiddleControllersFromNavStack:(UINavigationController*)navcontroller;



@end