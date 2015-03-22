//
//  NSDate+CHUtil.m
//  MyXCTestForCategory
//
//  Created by chang on 15/3/20.
//  Copyright (c) 2015年 chang. All rights reserved.
//

#import "NSDate+CHUtil.h"
#import "NSString+CHUtil.h"
#import "InternationalUtil.h"

#define kFlightDateKey    @"Date"
#define kFlightWeekKey    @"Week"


@implementation NSDate (CHUtil)


/**
 *  将日期格式化为公历/阳历
 *
 *  @return str
 */
//- (CFGregorianDate)cfGregorianDateForNSDate:(NSDate *)date {
- (CFGregorianDate)convertNSDateToCFGregorianDate {
    
    NSString * str = [self convertDateToStringWithFormat:@"yyyy-MM-dd hh:mm:ss"];
    CFGregorianDate d = [str stringDateToCFGregorianDate];

    return d;
}


#pragma mark- 对NS日期进行日期加减，dayNum为正数表示加，为负数表示减
/**
 *  对NS日期进行日期加减，dayNum为正数表示加，为负数表示减
 *
 *  @param dayNum 加减的天数
 *
 *  @return 加减操作后的日期
 */
//- (NSDate *)addDateByNsdate:(NSDate *)date addDay:(int)dayNum {
- (NSDate *)addDays:(int)dayNum {
    
    NSTimeInterval interval = dayNum * 24 * 60 * 60;
    NSDate * d = [[NSDate alloc] initWithTimeInterval:interval sinceDate:self];
    return d;
}


#pragma mark - 根据日期判断是星期几
/**
 *  根据日期判断是星期几
 *
 *  @param tempDate
 *
 *  @return NSString 1:星期一 2：星期二 以此类推
 */
//- (NSString *)getWeekdayByDay:(NSDate *)tempDate {
- (NSString *)getWeekdayByDay {
    NSString *weekStr = @"";
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *weekComponents;
    weekComponents = [calendar components:NSWeekdayCalendarUnit fromDate:self];
    NSInteger weekDay = [weekComponents weekday];
    //这里,weekDay 1：星期日 2:星期一......
    weekDay -= 1;
    if (weekDay <= 0) {
        weekDay = 7;
    }
    NSString *keyStr= [NSString stringWithFormat:@"common_components_calendar_02000%li", (long)weekDay];
    weekStr = NSLocalizedStringWithInternational(keyStr, @"星期");
    return weekStr;
}

/**
 *  将日期对象格式化成字符串,格式化的格式由日期表达式reg指定
 *
 *  @param reg     格式 @"yyyy-MM-dd"
 *
 *  @return 转换后的字符串
 */
//- (NSString *)formatterDateToString:(NSDate *)nowDate reg:(NSString *)reg{
- (NSString *)convertDateToStringWithFormat: (NSString *)reg{
    if(self ==nil || reg==nil || [reg length]==0){
        return @"";
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init] ;
    [formatter setDateFormat:reg];
    NSString * str = [formatter stringFromDate:self];
    return str;
}






@end








