//
//  ZWRectHelpersTest.m
//  ZWKit
//
//  Created by Zach Waugh on 8/26/11.
//  Copyright 2011 Zach Waugh. All rights reserved.
//

#import "ZWGeometryTest.h"
#import "ZWGeometry.h"

@implementation ZWGeometryTest

#pragma mark - Rect

- (void)testRectWithWidth
{
  NSRect rect = NSMakeRect(0, 0, 100, 100);
  NSRect newRect = ZWRectWithWidth(rect, 200);
  
  expect(newRect.size.width).to.equal(200);
  expect(newRect.size.height).to.equal(100);
  expect(newRect.origin.x).to.equal(0);
  expect(newRect.origin.y).to.equal(0);
}

- (void)testRectWithHeight
{
  NSRect rect = NSMakeRect(0, 0, 100, 100);
  NSRect newRect = ZWRectWithHeight(rect, 200);
  
  expect(newRect.size.height).to.equal(200);
  expect(newRect.size.width).to.equal(100);
  expect(newRect.origin.x).to.equal(0);
  expect(newRect.origin.y).to.equal(0);
}

- (void)testCenteredRectInRect
{
  NSRect expected = NSMakeRect(40, 40, 20, 20);
	NSRect centered = ZWCenteredRectInRect(NSMakeRect(0, 0, 20, 20), NSMakeRect(0, 0, 100, 100));
	
	expect(NSEqualRects(expected, centered)).to.beTruthy();
	
	expected = NSMakeRect(30, 20, 16, 16);
	centered = ZWCenteredRectInRect(NSMakeRect(0, 0, 16, 16), NSMakeRect(10, 10, 56, 36));
	
	expect(NSEqualRects(expected, centered)).to.beTruthy();
}

#pragma mark - Size

- (void)testSizeForMaxWidth
{
  NSSize originalSize = NSMakeSize(4000, 3000);
  
  NSSize size = ZWSizeForMaxWidth(originalSize, 500);
  expect(size.width).to.equal(500);
  expect(size.height).to.equal(375);
  
  originalSize = NSMakeSize(2000, 4000);
  size = ZWSizeForMaxWidth(originalSize, 500);
  expect(size.width).to.equal(500);
  expect(size.height).to.equal(1000);
}

- (void)testSizeForMaxHeight
{
  NSSize originalSize = NSMakeSize(1024, 768);
  
  NSSize size = ZWSizeForMaxHeight(originalSize, 500);
  expect(size.width).to.equal(667);
  expect(size.height).to.equal(500);
  
  originalSize = NSMakeSize(800, 1200);
  size = ZWSizeForMaxHeight(originalSize, 600);
  expect(size.width).to.equal(400);
  expect(size.height).to.equal(600);
}

- (void)testHeightForSizeConstrainedToWidth
{
  expect(ZWHeightForSizeConstrainedToWidth(CGSizeMake(100, 100), 100)).to.equal(100);
  expect(ZWHeightForSizeConstrainedToWidth(CGSizeMake(101, 101), 100)).to.equal(100);
  expect(ZWHeightForSizeConstrainedToWidth(CGSizeMake(50, 50), 100)).to.equal(50);
  expect(ZWHeightForSizeConstrainedToWidth(CGSizeMake(100, 100), 50)).to.equal(50);
  expect(ZWHeightForSizeConstrainedToWidth(CGSizeMake(400, 300), 100)).to.equal(75);
  expect(ZWHeightForSizeConstrainedToWidth(CGSizeMake(300, 400), 100)).to.equal(133);
  expect(ZWHeightForSizeConstrainedToWidth(CGSizeMake(100, 100), 500)).to.equal(100);
  
  expect(ZWHeightForSizeConstrainedToWidth(CGSizeMake(101, 101), 100)).toNot.equal(101);
}

@end