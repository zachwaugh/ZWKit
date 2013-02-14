//
//  ZWGeometry.h
//  ZWKit
//
//  Created by Zach Waugh on 8/26/11.
//  Copyright 2011 Zach Waugh. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSRect ZWRectWithWidth(NSRect frame, CGFloat width);
extern NSRect ZWRectWithHeight(NSRect frame, CGFloat height);
extern NSRect ZWCenteredRectInRect(NSRect rect, NSRect containerRect);
extern NSSize ZWSizeConstrainedToWidth(NSSize size, CGFloat width);
extern NSSize ZWSizeConstrainedToHeight(NSSize size, CGFloat height);
extern CGFloat ZWHeightForSizeConstrainedToWidth(CGSize size, CGFloat width);