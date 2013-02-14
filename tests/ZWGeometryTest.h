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
- (void)testCenteredRectInRect;
- (void)testSizeForMaxWidth;
- (void)testSizeForMaxHeight;
- (void)testHeightForSizeConstrainedToWidth;

@end
