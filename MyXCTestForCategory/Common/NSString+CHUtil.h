//
//  NSString+CHUtil.h
//  MyXCTestForCategory
//
//  Created by chang on 15/3/20.
//  Copyright (c) 2015年 chang. All rights reserved.
//  类别：扩展NSString常用方法

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCrypto.h>
#import <UIKit/UIKit.h>

@interface NSString (CHUtil)

// TODO: 工程中方法替换完之后删除无用注释

/**
 *  Encode字符串
 *
 *  @return 经Encode操作后的字符串
 */
- (NSString *)urlEncodeValue ;

/**
 *  Decode字符串
 *
 *  @return 经Decode操作后的字符串
 */
- (NSString *)urlDecodeString ;


/**
 *  拼接spring3gRoot到url字符串中
 *
 *  @return 字符串拼接spring3gRoot后的字符串
 */
- (NSString *)appendToSpring3GRootUrl ;


/**
 *  拼接mwebRoot到url字符串中
 *
 *  @return 字符串拼接mwebRoot后的字符串
 */
- (NSString *)appendToMWebRootUrl ;

/**
 *  拼接新mwebRoot到url字符串中
 *
 *  @return 字符串拼接新mwebRoot后的字符串
 */
- (NSString *)appendToNewMWebRootUrl ;


/**
 *  拼接tour3gRoot到url字符串中
 *
 *  @return 字符串拼接tour3gRoot后的字符串
 */
- (NSString *)appendToTour3gRootUrl ;

/**
 *  拼接eBusiness3gRoot到url字符串中
 *
 *  @return 字符串拼接eBusiness3gRoot后的字符串
 */
- (NSString *)appendToEBusiness3gRootUrl ;

/**
 *  拼接root_provision到url中
 *
 *  @return 字符串拼接root_provision后的字符串
 */
// TODO:去除InternationalUtil类引用
- (NSString *)appendToProvisonRootUrl ;

/**
 *  字符串md5加密
 *
 *  @return 字符串md5加密后的字符串
 */
- (NSString *) md5Encrypt ;


// TODO: 以下需要自动再自动生成注释


/**
 *  判断字符串是否为空
 *
 *  @return 如果字符串为nil、null、字符串长度为0，返回YES；否则返回NO
 */
- (BOOL)isEmpty ;

/**
 *  判断字符串是否为邮箱内容
 *
 *  @return 字符串为空或者字符串不含有@符号，返回NO，否则返回YES
 */
- (BOOL)validateEmail ;



/**
 *  number转换成字符串numStr,根据传入参数长度，判断numStr字符串前面是否补0
 *
 *  @param number 前面要补零处理的参数
 *  @param len    长度参数，根据此长度判断怎样补零
 *
 *  @return 如果number转换后的字符串numStr长度小于len,numStr前补零，否则numStr前不补零，最后返回numStr
 */
- (NSString *)patchZero:(NSInteger)number length:(NSInteger)len ;

/**
 *  字符串后加 *(len)
 *
 *  @param len *(len)括号内要显示的内容
 *
 *  @return 经处理过的字符串
 */
- (NSString *)tailStarWithLength:(NSInteger)len ;



/**
 *  转换空字符为 @""
 *
 *  @return 经处理后的字符串
 */
- (NSString *)convertEmpty ;

/**
 *  判断字符串是否全为英文字母
 *
 *  @return 字符串含有英文字母，返回YES,否则返回NO
 */
- (BOOL)charIsLetter ;

/**
 *  判断字符串是否包含数字
 *
 *  @return 字符串含有数字，返回YES,否则返回NO
 */
- (BOOL)charIsNum ;

/**
 *  判断字符串是否全为数字
 *
 *  @return 字符串全为数字返回YES，否则返回NO
 */
- (BOOL)charIsAllNum ;

/**
 *  判断字符串是否包含特殊符号
 *
 *  @return 字符串包含特殊符号，返回YES,否则返回NO
 */
- (BOOL)isSecureString ;

/**
 *  判断字符串是否含有数字或者特殊字符
 *
 *  @return 字符串不含数字或者不含特殊字符，返回NO,否则返回YES
 *         (即，字符串既含有数字又含有特殊字符返回YES，否则返回NO)
 */
- (BOOL)checkIllegalStr ;



/**
 *  忽略大小写比较字符串是否相等
 *
 *  @param str 本字符串与之比较的字符串
 *
 *  @return 忽略大小写比较字符串，相等返回YES,否则返回NO
 */
- (BOOL)isIgnoreCaseEqualsToStr:(NSString *)str ;



