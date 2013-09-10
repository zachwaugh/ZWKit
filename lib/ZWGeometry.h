//
//  ZWGeometry.h
//  ZWKit
//
//  Created by Zach Waugh on 8/26/11.
//  Copyright 2011 Zach Waugh. All rights reserved.
//

#import <Foundation/Foundation.h>

// Returns rect with width changed
extern CGRect ZWRectWithWidth(CGRect rect, CGFloat width);

// Returns rect with height updated
extern CGRect ZWRectWithHeight(CGRect rect, CGFloat height);

// Returns rect centered in rect scaled down to fit as closely as possible, may overflow container
extern CGRect ZWRectFitToRect(CGRect rect, CGRect container);

// Returns rect centered in container rect
extern CGRect ZWCenteredRectInRect(CGRect rect, CGRect container);

// Returns size constrained to max width maintaining aspect ratio
extern CGSize ZWSizeConstrainedToWidth(CGSize size, CGFloat width);

// Returns size constrained to max height maintaining aspect ratio
extern CGSize ZWSizeConstrainedToHeight(CGSize size, CGFloat height);

// Returns size to fit within size, maintaining aspect ratio
extern CGSize ZWSizeConstrainedToSize(CGSize size, CGSize container);

// Returns YES if size is smaller than container in both dimensions
extern BOOL ZWSizeContainsSize(CGSize container, CGSize size);

// Convenience function to just return height for size constrained to width function
extern CGFloat ZWHeightForSizeConstrainedToWidth(CGSize size, CGFloat width);