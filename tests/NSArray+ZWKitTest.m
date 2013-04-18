//
//  NSArray+ZWKitTest.m
//  ZWKitTests
//
//  Created by Zach Waugh on 4/18/13.
//  Copyright (c) 2013 Figure 53. All rights reserved.
//

#import "NSArray+ZWKitTest.h"
#import "NSArray+ZWKit.h"

@implementation NSArray_ZWKitTest

- (void)testMap
{
  NSArray *array = @[@"a", @"b", @"c"];
  NSArray *result = [array zw_map:nil];
  NSArray *expected;
  
  expect(array).to.equal(result);
  
  result = [array zw_map:^id(id object) {
    return object;
  }];
  
  expect(array).to.equal(result);
  
  result = [array zw_map:^id(id object) {
    return [NSString stringWithFormat:@"%@%@", object, object];
  }];
  
  expected = @[@"aa", @"bb", @"cc"];
  expect(result).to.equal(expected);
}

- (void)testFilter
{
  NSArray *expected;
  NSArray *result;
  NSArray *array = @[@"a", @"b", @"c"];
  
  result = [array zw_filter:nil];
  expect(array).to.equal(result);
  
  result = [array zw_filter:^BOOL(id object) {
    return YES;
  }];
  
  expect(array).to.equal(result);
  
  result = [array zw_filter:^BOOL(id object) {
    return [object isEqualToString:@"a"];
  }];
  
  expected = @[@"a"];
  expect(result).to.equal(expected);
  
  array = @[@"a", @"b", @"apple", @"cat", @"dog", @"aardvark"];
  result = [array zw_filter:^BOOL(id object) {
    return [object hasPrefix:@"a"];
  }];
  
  expected = @[@"a", @"apple", @"aardvark"];
  expect(result).to.equal(expected);
}

- (void)testReduce
{
  
}

@end