/**
 *  java Boolean类型转换为iOS Boolean值
 *
 *  @return 只有booleanStr值为true时,返回值才会是YES,否则都为NO;
 */
- (BOOL)javaBooleanToIOSBool ;

/**
 *  将字符串转换成BOOL类型值，
 *
 *  @return 只有字符串为 @"YES" 或 @"Y" 时，返回值才为YES
 */
- (BOOL) stringToBool:(NSString *)boolStr ;

/**
 *  计算reg字符串在字符串中出现的个数
 *
 *  @param reg 被包含字符串
 *
 *  @return 返回字符串包含reg字符串的个数
 */
- (int)numberForString: (NSString *)reg ;


/**
 *  返回reg字符串在被比较字符串中最后出现的位置
 *
 *  @param reg reg字符串
 *
 *  @return reg字符串在被比较字符串位置
 */
- (int) lastIndexForString: (NSString *)reg ;

/**
 *  判断字符串是否以arg结尾
 *
 *  @param arg   是否以arg结尾
 *
 *  @return 字符串是以arg结尾返回YES 否则返回NO
 */
- (BOOL)endsWith:(NSString *)arg ;

/**
 *  判断字符串resource是否以arg开头
 *
 *  @param arg    是否以arg开头
 *
 *  @return 字符串是以arg开头返回YES 否则返回NO
 */
- (BOOL)startsWith:(NSString *)arg ;
/**
 *  删除指定字符串的结尾字符串
 *
 *  @param arg  arg结尾字符串
 *
 *  @return 字符串以arg结尾，删除arg并返回，否则直接返回字符串
 */
- (NSString *)removeEndsWith: (NSString *)arg ;


/**
 *  去掉字符串空格,包括字符串内部空格
 *
 *  @return 去掉字符串空格后的字符串
 */
- (NSString *)trim ;

/**
 *  去除字符串两边空格
 *
 *  @return NSString
 */
- (NSString *)trimForSide ;


/**
 *  对URL进行解析
 *
 *  @param isEncode 字符串是否Encode
 *
 *  @return URL进行解析后的字典
 */
- (NSDictionary *)parseURL :(BOOL)isEncode ;

/**
 *  根据指定的字符串解析字符串，指定字符串前面的作为key，后面的作为value
 *
 *  @param symbolValue 指定字符串
 *
 *  @return 含有字典的数组
 */
- (NSArray *)parseMapValueByString:(NSString *)symbolValue ;


/**
 *  判断字符串是否为空，如果为空则返回替换字符串；如果非空，返回目标字符串
 *
 *  @param replaceStr 替换字符串
 *
 *  @return 字符串为空则返回替换字符串；否则，返回目标字符串
 */
- (NSString *)replaceIfEmptyWith:(NSString *)replaceStr ;

/**
 *  计算字符串高度
 *
 *  @param tempFont  NSFontAttributeName字体属性
 *  @param tempWidth 字符串宽度
 *
 *  @return 字符串高度
 */
- (float)getHeightForValueWithFont:(UIFont *)tempFont width:(float)tempWidth ;

/**
 *  计算字符串宽度
 *
 *  @param tempFont   字体属性
 *  @param tempHeight 字符串宽度
 *
 *  @return 字符串宽度
 */
- (float)getWidthForValueWithFont:(UIFont *)tempFont height:(float)tempHeight ;

/**
 *  截取快递状态的日期字符串，月日
 *
 *  @return 返回截取的月日
 */
- (NSString *)convertStrForExpressStatusDate ;

/**
 *  判断字符串是否仅包含中文、英文、数字
 *
 *  @param str NSString
 *
 *  @return 字符串仅包含中文、英文、数字返回YES,否则返回NO
 */
- (BOOL)isOnlyContainChinaEnglishNumber ;

/**
 *  判断字符串是否仅包含中文、英文
 *
 *  @return 仅包含中文、英文返回YES,否则返回NO
 */
- (BOOL)isOnlyContainChinaEnglish ;

/**
 *  判断是否仅包含英文、数字
 *
 *  @return 字符串仅包含英文、数字返回YES，否则返回NO
 */
- (BOOL)isOnlyContainEnglishNumber ;

/**
 *  判断是否仅包含数字
 *
 *  @return 仅包含数字返回YES，否则返回NO
 */
- (BOOL)isOnlyContainNumber ;


#pragma mark -
#pragma mark - 以下为和时间相关方法

/**
 *  转换'yyyy-mm-dd'格式字符串到'yyyymmdd'格式字符串
 *
 *  @return  返回的'yyyymmdd'格式字符串
 */
- (NSString *)getYYYYMMDDDateString ;

