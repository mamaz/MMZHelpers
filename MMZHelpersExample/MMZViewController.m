//
//  MMZViewController.m
//  MMZHelpersExample
//
//  Created by Hisma Mulya S on 10/1/14.
//  Copyright (c) 2014 mamaz. All rights reserved.
//

#import "MMZViewController.h"
#import "UIView+ActivityIndicator.h"

@interface MMZViewController ()

@end

@implementation MMZViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view.activityIndicatorView startAnimating];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{
                       
                       [self.view.activityIndicatorView stopAnimating];
                       
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addActivityIndicatorTheNormalWay
{
    UIView *superview = self.view;

    CGFloat activityIndicatorHeight = 50.0;
    CGFloat activityIndicatorWidth = 50.0;

    CGFloat originX = superview.frame.size.width/2 - activityIndicatorWidth / 2;
    CGFloat originY = superview.frame.size.height/2 - activityIndicatorHeight / 2;

    UIActivityIndicatorView *act =[UIActivityIndicatorView new];
    act.backgroundColor = [UIColor redColor];
    act.frame = (CGRect){originX,originY,activityIndicatorWidth,activityIndicatorHeight};
    act.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    [self.view addSubview:act];
}

@end
