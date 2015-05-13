//
//  NSString+Helpers.m
//  MMZHelpersExample
//
//  Created by Hisma Mulya S on 5/13/15.
//  Copyright (c) 2015 mamaz. All rights reserved.
//

#import "NSString+Helpers.h"

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

@implementation NSString (Helpers)

- (CGSize)sizeWordWrapWithString:(NSString*)string
                            font:(UIFont*)font
               constrainedToSize:(CGSize)constrainedSize
{
    if (SYSTEM_VERSION_LESS_THAN(@"7.0")) {
        
        CGSize size = [string sizeWithFont:font
                         constrainedToSize:constrainedSize
                             lineBreakMode:NSLineBreakByWordWrapping];
        
        return size;
    } else {
        // for iOS7++
        CGRect rect = [string boundingRectWithSize:constrainedSize
                                           options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                        attributes:@{NSFontAttributeName: font}
                                           context:nil];
        return CGRectIntegral(rect).size;
    }
}
@end
