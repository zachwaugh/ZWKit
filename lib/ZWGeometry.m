//
//  ZWGeometry.h
//  ZWKit
//
//  Created by Zach Waugh on 4/17/12.
//  Copyright (c) 2012 Zach Waugh. All rights reserved.
//

#import "ZWGeometry.h"

#pragma mark - Rect

CGRect ZWRectWithWidth(CGRect rect, CGFloat width)
{
  CGRect newRect = rect;
  newRect.size.width = width;
  
  return newRect;
}

CGRect ZWRectWithHeight(CGRect rect, CGFloat height)
{
  CGRect newRect = rect;
  newRect.size.height = height;
  
  return newRect;
}

CGRect ZWRectFitToRect(CGRect rect, CGRect container)
{
  if (CGRectContainsRect(container, rect)) {
    return ZWCenteredRectInRect(rect, container);
  } else {
    return rect;
  }
}

CGRect ZWCenteredRectInRect(CGRect rect, CGRect container)
{
  rect.origin.y = container.origin.x + round((container.size.height - rect.size.height) / 2);
  rect.origin.x = container.origin.y + round((container.size.width - rect.size.width) / 2);
  
  return rect;
}

#pragma mark - Size

BOOL ZWSizeContainsSize(CGSize container, CGSize size)
{
	return (size.width <= container.width && size.height <= container.height);
}

CGSize ZWSizeConstrainedToWidth(CGSize size, CGFloat width)
{
  if (size.width <= width) {
    return size;
  } else {
    CGFloat ratio = size.height / size.width;
    return CGSizeMake(width, round(width * ratio));
  }
}

CGSize ZWSizeConstrainedToHeight(CGSize size, CGFloat height)
{
  if (size.height <= height) {
    return size;
  } else {
    CGFloat ratio = size.width / size.height;
    return CGSizeMake(round(height * ratio), height);
  }
}

CGSize ZWSizeConstrainedToSize(CGSize size, CGSize container)
{
	// Already small enough return source
	if (ZWSizeContainsSize(container, size)) return size;
	
	// Try constraining to width
	CGSize constrained = ZWSizeConstrainedToWidth(size, container.width);
	
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
