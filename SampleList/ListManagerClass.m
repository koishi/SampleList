//
//  ListManagerClass.m
//  SampleList
//
//  Created by bs on 2015/04/05.
//  Copyright (c) 2015年 bs. All rights reserved.
//

#import "ListManagerClass.h"
#import "TimerClass.h"

@implementation ListManagerClass

static ListManagerClass *defaultList = nil;

+ (ListManagerClass *)defaultList
{
  if (!defaultList)
  {
    defaultList = [[ListManagerClass alloc]init];
  }
  return defaultList;
}

- (id)init
{
  if (defaultList) {
    return defaultList;
  }
  self = [super init];
  return self;
}

- (void)createData
{
  TimerClass *timer = [[TimerClass alloc]init];
  [timer start];

  self.list = [NSMutableArray array];
  for (NSInteger i = 1; i < 1001; i++) {
    [self.list addObject:[NSString stringWithFormat:@"%04ld", (long)i]];
  }

  [timer stop];
}

- (void)addData:(NSString *)data
{
  TimerClass *timer = [[TimerClass alloc]init];
  [timer start];

  // 同じデータが無いか調べる
  NSInteger index = [self searchData:data];
  if (index > -1) {
    [self.list removeObjectAtIndex:index];
  }
  
  // 配列の最初に挿入
  [self.list insertObject:data atIndex:0];

  // 最終的に1000件を超えていたら最後のデータを削除
  if ([self.list count] > 1000) {
    [self.list removeObjectAtIndex:1000];
  }

  [timer stop];
}

- (NSInteger)searchData:(NSString *)data
{
  // オブジェクト型でない変数をBlock内で操作する場合は__block修飾子が必要
  __block NSInteger result = -1;

  [self.list enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {
    if ([obj isEqualToString:data]) {
      result = idx;
      *stop = YES;
    }
  }];

  return result;
}

@end
