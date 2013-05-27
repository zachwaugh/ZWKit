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

- (void)testRectFitToRect
{
  // Simple case - rect completely fits in container and is centered
  NSRect rect = NSMakeRect(0, 0, 100, 100);
  NSRect container = NSMakeRect(0, 0, 1000, 1000);
  NSRect newRect = ZWRectFitToRect(rect, container);
  
  expect(newRect.size.height).to.equal(100);
  expect(newRect.size.width).to.equal(100);
  expect(newRect.origin.x).to.equal(450);
  expect(newRect.origin.y).to.equal(450);
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

- (void)testSizeConstrainedToWidth
{
  NSSize originalSize = NSMakeSize(4000, 3000);
  
  NSSize size = ZWSizeConstrainedToWidth(originalSize, 500);
  expect(size.width).to.equal(500);
  expect(size.height).to.equal(375);
  
  originalSize = NSMakeSize(2000, 4000);
  size = ZWSizeConstrainedToWidth(originalSize, 500);
  expect(size.width).to.equal(500);
  expect(size.height).to.equal(1000);
  
  originalSize = NSMakeSize(200, 200);
  size = ZWSizeConstrainedToWidth(originalSize, 500);
  expect(size.width).to.equal(200);
  expect(size.height).to.equal(200);
}

- (void)testSizeConstrainedToHeight
{
  NSSize originalSize = NSMakeSize(1024, 768);
  
  NSSize size = ZWSizeConstrainedToHeight(originalSize, 500);
  expect(size.width).to.equal(667);
  expect(size.height).to.equal(500);
  
  originalSize = NSMakeSize(800, 1200);
  size = ZWSizeConstrainedToHeight(originalSize, 600);
  expect(size.width).to.equal(400);
  expect(size.height).to.equal(600);
  
  originalSize = NSMakeSize(200, 200);
  size = ZWSizeConstrainedToHeight(originalSize, 500);
  expect(size.width).to.equal(200);
  expect(size.height).to.equal(200);
}

- (void)testHeightForSizeConstrainedToWidth
{
	NSSize originalSize = NSMakeSize(4000, 3000);
  expect(ZWHeightForSizeConstrainedToWidth(originalSize, 500)).to.equal(375);
}

- (void)testSizeContainsSize
{
	expect(ZWSizeContainsSize(NSMakeSize(5, 5), NSMakeSize(1, 1))).to.beTruthy();
	expect(ZWSizeContainsSize(NSMakeSize(500, 500), NSMakeSize(400, 400))).to.beTruthy();
	expect(ZWSizeContainsSize(NSMakeSize(500, 500), NSMakeSize(1000, 1000))).to.beFalsy();
	expect(ZWSizeContainsSize(NSMakeSize(500, 500), NSMakeSize(1000, 400))).to.beFalsy();
	expect(ZWSizeContainsSize(NSMakeSize(500, 500), NSMakeSize(400, 1000))).to.beFalsy();
	expect(ZWSizeContainsSize(NSMakeSize(500, 500), NSMakeSize(500, 500))).to.beTruthy();
}

- (void)testSizeConstrainedToSize
{
	expect(ZWSizeConstrainedToSize(NSMakeSize(500, 500), NSMakeSize(500, 500))).to.equal(NSMakeSize(500, 500));
	expect(ZWSizeConstrainedToSize(NSMakeSize(400, 400), NSMakeSize(500, 500))).to.equal(NSMakeSize(400, 400));
	expect(ZWSizeConstrainedToSize(NSMakeSize(1000, 1000), NSMakeSize(500, 500))).to.equal(NSMakeSize(500, 500));
}

@end
