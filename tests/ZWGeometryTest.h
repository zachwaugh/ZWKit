//
//  ZWRectHelpersTest.h
//  ZWKit
//
//  Created by Zach Waugh on 8/26/11.
//  Copyright 2011 Zach Waugh. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

@interface ZWGeometryTest : SenTestCase

- (void)testRectWithWidth;
- (void)testRectWithHeight;
- (void)testRectFitToRect;
- (void)testCenteredRectInRect;
- (void)testSizeConstrainedToWidth;
- (void)testSizeConstrainedToHeight;
- (void)testSizeContainsSize;
- (void)testSizeConstrainedToSize;
- (void)testHeightForSizeConstrainedToWidth;

@end