/**
 *  转换'yyyymmdd'格式字符串到'yyyy_mm_dd'格式
 *
 *  @return 返回的'yyyy_mm_dd'格式字符串
 */
- (NSString *)getYYYY_MM_DDDateString ;

/**
 *  转换'yyyymmdd'格式字符串到'yyyy-mm-dd'格式
 *
 *  @return 返回的'yyyy-mm-dd'格式字符串
 */
- (NSString *)getYYYYMMDDDateStringHengXian ;


/**
 *  比较两个日期字符串相差的年数
 *
 *  @param secondDateStr 被比较的日期字符串
 *
 *  @return 返回两个字符串相差的年数
 */
//(NSInteger)compareYearDiffer:(NSString *)firstDateStr secondDate:(NSString *)secondDateStr
- (NSInteger)compareYearDifferToSecondDate:(NSString *)secondDateStr;


/**
 *  比较两个日期字符串相差的天数
 *
 *  @param secondDateStr  被比较的日期字符串
 *
 *  @return 返回两个字符串相差的天数
 */
//(NSUInteger)compareDayDiffer:(NSString *)firstDateStr secondDate:(NSString *)secondDateStr
- (NSUInteger)compareDayDifferToSecondDate:(NSString *)secondDateStr;



#pragma mark- 1:星期一 2：星期二 以此类推
/**
 *  根据输入数字返回是星期几
 *
 *  @param weekday 输入的参数 如1、2、3、4、5、6、7
 *
 *  @return 返回的星期几
 */
- (NSString *)getWeekdayByInteger:(NSInteger)weekday;


/**
 *  将字符串转换为日期格式
 *
 *  @return 返回的日期
 */
- (NSDate *)convertStringToDate ;


/**
 *  将字符串按照指定格式转换为日期
 *
 *  @param reg  格式化的格式由日期表达式reg指定
 *
 *  @return 返回的日期
 */
//- (NSDate *)formatterStringToDateWithReg:(NSString *)reg ;
- (NSDate *)convertStringToDateWithFormat:(NSString *)reg ;


/**
 *  ForExample:将字符串日期格式化为CFGregorianDate
 *
 *  @return 返回的CFGregorianDate格式日期
 */
- (CFGregorianDate)stringDateToCFGregorianDate ;

/**
 *  根据日期获得是星期几
 *
 *  @param dateStr 要确定的日期字符串
 *
 *  @return 返回的是星期几 注意：周日是1，周一是2
 */
//- (NSInteger)getWeekFromDate:(NSString *)dateStr {
- (NSInteger)getWeekFromDateStr;

#pragma mark - 比较两个字符串日期大小
/**
 *  比较两个字符串日期大小
 *
 *  @param secondDate 被比较的时间字符串
 *
 *  @return NSComparisonResult 升序 降序 相等
 */
//- (NSComparisonResult)compareOneDate:(NSString *)firstDate with:(NSString *)secondDate
- (NSComparisonResult)compareWith:(NSString *)secondDateStr ;


/**
 *  获取两个日期间的日期和星期列表
 *
 *  @param beginDate NSString
 *  @param endDate   NSString
 *
 *  @return NSArray
 */
//- (NSArray *)getWeekDateListBetween:(NSString *)beginDate and:(NSString *)endDate {
- (NSArray *)getWeekDateListBetweenSelfAndEnddatestr:(NSString *)enddatestr;

/**
 *  给字符串进行加密
 *
 *  @return kCCEncrypt加密后字符串
 */
//- (NSString *) stringkCCEncrypt:(NSString *)source {
- (NSString *) stringkCCEncrypt ;

/**
 *  字符串加密/解密
 *
 *  @param encryptOrDecrypt CCOperation 加密or解密
 *  @param key              NSString 关键字
 *
 *  @return NSString
 */
//- (NSString *) doCipher:(NSString*)plainText doType:(CCOperation)encryptOrDecrypt key:(NSString *)_key {
- (NSString *) doCipherWithType:(CCOperation)encryptOrDecrypt andKey:(NSString *)_key ;

/**
 *  返回日期字符串的文字描述，如当天是2013年５月14日，而参数是：20130514,则返回值为“今天”，支持的返回值有：
 *
 *  @param dateStr '20130514'
 *
 *  @return 前天，昨天，今天，明天，后天，其它返回空字符串
 */

//- (NSString *)formatDateComment:(NSString *)dateStr
- (NSString *)formatDateDescriptions ;


/**
 *  检查输入日期是否符合日期格式规范 合法返回YES
 *
 *  @param dateStr 传入的欲检测的字符串
 *
 *  @return dateStr符合日期格式返回YES,否则返回NO
 */
- (BOOL)verdictDateCriterion ;

@end




