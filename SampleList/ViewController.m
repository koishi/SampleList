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

@property (weak, nonatomic) IBOutlet UITextField *addDataText;

@property (weak, nonatomic) IBOutlet UITextField *searchDataText;

@property ListManagerClass *listManager;

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.listManager = [ListManagerClass defaultList];

  // 背景をキリックしたら、キーボードを隠す
  UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeSoftKeyboard)];
  [self.view addGestureRecognizer:gestureRecognizer];
}

- (void)createSampleData
{  
  for (int i = 0; i < 1000; i++) {
    NSInteger i4 = arc4random()%1000000000;
    [self.listManager addData:[NSString stringWithFormat:@"%15ld", (long)i4]];
  }
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

#pragma mark - Button Event

- (IBAction)createSimpleDataButtonTapped:(id)sender {
  [self.listManager createData];
}

- (IBAction)creatButtonTapped:(id)sender {
  [self createSampleData];
}

- (IBAction)addDataButtonTapped:(id)sender {
  [self.listManager addData:self.addDataText.text];
}

- (IBAction)searchDataButtonTapped:(id)sender {
  [self.listManager searchData:self.searchDataText.text];
}

// キーボードを隠す処理
- (void)closeSoftKeyboard {
  [self.view endEditing: YES];
}

@end
