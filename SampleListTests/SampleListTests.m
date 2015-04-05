//
//  SampleListTests.m
//  SampleListTests
//
//  Created by bs on 2015/04/05.
//  Copyright (c) 2015年 bs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "ListManagerClass.h"

@interface SampleListTests : XCTestCase {
  ListManagerClass *listManager;
}

@end

@implementation SampleListTests

- (void)setUp {
  [super setUp];
  listManager = [ListManagerClass defaultList];
}

- (void)tearDown {
  // Put teardown code here. This method is called after the invocation of each test method in the class.
  [super tearDown];
}

- (void)testCreateList
{
  [listManager createData];
  XCTAssertEqual([listManager.list count], 1000);
}

- (void)testAdd
{
  [listManager addData:@"123456"];
  XCTAssertEqual([listManager.list count], 1000);
  XCTAssertEqual([listManager searchData:@"123456"], 0);
}

//- (void)testPerformanceExample
//{
//  // This is an example of a performance test case.
//  [self measureBlock:^{
//    // Put the code you want to measure the time of here.
//  }];
//}

@end
