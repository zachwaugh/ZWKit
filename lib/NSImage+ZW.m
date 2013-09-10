//
//  NSImage+ZW.m
//  ZWKit
//
//  Created by Zach Waugh on 4/17/12.
//  Copyright (c) 2012 Zach Waugh. All rights reserved.
//

#if !TARGET_OS_IPHONE

#import "NSImage+ZW.h"
#import "ZWGeometry.h"

@implementation NSImage (ZW)

- (NSImage *)imageConstrainedToWidth:(NSInteger)width
{
  if (self.size.width > width) {
    NSImage *scaled = [[NSImage alloc] initWithSize:ZWSizeConstrainedToWidth(self.size, width)];
    [scaled lockFocus];
    [self drawInRect:NSMakeRect(0, 0, width, scaled.size.height) fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0];
    [scaled unlockFocus];
    
    return scaled;
  } else {
    return self;
  }
}

- (NSImage *)imageConstrainedToHeight:(NSInteger)height
{
  if (self.size.height > height) {
    NSImage *scaled = [[NSImage alloc] initWithSize:ZWSizeConstrainedToHeight(self.size, height)];
    [scaled lockFocus];
    [self drawInRect:NSMakeRect(0, 0, scaled.size.width, height) fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0];
    [scaled unlockFocus];
    
    return scaled;
  } else {
    return self;
  }
}

- (NSImage *)imageConstrainedToSize:(NSSize)size
{
	// Don't scale if image size is small enough already
  if (!ZWSizeContainsSize(size, self.size)) {
		NSSize scaledSize = ZWSizeConstrainedToSize(self.size, size);
    NSImage *scaled = [[NSImage alloc] initWithSize:scaledSize];
    [scaled lockFocus];
    [self drawInRect:NSMakeRect(0, 0, scaledSize.width, scaledSize.height) fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0];
    [scaled unlockFocus];
    
    return scaled;
  } else {
    return self;
  }
}

@end

#endif
