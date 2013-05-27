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
  NSArray *expected;
  
	// Nil block, return receiver
	NSArray *result = [array zw_map:nil];
  expect(array).to.equal(result);
  
	// Identity function
  result = [array zw_map:^id(id object) {
    return object;
  }];
  
  expect(array).to.equal(result);
  
	// Duplicate all elements
  result = [array zw_map:^id(id object) {
    return [NSString stringWithFormat:@"%@%@", object, object];
  }];
  
  expected = @[@"aa", @"bb", @"cc"];
  expect(result).to.equal(expected);
	
	// Uppercase every element
	result = [array zw_map:^id(id object) {
    return [object uppercaseString];
  }];
  
  expected = @[@"A", @"B", @"C"];
  expect(result).to.equal(expected);
}

- (void)testFilter
{
  NSArray *expected;
  NSArray *result;
  NSArray *array = @[@"a", @"b", @"c"];
  
	// Nil block, return original array
  result = [array zw_filter:nil];
  expect(array).to.equal(result);
  
	// Don't filter out any elements
  result = [array zw_filter:^BOOL(id object) {
    return YES;
  }];
  
  expect(array).to.equal(result);
  
	// Only accept "a"
  result = [array zw_filter:^BOOL(id object) {
    return [object isEqualToString:@"a"];
  }];
  
  expected = @[@"a"];
  expect(result).to.equal(expected);
  
	// Accept any string that begins with "a"
  array = @[@"a", @"b", @"apple", @"cat", @"dog", @"aardvark"];
  result = [array zw_filter:^BOOL(id object) {
    return [object hasPrefix:@"a"];
  }];
  
  expected = @[@"a", @"apple", @"aardvark"];
  expect(result).to.equal(expected);
}

- (void)testReduce
{
  NSArray *array = @[ @1, @2, @3, @5, @8 ];
	
	// Sum
	NSNumber *result = [array zw_reduce:^id(NSNumber *previous, NSNumber *current) {
		return @(previous.integerValue + current.integerValue);
	}];
	
	expect(result.integerValue).to.equal(19);
	
	// Multiply
	result = [array zw_reduce:^id(NSNumber *previous, NSNumber *current) {
		NSLog(@"previous: %@, current: %@", previous, current);
		return @(previous.integerValue * current.integerValue);
	}];
	
	expect(result.integerValue).to.equal(240);
}

@end
