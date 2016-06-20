//
//  UIDevice+Additions.m
//
//  Created by Jack Dewhurst on 10/10/2015.
//  Copyright (c) 2015 Jack Dewhurst. All rights reserved.
//

#import "UIDevice+Additions.h"


@implementation UIDevice (Additions)

- (NSString*)uniqueIdentifier
{
    return [NSString stringWithFormat:@"%@", [self identifierForVendor]];
}




@end
