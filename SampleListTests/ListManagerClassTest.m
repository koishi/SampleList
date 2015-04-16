//
//  ListManagerClassTest.m
//  SampleList
//
//  Created by bs on 2015/04/05.
//  Copyright (c) 2015年 bs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "ListManagerClass.h"

@interface ListManagerClassTest : XCTestCase
{
  ListManagerClass *listManager;
}

@end

@implementation ListManagerClassTest

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

- (void)testDataLoadFromFile
{
  [self measureBlock:^{
    [listManager loadFromFile];
  }];
}

- (void)testDataWriteToFile
{
  [self measureBlock:^{
    [listManager saveToFile];
  }];
}

- (void)testDataSearch
{
  [listManager createData];
  [self measureBlock:^{
      for (NSInteger i = 0; i < 1000; i++) {
          [listManager searchData:@"testtest"];
      }
  }];
}

@end
