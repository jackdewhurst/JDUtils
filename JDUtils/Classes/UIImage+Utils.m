//
//  UIImage+Utils.m
//  JDUtils
//
//  Created by Jack Dewhurst on 10/10/2015.
//  Copyright (c) 2015 Jack Dewhurst. All rights reserved.
//

#import "UIImage+Utils.h"


CGFloat DegreesToRadians(CGFloat degrees) {return degrees * M_PI / 180;};
CGFloat RadiansToDegrees(CGFloat radians) {return radians * 180/M_PI;};


@implementation UIImage (Utils)

- (UIImage *)imageAtRect:(CGRect)rect
{
   CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], rect);
   UIImage* subImage = [UIImage imageWithCGImage: imageRef];
   CGImageRelease(imageRef);
   
   return subImage;
   
}




- (UIImage *)imageByScalingProportionallyToMinimumSize:(CGSize)targetSize
{
   UIImage *sourceImage = self;
   UIImage *newImage = nil;
   
   CGSize imageSize = sourceImage.size;
   CGFloat width = imageSize.width;
   CGFloat height = imageSize.height;
   
   CGFloat targetWidth = targetSize.width;
   CGFloat targetHeight = targetSize.height;
   
   CGFloat scaleFactor = 0.0;
   CGFloat scaledWidth = targetWidth;
   CGFloat scaledHeight = targetHeight;
   
   CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
   
   if (CGSizeEqualToSize(imageSize, targetSize) == NO) {
      
      CGFloat widthFactor = targetWidth / width;
      CGFloat heightFactor = targetHeight / height;
      
      if (widthFactor > heightFactor) 
         scaleFactor = widthFactor;
      else
         scaleFactor = heightFactor;
      
      scaledWidth  = width * scaleFactor;
      scaledHeight = height * scaleFactor;
      
      // center the image
      
      if (widthFactor > heightFactor) {
         thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5; 
      } else if (widthFactor < heightFactor) {
         thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
      }
   }
   
   
   // this is actually the interesting part:
   
   UIGraphicsBeginImageContext(targetSize);
   
   CGRect thumbnailRect = CGRectZero;
   thumbnailRect.origin = thumbnailPoint;
   thumbnailRect.size.width  = scaledWidth;
   thumbnailRect.size.height = scaledHeight;
   
   [sourceImage drawInRect:thumbnailRect];
   
   newImage = UIGraphicsGetImageFromCurrentImageContext();
   UIGraphicsEndImageContext();
   
   if(newImage == nil) NSLog(@"could not scale image");
   
   
   return newImage ;
}





- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize
{
   
   UIImage *sourceImage = self;
   UIImage *newImage = nil;
   
   CGSize imageSize = sourceImage.size;
   CGFloat width = imageSize.width;
   CGFloat height = imageSize.height;
   
   CGFloat targetWidth = targetSize.width;
   CGFloat targetHeight = targetSize.height;
   
   CGFloat scaleFactor = 0.0;
   CGFloat scaledWidth = targetWidth;
   CGFloat scaledHeight = targetHeight;
   
   CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
   
   if (CGSizeEqualToSize(imageSize, targetSize) == NO) {
      
      CGFloat widthFactor = targetWidth / width;
      CGFloat heightFactor = targetHeight / height;
      
      if (widthFactor < heightFactor) 
         scaleFactor = widthFactor;
      else
         scaleFactor = heightFactor;
      
      scaledWidth  = width * scaleFactor;
      scaledHeight = height * scaleFactor;
      
      // center the image
      
      if (widthFactor < heightFactor) {
         thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5; 
      } else if (widthFactor > heightFactor) {
         thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
      }
   }
   
   
   // this is actually the interesting part:
   
   UIGraphicsBeginImageContext(targetSize);
   
   CGRect thumbnailRect = CGRectZero;
   thumbnailRect.origin = thumbnailPoint;
   thumbnailRect.size.width  = scaledWidth;
   thumbnailRect.size.height = scaledHeight;
   
   [sourceImage drawInRect:thumbnailRect];
   
   newImage = UIGraphicsGetImageFromCurrentImageContext();
   UIGraphicsEndImageContext();
   
   if(newImage == nil) NSLog(@"could not scale image");
   
   
   return newImage ;
}





