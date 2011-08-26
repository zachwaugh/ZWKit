//
//  ZWRectHelpers.m
//  ZWKit
//
//  Created by Zach Waugh on 8/26/11.
//  Copyright 2011 Zach Waugh. All rights reserved.
//

#import "ZWRectHelpers.h"

NSRect ZWRectWithWidth(NSRect frame, float width)
{
  NSRect newFrame = frame;
  newFrame.size.width = width;
  
  return newFrame;
}


NSRect ZWRectWithHeight(NSRect frame, float height)
{
  NSRect newFrame = frame;
  newFrame.size.height = height;
  
  return newFrame;
}