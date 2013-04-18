//
//  NSArray+ZWKit.h
//  ZWKitTests
//
//  Created by Zach Waugh on 4/18/13.
//  Copyright (c) 2013 Figure 53. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (ZWKit)

- (NSArray *)zw_map:(id (^)(id object))block;
- (NSArray *)zw_filter:(BOOL (^)(id object))block;
- (id)zw_reduce:(id (^)(id previous, id current))block;

@end
