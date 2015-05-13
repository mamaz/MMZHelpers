//
//  NSString+Helpers.h
//  MMZHelpersExample
//
//  Created by Hisma Mulya S on 5/13/15.
//  Copyright (c) 2015 mamaz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Helpers)

- (CGSize)sizeWordWrapWithString:(NSString*)string
                            font:(UIFont*)font
               constrainedToSize:(CGSize)constrainedSize;

@end
