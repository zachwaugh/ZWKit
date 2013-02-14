//
//  ZWGeometry.h
//  ZWKit
//
//  Created by Zach Waugh on 8/26/11.
//  Copyright 2011 Zach Waugh. All rights reserved.
//

#import <Foundation/Foundation.h>

// Returns rect with width changed
extern NSRect ZWRectWithWidth(NSRect rect, CGFloat width);

// Returns rect with height updated
extern NSRect ZWRectWithHeight(NSRect rect, CGFloat height);

// Returns rect centered in rect scaled down to fit as closely as possible, may overflow container
extern NSRect ZWRectFitToRect(NSRect source, NSRect container);

// Returns rect centered in container rect
extern NSRect ZWCenteredRectInRect(NSRect rect, NSRect containerRect);

// Returns size constrained to max width maintaining aspect ratio
extern NSSize ZWSizeConstrainedToWidth(NSSize size, CGFloat width);

// Returns size constrained to max height maintaining aspect ratio
extern NSSize ZWSizeConstrainedToHeight(NSSize size, CGFloat height);

// Convenience function to just return height for size constrained to width function
extern CGFloat ZWHeightForSizeConstrainedToWidth(CGSize size, CGFloat width);