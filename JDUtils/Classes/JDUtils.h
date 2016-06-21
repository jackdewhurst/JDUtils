//
//  JDUtils.h
//  JDUtils
//
//  Created by Jack Dewhurst on 10/10/2015.
//  Copyright (c) 2015 Jack Dewhurst. All rights reserved.
//

#import "UIView+Utils.h"
#import "NSObject+Utils.h"
#import "UIBarButtonItem+Utils.h"
#import "UIDevice+Utils.h"
#import "UIFont+Utils.h"
#import "UIImage+Utils.h"
#import "UINavigationBar+Utils.h"
#import "UITableView+Utils.h"
#import "UIView+Utils.h"
#import "UIColor+Utils.h"


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


@interface JDUtils : NSObject

@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@property (nonatomic, strong) NSDateFormatter *isoFormatter;


+ (JDUtils*)instance;

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