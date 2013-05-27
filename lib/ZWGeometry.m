//
//  ZWGeometry.h
//  ZWKit
//
//  Created by Zach Waugh on 4/17/12.
//  Copyright (c) 2012 Zach Waugh. All rights reserved.
//

#import "ZWGeometry.h"

#pragma mark - Rect

NSRect ZWRectWithWidth(NSRect rect, CGFloat width)
{
  NSRect newRect = rect;
  newRect.size.width = width;
  
  return newRect;
}

NSRect ZWRectWithHeight(NSRect rect, CGFloat height)
{
  NSRect newRect = rect;
  newRect.size.height = height;
  
  return newRect;
}

NSRect ZWRectFitToRect(NSRect rect, NSRect container)
{
  if (NSContainsRect(container, rect)) {
    return ZWCenteredRectInRect(rect, container);
  } else {
    return rect;
  }
}

NSRect ZWCenteredRectInRect(NSRect rect, NSRect container)
{
  rect.origin.y = container.origin.x + round((container.size.height - rect.size.height) / 2);
  rect.origin.x = container.origin.y + round((container.size.width - rect.size.width) / 2);
  
  return rect;
}

#pragma mark - Size

BOOL ZWSizeContainsSize(NSSize container, NSSize size)
{
	return (size.width <= container.width && size.height <= container.height);
}

NSSize ZWSizeConstrainedToWidth(NSSize size, CGFloat width)
{
  if (size.width <= width) {
    return size;
  } else {
    CGFloat ratio = size.height / size.width;
    return NSMakeSize(width, round(width * ratio));
  }
}

NSSize ZWSizeConstrainedToHeight(NSSize size, CGFloat height)
{
  if (size.height <= height) {
    return size;
  } else {
    CGFloat ratio = size.width / size.height;
    return NSMakeSize(round(height * ratio), height);
  }
}

NSSize ZWSizeConstrainedToSize(NSSize size, NSSize container)
{
	// Already small enough return source
	if (ZWSizeContainsSize(container, size)) return size;
	
	// Try constraining to width
	NSSize constrained = ZWSizeConstrainedToWidth(size, container.width);
	
	// If constrained is still too large, need to also constrain height
	if (!ZWSizeContainsSize(container, constrained)) {
		constrained = ZWSizeConstrainedToHeight(constrained, container.height);
	}
	
	return constrained;
}

CGFloat ZWHeightForSizeConstrainedToWidth(CGSize size, CGFloat width)
{
  return ZWSizeConstrainedToWidth(size, width).height;
}
