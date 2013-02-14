//
//  ZWUtilities.m
//  ZWKit
//
//  Created by Zach Waugh on 4/17/12.
//  Copyright (c) 2012 Zach Waugh. All rights reserved.
//

#import "ZWUtilities.h"

void ZWRunBlockAfterDelay(double delay, dispatch_block_t block)
{
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC), dispatch_get_main_queue(), block);
}

void ZWRunBlockAfterDelayInCurrentQueue(double delay, dispatch_block_t block)
{
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC), dispatch_get_current_queue(), block);
}

inline NSString * ZWStringFromBool(BOOL flag)
{
  return (flag) ? @"YES" : @"NO";
}
