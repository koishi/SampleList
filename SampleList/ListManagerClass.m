//
//  ListManagerClass.m
//  SampleList
//
//  Created by bs on 2015/04/05.
//  Copyright (c) 2015年 bs. All rights reserved.
//

#import "ListManagerClass.h"

@implementation ListManagerClass

static ListManagerClass *listManager = nil;

+ (instancetype)listManager
{
  if (listManager) {
    listManager = [[ListManagerClass alloc]init];
  }
  return listManager;
}

@end
