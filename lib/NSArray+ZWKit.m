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
  
  NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.count];
  
  for (id object in self) {
    [result addObject:block(object)];
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
  if (self.count <= 0) return nil;
	
  id result = self[0];
  
  for (NSUInteger i = 1; i < self.count; i++) {
    result = block(result, self[i]);
  }
  
  return result;
}

@end
