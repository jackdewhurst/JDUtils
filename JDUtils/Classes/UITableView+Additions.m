//
//  UITableView+Additions.m
//
//  Created by Jack Dewhurst on 10/10/2015.
//  Copyright (c) 2015 Jack Dewhurst. All rights reserved.
//

#import "UITableView+Additions.h"


@implementation UITableView (Additions)

- (void)setHeaderWithHeight:(float)height
{
    UIView *h = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, height)];
    h.backgroundColor = self.backgroundColor;
    self.tableHeaderView = h;
}




- (void)setFooterWithHeight:(float)height
{
    UIView *f = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, height)];
    f.backgroundColor = self.backgroundColor;
    self.tableFooterView = f;
}




@end
