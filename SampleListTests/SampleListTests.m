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

- (void)testAddData
{
  [listManager createData];

  [listManager addData:@"123456"];
  XCTAssertEqual([listManager.list count], 1000);
  XCTAssertEqual([listManager searchData:@"123456"], 0);

  [listManager addData:@"1234567"];
  XCTAssertEqual([listManager.list count], 1000);
  XCTAssertEqual([listManager searchData:@"1234567"], 0);
  XCTAssertEqual([listManager searchData:@"123456"], 1);
}

- (void)testRemoveLastData
{
  [listManager createData];
  XCTAssertEqual([listManager searchData:@"1000"], 999);

  [listManager addData:@"123456"];
  XCTAssertEqual([listManager searchData:@"1000"], NSNotFound);

  XCTAssertEqual([listManager searchData:@"0999"], 999);
}

@end
