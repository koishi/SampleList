//
//  TimerClass.m
//  SampleList
//
//  Created by bs on 2015/04/05.
//  Copyright (c) 2015年 bs. All rights reserved.
//

#import "TimerClass.h"

@interface TimerClass()

@property NSDate *startDate;
@property NSDate *endDate;

@end

@implementation TimerClass

- (void)start
{
  // 処理開始位置で現在時間を代入
  self.startDate = [NSDate date];
}

- (void)stop
{
  // 処理終了位置で現在時間を代入
  self.endDate = [NSDate date];
  [self result];
}

- (void)result
{
  // 開始時間と終了時間の差を表示
  NSTimeInterval interval = [self.endDate timeIntervalSinceDate:self.startDate];
  NSLog(@"処理開始時間 = %@",[self getDateString:self.startDate]);
  NSLog(@"処理終了時間 = %@",[self getDateString:self.endDate]);
  NSLog(@"処理時間 = %.3f秒",interval);
}

// 日付をミリ秒までの表示にして文字列で返すメソッド
- (NSString*)getDateString:(NSDate*)date
{
  // 日付フォーマットオブジェクトの生成
  NSDateFormatter *dateFormatter = [NSDateFormatter new];
  // フォーマットを指定の日付フォーマットに設定
  [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss.SSS"];
  // 日付の文字列を生成
  NSString *dateString = [dateFormatter stringFromDate:date];
  
  return dateString;
}

@end
