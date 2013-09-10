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
  CGRect rect = CGRectMake(0, 0, 100, 100);
  CGRect newRect = ZWRectWithWidth(rect, 200);
  
  expect(newRect.size.width).to.equal(200);
  expect(newRect.size.height).to.equal(100);
  expect(newRect.origin.x).to.equal(0);
  expect(newRect.origin.y).to.equal(0);
}

- (void)testRectWithHeight
{
  CGRect rect = CGRectMake(0, 0, 100, 100);
  CGRect newRect = ZWRectWithHeight(rect, 200);
  
  expect(newRect.size.height).to.equal(200);
  expect(newRect.size.width).to.equal(100);
  expect(newRect.origin.x).to.equal(0);
  expect(newRect.origin.y).to.equal(0);
}

- (void)testRectFitToRect
{
  // Simple case - rect completely fits in container and is centered
  CGRect rect = CGRectMake(0, 0, 100, 100);
  CGRect container = CGRectMake(0, 0, 1000, 1000);
  CGRect newRect = ZWRectFitToRect(rect, container);
  
  expect(newRect.size.height).to.equal(100);
  expect(newRect.size.width).to.equal(100);
  expect(newRect.origin.x).to.equal(450);
  expect(newRect.origin.y).to.equal(450);
}

- (void)testCenteredRectInRect
{
  CGRect expected = CGRectMake(40, 40, 20, 20);
	CGRect centered = ZWCenteredRectInRect(CGRectMake(0, 0, 20, 20), CGRectMake(0, 0, 100, 100));
	
	expect(CGRectEqualToRect(expected, centered)).to.beTruthy();
	
	expected = CGRectMake(30, 20, 16, 16);
	centered = ZWCenteredRectInRect(CGRectMake(0, 0, 16, 16), CGRectMake(10, 10, 56, 36));
	
	expect(CGRectEqualToRect(expected, centered)).to.beTruthy();
}

#pragma mark - Size

- (void)testSizeConstrainedToWidth
{
  CGSize originalSize = CGSizeMake(4000, 3000);
  
  CGSize size = ZWSizeConstrainedToWidth(originalSize, 500);
  expect(size.width).to.equal(500);
  expect(size.height).to.equal(375);
  
  originalSize = CGSizeMake(2000, 4000);
  size = ZWSizeConstrainedToWidth(originalSize, 500);
  expect(size.width).to.equal(500);
  expect(size.height).to.equal(1000);
  
  originalSize = CGSizeMake(200, 200);
  size = ZWSizeConstrainedToWidth(originalSize, 500);
  expect(size.width).to.equal(200);
  expect(size.height).to.equal(200);
}

- (void)testSizeConstrainedToHeight
{
  CGSize originalSize = CGSizeMake(1024, 768);
  
  CGSize size = ZWSizeConstrainedToHeight(originalSize, 500);
  expect(size.width).to.equal(667);
  expect(size.height).to.equal(500);
  
  originalSize = CGSizeMake(800, 1200);
  size = ZWSizeConstrainedToHeight(originalSize, 600);
  expect(size.width).to.equal(400);
  expect(size.height).to.equal(600);
  
  originalSize = CGSizeMake(200, 200);
  size = ZWSizeConstrainedToHeight(originalSize, 500);
  expect(size.width).to.equal(200);
  expect(size.height).to.equal(200);
}

- (void)testHeightForSizeConstrainedToWidth
{
	CGSize originalSize = CGSizeMake(4000, 3000);
  expect(ZWHeightForSizeConstrainedToWidth(originalSize, 500)).to.equal(375);
}

- (void)testSizeContainsSize
{
	expect(ZWSizeContainsSize(CGSizeMake(5, 5), CGSizeMake(1, 1))).to.beTruthy();
	expect(ZWSizeContainsSize(CGSizeMake(500, 500), CGSizeMake(400, 400))).to.beTruthy();
	expect(ZWSizeContainsSize(CGSizeMake(500, 500), CGSizeMake(1000, 1000))).to.beFalsy();
	expect(ZWSizeContainsSize(CGSizeMake(500, 500), CGSizeMake(1000, 400))).to.beFalsy();
	expect(ZWSizeContainsSize(CGSizeMake(500, 500), CGSizeMake(400, 1000))).to.beFalsy();
	expect(ZWSizeContainsSize(CGSizeMake(500, 500), CGSizeMake(500, 500))).to.beTruthy();
}

- (void)testSizeConstrainedToSize
{
	expect(ZWSizeConstrainedToSize(CGSizeMake(500, 500), CGSizeMake(500, 500))).to.equal(CGSizeMake(500, 500));
	expect(ZWSizeConstrainedToSize(CGSizeMake(400, 400), CGSizeMake(500, 500))).to.equal(CGSizeMake(400, 400));
	expect(ZWSizeConstrainedToSize(CGSizeMake(1000, 1000), CGSizeMake(500, 500))).to.equal(CGSizeMake(500, 500));
}

@end
