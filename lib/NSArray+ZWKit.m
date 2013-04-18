//
//  NSArray+ZWKit.m
//  ZWKitTests
//
//  Created by Zach Waugh on 4/18/13.
//  Copyright (c) 2013 Figure 53. All rights reserved.
//

#import "NSArray+ZWKit.h"

@implementation NSArray (ZWKit)

- (NSArray *)zw_map:(id (^)(id object))block
{
  if (!block) return self;
  
  NSMutableArray *result = [NSMutableArray array];
  
  for (id object in self) {
    id value = block(object);
    if (value) {
      [result addObject:value];
    }
  }
  
  return result;
}

- (NSArray *)zw_filter:(BOOL (^)(id object))block
{
  if (!block) return self;
  
  NSMutableArray *result = [NSMutableArray array];
  
  for (id object in self) {
    if (block(object)) {
      [result addObject:object];
    }
  }
  
  return result;
}

- (id)zw_reduce:(id (^)(id previous, id current))block
{
  id result = nil;
  
  for (NSInteger i = 0; i < self.count; i++) {
    result = block(result, self[i]);
  }
  
  return result;
}

@end
