//
//  ZWRectHelpersTest.m
//  ZWKit
//
//  Created by Zach Waugh on 8/26/11.
//  Copyright 2011 Zach Waugh. All rights reserved.
//

#import "ZWRectHelpersTest.h"
#import "ZWRectHelpers.h"

@implementation ZWRectHelpersTest

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testRectWithWidth
{
  NSRect rect = NSMakeRect(0, 0, 100, 100);
  NSRect newRect = ZWRectWithWidth(rect, 200);
  
  STAssertTrue(newRect.size.width == 200, nil);
  STAssertTrue(newRect.size.height == 100, nil);
  STAssertTrue(newRect.origin.x == 0, nil);
  STAssertTrue(newRect.origin.y == 0, nil);
}


- (void)testRectWithHeight
{
  NSRect rect = NSMakeRect(0, 0, 100, 100);
  NSRect newRect = ZWRectWithHeight(rect, 200);
  
  STAssertTrue(newRect.size.height == 200, nil);
  STAssertTrue(newRect.size.width == 100, nil);
  STAssertTrue(newRect.origin.x == 0, nil);
  STAssertTrue(newRect.origin.y == 0, nil);
}

@end
