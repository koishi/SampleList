//
//  ListManagerClass.m
//  SampleList
//
//  Created by bs on 2015/04/05.
//  Copyright (c) 2015年 bs. All rights reserved.
//

#import "ListManagerClass.h"

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
  self.list = [NSMutableArray array];
  for (NSInteger i = 0; i < 1000; i++) {
    [self.list addObject:[NSString stringWithFormat:@"%04ld", (long)i]];
  }
}

@end