- (UIImage *)imageByScalingToSize:(CGSize)targetSize
{
   
   UIImage *sourceImage = self;
   UIImage *newImage = nil;
   
   //   CGSize imageSize = sourceImage.size;
   //   CGFloat width = imageSize.width;
   //   CGFloat height = imageSize.height;
   
   CGFloat targetWidth = targetSize.width;
   CGFloat targetHeight = targetSize.height;
   
   //   CGFloat scaleFactor = 0.0;
   CGFloat scaledWidth = targetWidth;
   CGFloat scaledHeight = targetHeight;
   
   CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
   
   // this is actually the interesting part:
   
   UIGraphicsBeginImageContext(targetSize);
   
   CGRect thumbnailRect = CGRectZero;
   thumbnailRect.origin = thumbnailPoint;
   thumbnailRect.size.width  = scaledWidth;
   thumbnailRect.size.height = scaledHeight;
   
   [sourceImage drawInRect:thumbnailRect];
   
   newImage = UIGraphicsGetImageFromCurrentImageContext();
   UIGraphicsEndImageContext();
   
   if(newImage == nil) NSLog(@"could not scale image");
   
   
   return newImage ;
}





- (UIImage *)imageRotatedByRadians:(CGFloat)radians
{
   return [self imageRotatedByDegrees:RadiansToDegrees(radians)];
}




- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees 
{   
   // calculate the size of the rotated view's containing box for our drawing space
   UIView *rotatedViewBox = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.size.width, self.size.height)];
   CGAffineTransform t = CGAffineTransformMakeRotation(DegreesToRadians(degrees));
   rotatedViewBox.transform = t;
   CGSize rotatedSize = rotatedViewBox.frame.size;
   
   // Create the bitmap context
   UIGraphicsBeginImageContext(rotatedSize);
   CGContextRef bitmap = UIGraphicsGetCurrentContext();
   
   // Move the origin to the middle of the image so we will rotate and scale around the center.
   CGContextTranslateCTM(bitmap, rotatedSize.width/2, rotatedSize.height/2);
   
   //   // Rotate the image context
   CGContextRotateCTM(bitmap, DegreesToRadians(degrees));
   
   // Now, draw the rotated/scaled image into the context
   CGContextScaleCTM(bitmap, 1.0, -1.0);
   CGContextDrawImage(bitmap, CGRectMake(-self.size.width / 2, -self.size.height / 2, self.size.width, self.size.height), [self CGImage]);
   
   UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
   UIGraphicsEndImageContext();
   return newImage;
}




- (UIImage*)imageNamed:(NSString *)name withColour:(UIColor *)color
{
    // load the image
    UIImage *img = [UIImage imageNamed:name];
    
    // begin a new image context, to draw our colored image onto
    UIGraphicsBeginImageContext(img.size);
    
    // get a reference to that context we created
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // set the fill color
    [color setFill];
    
    // translate/flip the graphics context (for transforming from CG* coords to UI* coords
    CGContextTranslateCTM(context, 0, img.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    // set the blend mode to color burn, and the original image
    CGContextSetBlendMode(context, kCGBlendModeColorBurn);
    CGRect rect = CGRectMake(0, 0, img.size.width, img.size.height);
    CGContextDrawImage(context, rect, img.CGImage);
    
    // set a mask that matches the shape of the image, then draw (color burn) a colored rectangle
    CGContextClipToMask(context, rect, img.CGImage);
    CGContextAddRect(context, rect);
    CGContextDrawPath(context,kCGPathFill);
    
    // generate a new UIImage from the graphics context we drew onto
    UIImage *coloredImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //return the color-burned image
    return coloredImg;
}




- (UIColor *)averageColor
{    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    unsigned char rgba[4];
    CGContextRef context = CGBitmapContextCreate(rgba, 1, 1, 8, 4, colorSpace, kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    
    CGContextDrawImage(context, CGRectMake(0, 0, 1, 1), self.CGImage);
    CGColorSpaceRelease(colorSpace);
    CGContextRelease(context);
    
    if(rgba[3] > 0) {
        CGFloat alpha = ((CGFloat)rgba[3])/255.0;
        CGFloat multiplier = alpha/255.0;
        return [UIColor colorWithRed:((CGFloat)rgba[0])*multiplier
                               green:((CGFloat)rgba[1])*multiplier
                                blue:((CGFloat)rgba[2])*multiplier
                               alpha:alpha];
    }
    else {
        return [UIColor colorWithRed:((CGFloat)rgba[0])/255.0
                               green:((CGFloat)rgba[1])/255.0
                                blue:((CGFloat)rgba[2])/255.0
                               alpha:((CGFloat)rgba[3])/255.0];
    }
}



@end
