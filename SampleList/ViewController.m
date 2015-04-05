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

- (void)viewDidLoad {
  [super viewDidLoad];

  ListManagerClass *listManager = [ListManagerClass defaultList];
  [listManager createData];

  NSLog(@"%@",listManager.list);
  
  
  [listManager addData:@"99999"];
  
  NSLog(@"%@",listManager.list);
  
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
