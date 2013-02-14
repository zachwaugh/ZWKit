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

NSRect ZWRectFitToRect(NSRect source, NSRect container)
{
  if (NSContainsRect(container, source)) {
    return ZWCenteredRectInRect(source, container);
  } else {
    return source;
  }
}

NSRect ZWCenteredRectInRect(NSRect rect, NSRect containerRect)
{
  rect.origin.y = containerRect.origin.x + round((containerRect.size.height - rect.size.height) / 2);
  rect.origin.x = containerRect.origin.y + round((containerRect.size.width - rect.size.width) / 2);
  
  return rect;
}

#pragma mark - Size

NSSize ZWSizeConstrainedToWidth(NSSize size, CGFloat width)
{
  if (size.width <= width) {
    return size;
  } else {
    float ratio = size.height / size.width;
    return NSMakeSize(width, round(width * ratio));
  }
}

NSSize ZWSizeConstrainedToHeight(NSSize size, CGFloat height)
{
  if (size.height <= height) {
    return size;
  } else {
    float ratio = size.width / size.height;
    return NSMakeSize(round(height * ratio), height);
  }
}

CGFloat ZWHeightForSizeConstrainedToWidth(CGSize size, CGFloat width)
{
  return ZWSizeConstrainedToWidth(size, width).height;
}
