//
//  NSImage+ZW.h
//  ZWKit
//
//  Created by Zach Waugh on 4/17/12.
//  Copyright (c) 2012 Zach Waugh. All rights reserved.
//

#if !TARGET_OS_IPHONE

#import <Cocoa/Cocoa.h>

@interface NSImage (ZW)

- (NSImage *)imageConstrainedToWidth:(NSInteger)width;
- (NSImage *)imageConstrainedToHeight:(NSInteger)height;
- (NSImage *)imageConstrainedToSize:(NSSize)size;

@end

#endif