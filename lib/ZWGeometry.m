//
//  ZWGeometry.h
//  ZWKit
//
//  Created by Zach Waugh on 4/17/12.
//  Copyright (c) 2012 Zach Waugh. All rights reserved.
//

#import "ZWGeometry.h"

#pragma mark - Rect

NSRect ZWRectWithWidth(NSRect frame, CGFloat width)
{
  NSRect newFrame = frame;
  newFrame.size.width = width;
  
  return newFrame;
}

NSRect ZWRectWithHeight(NSRect frame, CGFloat height)
{
  NSRect newFrame = frame;
  newFrame.size.height = height;
  
  return newFrame;
}

NSRect ZWCenteredRectInRect(NSRect rect, NSRect containerRect)
{
  rect.origin.y = containerRect.origin.x + round((containerRect.size.height - rect.size.height) / 2);
  rect.origin.x = containerRect.origin.y + round((containerRect.size.width - rect.size.width) / 2);
  
  return rect;
}

#pragma mark - Size

NSSize ZWSizeForMaxWidth(NSSize size, CGFloat width)
{
  if (size.width <= width) {
    return size;
  } else {
    float ratio = size.height / size.width;
    return NSMakeSize(width, round(width * ratio));
  }
}

NSSize ZWSizeForMaxHeight(NSSize size, CGFloat height)
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
  NSSize constrainedSize = ZWSizeForMaxWidth(size, width);
  return constrainedSize.height;
}
