//
//  NSDate+CHUtil.h
//  MyXCTestForCategory
//
//  Created by chang on 15/3/20.
//  Copyright (c) 2015年 chang. All rights reserved.
//
//  类别：扩展NSDate常用方法

#import <Foundation/Foundation.h>

@interface NSDate (CHUtil)

/**
 *  将日期格式化为公历/阳历
 *
 *  @return str
 */
//- (CFGregorianDate)cfGregorianDateForNSDate:(NSDate *)date {
- (CFGregorianDate)convertNSDateToCFGregorianDate ;


#pragma mark- 对NS日期进行日期加减，dayNum为正数表示加，为负数表示减
/**
 *  对NS日期进行日期加减，dayNum为正数表示加，为负数表示减
 *
 *  @param dayNum 加减的天数
 *
 *  @return 加减操作后的日期
 */
//- (NSDate *)addDateByNsdate:(NSDate *)date addDay:(int)dayNum {
- (NSDate *)addDays:(int)dayNum ;


#pragma mark - 根据日期判断是星期几
/**
 *  根据日期判断是星期几
 *
 *  @param tempDate
 *
 *  @return NSString 1:星期一 2：星期二 以此类推
 */
//- (NSString *)getWeekdayByDay:(NSDate *)tempDate {
- (NSString *)getWeekdayByDay ;


/**
 *  将日期对象格式化成字符串,格式化的格式由日期表达式reg指定
 *
 *  @param reg     格式 @"yyyy-MM-dd"
 *
 *  @return 转换后的字符串
 */
//- (NSString *)formatterDateToString:(NSDate *)nowDate reg:(NSString *)reg{
- (NSString *)convertDateToStringWithFormat: (NSString *)reg;


@end
