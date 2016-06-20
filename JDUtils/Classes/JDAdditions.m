//
//  JDAdditions.m
//  JDAdditions
//
//  Created by Jack Dewhurst on 11/11/2013.
//  Copyright (c) 2013 Jack Dewhurst. All rights reserved.
//

#import "JDAdditions.h"


@interface JDAdditions()
{
    BOOL reachable;
}


@end


@implementation JDAdditions


+ (JDAdditions*)instance
{
    static dispatch_once_t pred;
    static JDAdditions *sharedInstance = nil;
    
    dispatch_once(&pred, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}




- (id)init
{
    self = [super init];
    if (self) {
        [self setupClass];
    }
    return self;
}




- (void)setupClass
{
    self.dateFormatter = [NSDateFormatter new];
    self.dateFormatter.dateFormat = @"dd-MM-yyyy";
    
    self.isoFormatter = [NSDateFormatter new];
    self.isoFormatter.dateFormat = @"yyyy-MM-dd'T'HHmmssZ";
}




- (void)removeMiddleControllersFromNavStack:(UINavigationController*)navcontroller
{
    NSMutableArray *vcs = [NSMutableArray arrayWithArray:navcontroller.viewControllers];
    
    if (vcs.count > 2) {
        for (int i = 1; i < vcs.count - 1; i++) {
            [vcs removeObjectAtIndex:i];
        }
    }
    
    navcontroller.viewControllers = vcs;
}




+ (BOOL)date:(NSDate*)date isBetweenDate:(NSDate*)beginDate andDate:(NSDate*)endDate
{
    if ([date compare:beginDate] == NSOrderedAscending)
        return NO;
    
    if ([date compare:endDate] == NSOrderedDescending)
        return NO;
    
    return YES;
}




+ (NSString *)suffixForDay:(int)day
{
    switch (day) {
        case 1:
        case 21:
        case 31: return @"st";
        case 2:
        case 22: return @"nd";
        case 3:
        case 23: return @"rd";
        default: return @"th";
    }
}




+ (BOOL)validateEmailWithString:(NSString*)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}




+ (UIImage*)imageFromColor:(UIColor*)color andSize:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}





- (NSDate*)dateFromISOFormattedString:(NSString *)dateString
{
    if (!dateString) return nil;
    if ([dateString hasSuffix:@"Z"]) {
        dateString = [[dateString substringToIndex:(dateString.length-5)] stringByAppendingString:@"-0000"];
    }
    dateString = [dateString stringByReplacingOccurrencesOfString:@":" withString:@""];
    return [self.isoFormatter dateFromString:dateString];
}





+ (NSString*)shareStringForValue:(long)value
{
    float shortVal = value;
    
    if (shortVal > 1000000.0f) {
        shortVal = shortVal / 1000000.0f;
        return [NSString stringWithFormat:@"%.1fm", shortVal];
    }
    
    if (shortVal > 100000.0f) {
        shortVal = shortVal / 100000.0f;
        return [NSString stringWithFormat:@"%.0fk", shortVal];
    }
    
    
    if (shortVal > 1000.0f) {
        shortVal = shortVal / 1000.0f;
        return [NSString stringWithFormat:@"%.1fk", shortVal];
    }
    
    return [NSString stringWithFormat:@"%li", value];
}





- (UIImage *)fixOrientation:(UIImage*)image
{
    // No-op if the orientation is already correct
    if (image.imageOrientation == UIImageOrientationUp) return image;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (image.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.width, image.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, image.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationUpMirrored:
            break;
    }
    
    switch (image.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationDown:
        case UIImageOrientationLeft:
        case UIImageOrientationRight:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, image.size.width, image.size.height,
                                             CGImageGetBitsPerComponent(image.CGImage), 0,
                                             CGImageGetColorSpace(image.CGImage),
                                             CGImageGetBitmapInfo(image.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (image.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,image.size.height,image.size.width), image.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,image.size.width,image.size.height), image.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}




+ (BOOL)notificationServicesEnabled
{
    BOOL isEnabled = NO;
    
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(currentUserNotificationSettings)]){
        UIUserNotificationSettings *notificationSettings = [[UIApplication sharedApplication] currentUserNotificationSettings];
        
        if (!notificationSettings || (notificationSettings.types == UIUserNotificationTypeNone)) {
            isEnabled = NO;
        } else {
            isEnabled = YES;
        }
    } else {
        UIRemoteNotificationType types = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
        if (types & UIRemoteNotificationTypeAlert) {
            isEnabled = YES;
        } else{
            isEnabled = NO;
        }
    }
    
    return isEnabled;
}





// TODO - implement this
+ (BOOL)locationServicesEnabled
{
    return YES;
}




@end
