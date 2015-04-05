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
static NSInteger listCount = 1000;

#pragma mark - LifeCycle

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
  [self loadFromFile];
  return self;
}

#pragma mark - Method

- (void)createData
{
  TimerClass *timer = [[TimerClass alloc]init];
  [timer start];

  self.list = [NSMutableArray array];
  for (NSInteger i = 0; i < listCount; i++) {
    [self.list addObject:[NSString stringWithFormat:@"%04ld", (long)i + 1]];
  }

  [timer stop];
}

- (void)addData:(NSString *)data
{
  TimerClass *timer = [[TimerClass alloc]init];
  [timer start];

  // 同じデータが無いか調べる
  NSInteger index = [self searchData:data];
  if (index != NSNotFound) {
    [self.list removeObjectAtIndex:index];
  }
  
  // 配列の最初に挿入
  [self.list insertObject:data atIndex:0];

  // 最終的に1000件を超えていたら最後のデータを削除
  if ([self.list count] > listCount) {
    [self.list removeObjectAtIndex:listCount];
  }

//  [self saveToFile];
  [timer stop];
}

- (NSInteger)searchData:(NSString *)data
{
  TimerClass *timer = [[TimerClass alloc]init];
  [timer start];
  
  // 配列から要素を検索する
  NSInteger index = [self.list indexOfObject:data];

  if (index != NSNotFound) {
//    NSLog(@"%i番目にありました．", index);
  } else {
//    NSLog(@"見つかりませんでした．");
  }

  [timer stop];

  return index;
}

- (BOOL)searchDataBool:(NSString *)data
{
  TimerClass *timer = [[TimerClass alloc]init];
  [timer start];

  if ([self searchData:data] != NSNotFound) {
    [timer stop];
    return YES;
  } else {
    [timer stop];
    return NO;
  }
}

#pragma mark - FileSystem

- (NSString*)filePath
{
  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
  NSString *directory = [paths objectAtIndex:0];
  return [directory stringByAppendingPathComponent:@"data.plist"];
}

- (BOOL)saveToFile
{
  TimerClass *timer = [[TimerClass alloc]init];
  [timer start];

  BOOL successful = [self.list writeToFile:[self filePath] atomically:NO];
  if (successful) {
    NSLog(@"%@", @"データの保存に成功しました。");
    
  }

  [timer stop];
  return successful;
}

- (BOOL)loadFromFile
{
  TimerClass *timer = [[TimerClass alloc]init];
  [timer start];

  self.list = [[NSMutableArray alloc] initWithContentsOfFile:[self filePath]];
  if (self.list) {
    NSLog(@"%@", @"データは存在しました。");
  } else {
    NSLog(@"%@", @"データが存在しません。");
    self.list = [NSMutableArray array];
  }

  [timer stop];
  return YES;
}

@end
