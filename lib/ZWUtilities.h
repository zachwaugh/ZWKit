//
//  ZWUtilities.h
//  ZWKit
//
//  Created by Zach Waugh on 4/17/12.
//  Copyright (c) 2012 Zach Waugh. All rights reserved.
//

#import <Foundation/Foundation.h>

// Run a block after delay in seconds - always runs on main queue
extern void ZWRunBlockAfterDelay(double delay, dispatch_block_t block);

extern void ZWRunBlockAfterDelayInCurrentQueue(double delay, dispatch_block_t block);

// Convenience function to return YES or NO for a bool instead of 1 or 0
extern inline NSString * ZWStringFromBool(BOOL flag);