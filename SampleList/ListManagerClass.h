//
//  ListManagerClass.h
//  SampleList
//
//  Created by bs on 2015/04/05.
//  Copyright (c) 2015年 bs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListManagerClass : NSObject

@property NSMutableArray *list;

+ (ListManagerClass *)defaultList;

- (void)createData;

- (void)addData:(NSString *)data;

- (NSInteger)searchData:(NSString *)data;

- (BOOL)searchDataBool:(NSString *)data;

- (BOOL)loadFromFile;

- (BOOL)saveToFile;

@end
