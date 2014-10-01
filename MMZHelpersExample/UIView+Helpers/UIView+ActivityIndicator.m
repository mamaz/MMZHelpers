//
//  UIView+ActivityIndicator.m
//  HeyBar
//
//  Created by Hisma Mulya S on 9/24/14.
//  Copyright (c) 2014 Ice House. All rights reserved.
//

#import "UIView+ActivityIndicator.h"
#import <objc/runtime.h>

@implementation UIView (ActivityIndicator)
@dynamic activityIndicatorView;

- (UIActivityIndicatorView *)activityIndicatorView
{
    UIActivityIndicatorView *activityIndicatorView = objc_getAssociatedObject(self, @selector(activityIndicatorView));
    
    if (!activityIndicatorView) {
        
        CGSize loadingSize = CGSizeMake(20, 20);
        activityIndicatorView = [[UIActivityIndicatorView alloc]initWithFrame:
                                 CGRectMake(self.frame.size.width/2 - loadingSize.width/2,
                                            self.frame.size.height/2 - loadingSize.height/2,
                                            loadingSize.width,loadingSize.height)];
        [activityIndicatorView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
        [self addSubview:activityIndicatorView];
    }
    
    // default is stop
    [activityIndicatorView stopAnimating];
    [self setActivtyIndicatorView:activityIndicatorView];
    
    return activityIndicatorView;
}

- (void)setActivtyIndicatorView:(UIActivityIndicatorView *)activtyIndicatorView
{
    objc_setAssociatedObject(self, @selector(activityIndicatorView),
                             activtyIndicatorView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
