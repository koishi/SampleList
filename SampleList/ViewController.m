//
//  ViewController.m
//  SampleList
//
//  Created by bs on 2015/04/05.
//  Copyright (c) 2015年 bs. All rights reserved.
//

#import "ViewController.h"
#import "ListManagerClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];

  ListManagerClass *listManager = [ListManagerClass defaultList];
  
  [listManager createData];

  [listManager addData:@"0999"];
  NSLog(@"%@",listManager.list);

  if ([listManager searchDataBool:@"0999"]) {
    NSLog(@"発見しました");
  } else {
    NSLog(@"見つかりませんでした");
  }
  
  if ([listManager searchDataBool:@"1000"]) {
    NSLog(@"発見しました");
  } else {
    NSLog(@"見つかりませんでした");
  }

  if ([listManager searchDataBool:@"1001"]) {
    NSLog(@"発見しました");
  } else {
    NSLog(@"見つかりませんでした");
  }
  
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
