//
//  NSString+CHUtil.m
//  MyXCTestForCategory
//
//  Created by chang on 15/3/20.
//  Copyright (c) 2015年 chang. All rights reserved.
//

#import "NSString+CHUtil.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
#import <CoreFoundation/CoreFoundation.h>
#import "NSDate+CHUtil.h"
#import "NSData+CHUtil.h"
#import "InternationalUtil.h"

@implementation NSString (CHUtil)

#define root_eBusiness3g @"http://m.china-sss.com:9191/"
#define root_spring3g @"http://m.china-sss.com:8081/"
#define root_mweb @"http://m.china-sss.com/"
#define root_tour3g @"http://h.china-sss.com:9001/"
#define root_mwebNew @"http://m.ch.com/"

#define kURLStatusKey                          @"URLStatus"
#define kURLTypeKey                            @"URLType"
#define kURLResultKey                          @"URLResult"
#define kURLAppActionKey                       @"URLAppAction"

#define kFlightDateKey                        @"Date"
#define kFlightWeekKey                        @"Week"

#define IS_IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)


// TODO: 工程中方法替换完之后删除无用注释

/**
 *  Encode字符串
 *
 *  @return 经Encode操作后的字符串
 */
- (NSString *)urlEncodeValue {
    CFStringRef cfStr = CFBridgingRetain(self);
    NSString *result = (NSString *) CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, cfStr, NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8));
    CFRelease(cfStr);
    return result;
}

/**
 *  Decode字符串
 *
 *  @return 经Decode操作后的字符串
 */
- (NSString *)urlDecodeString {
    CFStringRef cfStr = CFBridgingRetain(self);
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault, cfStr, CFSTR(""), kCFStringEncodingUTF8));
    CFRelease(cfStr);
    return result;
}


/**
 *  拼接spring3gRoot到url字符串中
 *
 *  @return 字符串拼接spring3gRoot后的字符串
 */
- (NSString *)appendToSpring3GRootUrl {
    
   return [NSString stringWithFormat:@"%@%@", root_spring3g, self];
}


/**
 *  拼接mwebRoot到url字符串中
 *
 *  @return 字符串拼接mwebRoot后的字符串
 */
- (NSString *)appendToMWebRootUrl {
    
   return [NSString stringWithFormat:@"%@%@", root_mweb, self];
}

/**
 *  拼接新mwebRoot到url字符串中
 *
 *  @return 字符串拼接新mwebRoot后的字符串
 */
- (NSString *)appendToNewMWebRootUrl {
    
   return [NSString stringWithFormat:@"%@%@", root_mwebNew, self];
}


/**
 *  拼接tour3gRoot到url字符串中
 *
 *  @return 字符串拼接tour3gRoot后的字符串
 */
- (NSString *)appendToTour3gRootUrl {
    
    return [NSString stringWithFormat:@"%@%@", root_tour3g, self];
}

/**
 *  拼接eBusiness3gRoot到url字符串中
 *
 *  @return 字符串拼接eBusiness3gRoot后的字符串
 */
- (NSString *)appendToEBusiness3gRootUrl {
    
   return [NSString stringWithFormat:@"%@%@", root_eBusiness3g, self];
}


/**
 *  拼接root_provision到url中
 *
 *  @return 字符串拼接root_provision后的字符串
 */
// TODO:去除InternationalUtil类引用
- (NSString *)appendToProvisonRootUrl {

    return [NSString stringWithFormat:@"%@%@?lang=%@", root_eBusiness3g, self, [InternationalUtil userLanguageforHttp]];
}


/**
 *  字符串md5加密
 *
 *  @return 字符串md5加密后的字符串
 */
- (NSString *) md5Encrypt {

    const char *cStrValue = [self UTF8String];
    unsigned char theResult[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStrValue, (CC_LONG)strlen(cStrValue),theResult);
    return [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            theResult[0],theResult[1],theResult[2],theResult[3],theResult[4],theResult[5],theResult[6],theResult[7],
            theResult[8],theResult[9],theResult[10],theResult[11],theResult[12],theResult[13],theResult[14],theResult[15]];
}


// TODO: 以下需要自动再自动生成注释


/**
 *  判断字符串是否为空
 *
 *  @return 如果字符串为nil、null、字符串长度为0，返回YES；否则返回NO
 */
- (BOOL)isEmpty {
    
    if (self==nil || [[self trim] length] == 0 || [[self lowercaseString] isEqualToString:@"null"]) {
        return YES;
    }else{
    
        return NO;
    }
}


/**
 *  判断字符串是否为邮箱内容
 *
 *  @return 字符串为空或者字符串不含有@符号，返回NO，否则返回YES
 */
- (BOOL)validateEmail {

    if([self isEmpty]||[self rangeOfString:@"@"].location==NSNotFound){
        return NO;
    }else{
        return YES;
    }
}



/**
 *  number转换成字符串numStr,根据传入参数长度，判断numStr字符串前面是否补0
 *
 *  @param number 前面要补零处理的参数
 *  @param len    长度参数，根据此长度判断怎样补零
 *
 *  @return 如果number转换后的字符串numStr长度小于len,numStr前补零，否则numStr前不补零，最后返回numStr
 */
- (NSString *)patchZero:(NSInteger)number length:(NSInteger)len {

    NSString *numStr = [[NSString alloc] initWithFormat:@"%li", (long)number];
    while ([numStr length] < len) {
        numStr = [[NSString alloc] initWithFormat:@"0%@", numStr];
    }
    
    return numStr;
}

/**
 *  字符串后加 *(len)
 *
 *  @param len *(len)括号内要显示的内容
 *
 *  @return 经处理过的字符串
 */
- (NSString *)tailStarWithLength:(NSInteger)len {

    NSString *result = [[NSString alloc] initWithFormat:@"%@*(%li)", self, (long)len];
    
    return result;
}



/**
 *  转换空字符为 @""
 *
 *  @return 经处理后的字符串
 */
- (NSString *)convertEmpty {
    
    if (self == nil || [[self trim ] length] == 0 || [[self lowercaseString] isEqualToString:@"null"]) {
        return @"";
    }else{
        return self;
    }
}

/**
 *  判断字符串是否全为英文字母
 *
 *  @return 字符串含有英文字母，返回YES,否则返回NO
 */
- (BOOL)charIsLetter {
    
    for (int i = 0; i < [self length]; i++) {
        if (!isalpha([self characterAtIndex:i])) {
            return NO;
        }
    }
    return YES;
}

/**
 *  判断字符串是否包含数字
 *
 *  @return 字符串含有数字，返回YES,否则返回NO
 */
- (BOOL)charIsNum {

    for (int i = 0; i < [self length]; i++) {
        if ([self characterAtIndex:i] >= '0' && [self characterAtIndex:i] <= '9') {
            return NO;
        }
    }
    
    return YES;
}

/**
 *  判断字符串是否全为数字
 *
 *  @return 字符串全为数字返回YES，否则返回NO
 */
- (BOOL)charIsAllNum {

    if([[self convertEmpty] length]==0){
        return NO;
    }
    for (int i = 0; i < [self length]; i++) {
        if ([self characterAtIndex:i] < '0' || [self characterAtIndex:i] > '9') {
            return NO;
        }
    }
    return YES;
}

/**
 *  判断字符串是否包含特殊符号
 *
 *  @return 字符串包含特殊符号，返回NO,否则返回YES
 */
- (BOOL)isSecureString {

    NSString *notSecureStr = @"~!@#$%^&*()_+[{]}\\|;:'\",<.>/?";
    
    for (int i = 0; i < [notSecureStr length]; i++) {
        for (int j = 0; j < [self length]; j++) {
            if ([self characterAtIndex:j] == [notSecureStr characterAtIndex:i]) {
                return NO;
            }
        }
    }
    
    return YES;
}

/**
 *  判断字符串是否含有数字或者特殊字符
 *
 *  @return 字符串不含数字或者不含特殊字符，返回NO,否则返回YES
 *         (即，字符串既含有数字又含有特殊字符返回YES，否则返回NO)
 */
- (BOOL)checkIllegalStr {

    if (![self charIsNum] || ![self isSecureString]) {
        return NO;
    }else{
        return YES;
    }

}



/**
 *  忽略大小写比较字符串是否相等
 *
 *  @param str 本字符串与之比较的字符串
 *
 *  @return 忽略大小写比较字符串，相等返回YES,否则返回NO
 */
- (BOOL)isIgnoreCaseEqualsToStr:(NSString *)str {

    return [self compare:str options:NSCaseInsensitiveSearch] == NSOrderedSame;
}



/**
 *  java Boolean类型转换为iOS Boolean值
 *
 *  @return 只有booleanStr值为true时,返回值才会是YES,否则都为NO;
 */
- (BOOL)javaBooleanToIOSBool {

    if([@"true" isEqual:self] ){
        return YES;
    }else {
        return NO ;
    }
}

/**
 *  将字符串转换成BOOL类型值，
 *
 *  @return 只有字符串为 @"YES" 或 @"Y" 时，返回值才为YES
 */
- (BOOL) stringToBool:(NSString *)boolStr {

    if([@"Y" isEqualToString:boolStr] || [@"YES" isEqualToString:boolStr]){
        return YES;
    }else{
        return NO;
    }
}

/**
 *  计算reg字符串在字符串中出现的个数
 *
 *  @param reg 被包含字符串
 *
 *  @return 返回字符串包含reg字符串的个数
 */
- (int)numberForString: (NSString *)reg {

    int t = 0;
    NSString * str = self;
    NSInteger index = [reg length];
    NSRange range =  [str rangeOfString:reg];
    while(range.length>0){
        NSLog(@"range.location=%ld,range.length=%ld",(long)range.location,(long)range.length);
        t++;
        str = [str substringFromIndex:range.location+index];
        range =  [str rangeOfString:reg];
    }
    return t;
}


/**
 *  返回reg字符串在被比较字符串中最后出现的位置
 *
 *  @param reg reg字符串
 *
 *  @return reg字符串在被比较字符串位置
 */
- (int) lastIndexForString: (NSString *)reg {
    
    NSString * str = self;
    NSInteger index = [reg length];
    NSRange range =  [self rangeOfString:reg];
    NSRange afterRange;
    int lastIndex = -1;
    while(range.length>0){
        NSLog(@"range.location=%ld,range.length=%ld",(long)range.location,(long)range.length);
        str = [str substringFromIndex:range.location+index];
        afterRange = NSMakeRange(range.location, range.length);
        lastIndex += afterRange.location+afterRange.length;
        range =  [self rangeOfString:reg];
    }
    if(lastIndex>0){
        return lastIndex;
    }else{
        return -1;
    }
}

/**
 *  判断字符串是否以arg结尾
 *
 *  @param arg   是否以arg结尾
 *
 *  @return 字符串是以arg结尾返回YES 否则返回NO
 */
- (BOOL)endsWith:(NSString *)arg {

    if(self==nil || arg==nil){
        return NO;
    }
    if([arg length]>[self length]){
        return NO;
    }
    NSInteger index = [self length]-[arg length];
    NSString *substr = [self substringFromIndex:index];
    if([arg isEqual:substr]){
        return YES;
    }else{
        return NO;
    }
}

/**
 *  判断字符串resource是否以arg开头
 *
 *  @param arg    是否以arg开头
 *
 *  @return 字符串是以arg开头返回YES 否则返回NO
 */
- (BOOL)startsWith:(NSString *)arg {

    if(self==nil || arg==nil){
        return NO;
    }
    if([arg length]>[self length]){
        return NO;
    }
    NSString *substr = [self substringToIndex:[arg length]];
    if([arg isEqual:substr]){
        return YES;
    }else{
        return NO;
    }
}

/**
 *  删除指定字符串的结尾字符串
 *
 *  @param arg  arg结尾字符串
 *
 *  @return 字符串以arg结尾，删除arg并返回，否则直接返回字符串
 */
- (NSString *)removeEndsWith: (NSString *)arg {

    BOOL isClearIn = [self endsWith: arg];
    if(isClearIn){
        NSMutableString *sb = [[NSMutableString alloc] initWithString:self];
        NSRange range  = NSMakeRange([sb length]-[arg length], [arg length]);
        [sb replaceCharactersInRange:range withString:@""];
        return sb;
    }else{
        return self;
    }
}


/**
 *  去掉字符串空格,包括字符串内部空格
 *
 *  @return 去掉字符串空格后的字符串
 */
- (NSString *)trim {
    
    NSString * str ;
    if(self == nil){
        str = @"";
    }else{
        
        NSCharacterSet *whitespaces = [NSCharacterSet whitespaceCharacterSet];
        
        NSPredicate *noEmptyStrings = [NSPredicate predicateWithFormat:@"SELF != ''"];
        
        NSArray *parts = [self componentsSeparatedByCharactersInSet:whitespaces];
        
        NSArray *filteredArray = [parts filteredArrayUsingPredicate:noEmptyStrings];
        
        str = [filteredArray componentsJoinedByString:@""];
    }
    
    return str;
}

/**
 *  去除字符串两边空格
 *
 *  @return NSString
 */
- (NSString *)trimForSide {

    NSString * str;
    if ([NSNull null] == (NSNull *)self || self.length == 0) {
        str = @"";
    }else{
        str = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];

    }
    return str;
}


/**
 *  对URL进行解析
 *
 *  @param isEncode 字符串是否Encode
 *
 *  @return URL进行解析后的字典
 */
- (NSDictionary *)parseURL :(BOOL)isEncode {

    NSMutableDictionary *parseDict = [NSMutableDictionary dictionary];
    //默认为解析失败，设置Result为0
    [parseDict setObject:@"0" forKey:kURLStatusKey];

    //判断是否需要对url进行中文解码 这里默认编码方式为utf8
    NSString *urlStr = self;
    if (isEncode) {
        urlStr = [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    if (urlStr.length == 0) {
        return parseDict;
    }
    NSURL *tempUrl = [NSURL URLWithString:urlStr];
    NSString *urlStrold = [tempUrl absoluteString];
    if (!tempUrl || !urlStrold) {
        return parseDict;
    }
    //判断是否时跳转到app
    if ([urlStrold rangeOfString:@"gotoAppFlightRes=true"].location != NSNotFound || [urlStrold rangeOfString:@"gotoApp=true"].location != NSNotFound || [urlStrold rangeOfString:@"gotoActivityFlights=0"].location != NSNotFound) {
        //1:表示跳转app
        [parseDict setObject:@"1" forKey:kURLTypeKey];
        NSString *urlQuery = [tempUrl query];
        if (urlQuery.length == 0) {
            return parseDict;
        }
        //设置跳转app的部分
        if ([urlStrold rangeOfString:@"gotoActivityFlights=0"].location != NSNotFound) {
            [parseDict setObject:@"gotoActivityFlights" forKey:kURLAppActionKey];
        }
        else if ([urlStrold rangeOfString:@"gotoAppFlightRes=true"].location != NSNotFound) {
            [parseDict setObject:@"gotoAppFlightRes" forKey:kURLAppActionKey];
        }
        else if ([urlStrold rangeOfString:@"gotoApp=true"].location != NSNotFound) {
            [parseDict setObject:@"gotoApp" forKey:kURLAppActionKey];
        }
        // 对字符串解码
        NSString *tempUrlStr = [urlQuery urlDecodeString];
        NSMutableDictionary *parm = [[NSMutableDictionary alloc]init];
        
        NSArray *urlArr = [tempUrlStr componentsSeparatedByString:@"&"];
        for (int i = 0 ; i < [urlArr count]; i++) {
            NSString *temp = (NSString *)[urlArr objectAtIndex:i];
            // NSArray *tempArr = [self parseMapValue:temp ByString:@"="];
            NSArray *tempArr = [temp parseMapValueByString:@"="];
            if (tempArr.count != 2) {
                break;
            }
            [parm setObject:[tempArr objectAtIndex:1] forKey:[tempArr objectAtIndex:0]];
        }
        //设置解析状态为成功
        [parseDict setObject:@"1" forKey:kURLStatusKey];
        [parseDict setObject:parm forKey:kURLResultKey];
    }
    else {
        //0:表示跳转web
        [parseDict setObject:@"1" forKey:kURLStatusKey];
        [parseDict setObject:@"0" forKey:kURLTypeKey];
        [parseDict setObject:urlStr forKey:kURLResultKey];
    }
    return parseDict;

}

/**
 *  根据指定的字符串解析字符串，指定字符串前面的作为key，后面的作为value
 *
 *  @param symbolValue 指定字符串
 *
 *  @return 含有字典的数组
 */
- (NSArray *)parseMapValueByString:(NSString *)symbolValue {
    if (symbolValue.length == 0 || self.length == 0) {
        return nil;
    }
    NSRange tempRange = [self rangeOfString:symbolValue];
    if (tempRange.location == NSNotFound || tempRange.location == 0) {
        return nil;
    }
    NSString *keyStr = [self substringToIndex:tempRange.location];
    NSString *valueStr = [self substringFromIndex:tempRange.location + tempRange.length];
    if (valueStr.length == 0) {
        valueStr = @"";
    }
    NSArray *parseArray = [NSArray arrayWithObjects:keyStr, valueStr, nil];
    return parseArray;
}


/**
 *  判断字符串是否为空，如果为空则返回替换字符串；如果非空，返回目标字符串
 *
 *  @param replaceStr 替换字符串
 *
 *  @return 字符串为空则返回替换字符串；否则，返回目标字符串
 */
- (NSString *)replaceIfEmptyWith:(NSString *)replaceStr {

    if ([NSNull null] == (NSNull *)self) {
        return replaceStr;
    }
    if (![self isKindOfClass:[NSString class]]) {
        return replaceStr;
    }
    if (self.length == 0) {
        return replaceStr;
    }
    return self;
}

/**
 *  计算字符串高度
 *
 *  @param tempFont  NSFontAttributeName字体属性
 *  @param tempWidth 字符串宽度
 *
 *  @return 字符串高度
 */
- (float)getHeightForValueWithFont:(UIFont *)tempFont width:(float)tempWidth {

    float finalHeight = 0.0;
    
    if (IS_IOS7) {
        NSDictionary *fontAttributeDict = [NSDictionary dictionaryWithObject:tempFont forKey:NSFontAttributeName];
        CGRect tempRect = [self boundingRectWithSize:CGSizeMake(tempWidth, 0) options: NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:fontAttributeDict context:nil];
        finalHeight = tempRect.size.height;
    }
    else {
        CGSize tempSize = [self sizeWithFont:tempFont constrainedToSize:CGSizeMake(tempWidth, 2000.0)];
        finalHeight = tempSize.height;
    }
    return finalHeight;

}

/**
 *  计算字符串宽度
 *
 *  @param tempFont   字体属性
 *  @param tempHeight 字符串宽度
 *
 *  @return 字符串宽度
 */
- (float)getWidthForValueWithFont:(UIFont *)tempFont height:(float)tempHeight {

    float finalWidth = 0.0;
    if (IS_IOS7) {
        NSDictionary *fontAttributeDict = [NSDictionary dictionaryWithObject:tempFont forKey:NSFontAttributeName];
        CGRect tempRect = [self boundingRectWithSize:CGSizeMake(0, tempHeight) options: NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:fontAttributeDict context:nil];
        finalWidth = tempRect.size.width;
    }
    else {
        CGSize tempSize = [self sizeWithFont:tempFont constrainedToSize:CGSizeMake(100000, tempHeight)];
        finalWidth = tempSize.width;
    }
    return finalWidth;

}

/**
 *  截取快递状态的日期字符串，月日
 *
 *  @return 返回截取的月日
 */
- (NSString *)convertStrForExpressStatusDate {

    if (self.length == 0) {
        return @"";
    }
    NSArray *tempArray = [self componentsSeparatedByString:@"-"];
    if (tempArray.count != 3) {
        return self;
    }
    NSString *finalStr = [NSString stringWithFormat:@"%@-%@", [tempArray objectAtIndex:1], [tempArray objectAtIndex:2]];
    return finalStr;
}

/**
 *  判断字符串是否仅包含中文、英文、数字
 *
 *  @param str NSString
 *
 *  @return 字符串仅包含中文、英文、数字返回YES,否则返回NO
 */
- (BOOL)isOnlyContainChinaEnglishNumber {

    NSString *regex = @"[\u4E00-\u9FA5A-Za-z0-9]+";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

/**
 *  判断字符串是否仅包含中文、英文
 *
 *  @return 仅包含中文、英文返回YES,否则返回NO
 */
- (BOOL)isOnlyContainChinaEnglish {

    NSString *regex = @"[\u4E00-\u9FA5A-Za-z]+";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

/**
 *  判断是否仅包含英文、数字
 *
 *  @return 字符串仅包含英文、数字返回YES，否则返回NO
 */
- (BOOL)isOnlyContainEnglishNumber {

    NSString *regex = @"[A-Za-z0-9]+";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

/**
 *  判断是否仅包含数字
 *
 *  @return 仅包含数字返回YES，否则返回NO
 */
- (BOOL)isOnlyContainNumber {

    NSString *regex = @"[0-9]+";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}


#pragma mark -
#pragma mark - 以下为和时间相关方法

/**
 *  转换'yyyy-mm-dd'格式字符串到'yyyymmdd'格式字符串
 *
 *  @return  返回的'yyyymmdd'格式字符串
 */
- (NSString *)getYYYYMMDDDateString {
    NSMutableString *result = [[NSMutableString alloc] init];
    // self 为传入的'yyyy-mm-dd'格式字符串
    if (self != nil && [self length] == 10 && [self indexOfAccessibilityElement:@"-"] > 3) {
        NSArray *arr = [self componentsSeparatedByString:@"-"];
        
        if ([arr count] == 3) {
            [result appendString:[arr objectAtIndex:0]];
            [result appendString:[arr objectAtIndex:1]];
            [result appendString:[arr objectAtIndex:2]];
        }
    }
    
    return result;
}

/**
 *  转换'yyyymmdd'格式字符串到'yyyy_mm_dd'格式
 *
 *  @return 返回的'yyyy_mm_dd'格式字符串
 */
- (NSString *)getYYYY_MM_DDDateString {
    NSMutableString *result = nil;
    // self 为传入的'yyyymmdd'格式字符串
    if (self != nil && [self length] == 8) {
        result = [[NSMutableString alloc]init];
        [result appendFormat:@"%@_", [self substringWithRange:NSMakeRange(0, 4)]];
        [result appendFormat:@"%@_", [self substringWithRange:NSMakeRange(4, 2)]];
        [result appendString: [self substringWithRange:NSMakeRange(6, 2)]];
    }else{
        result = [[NSMutableString alloc]initWithString:self];
    }
    return result;
}


/**
 *  转换'yyyymmdd'格式字符串到'yyyy-mm-dd'格式
 *
 *  @return 返回的'yyyy-mm-dd'格式字符串
 */
- (NSString *)getYYYYMMDDDateStringHengXian {
    NSMutableString *result = nil;
    // self 传入的'yyyymmdd'格式字符串
    if (self != nil && [self length] == 8) {
        result = [[NSMutableString alloc]init];
        [result appendFormat:@"%@-", [self substringWithRange:NSMakeRange(0, 4)]];
        [result appendFormat:@"%@-", [self substringWithRange:NSMakeRange(4, 2)]];
        [result appendFormat:@"%@", [self substringWithRange:NSMakeRange(6, 2)]];
    }else{
        result = [[NSMutableString alloc]initWithString:self];
    }
    return result;
}



/**
 *  比较两个日期字符串相差的年数
 *
 *  @param secondDateStr 被比较的日期字符串
 *
 *  @return 返回两个字符串相差的年数
 */
//(NSInteger)compareYearDiffer:(NSString *)firstDateStr secondDate:(NSString *)secondDateStr
- (NSInteger)compareYearDifferToSecondDate:(NSString *)secondDateStr {
    
    NSDate *_firstDate = [[self getYYYY_MM_DDDateString] convertStringToDate];
    NSDate *_secondDate = [[secondDateStr getYYYY_MM_DDDateString] convertStringToDate];
    
    NSUInteger unitFlags = NSYearCalendarUnit;
    NSCalendar *chineseClendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *differTime = [chineseClendar components:unitFlags fromDate:_firstDate toDate:_secondDate options:0];
    return [differTime year];
}


/**
 *  比较两个日期字符串相差的天数
 *
 *  @param secondDateStr  被比较的日期字符串
 *
 *  @return 返回两个字符串相差的天数
 */
//(NSUInteger)compareDayDiffer:(NSString *)firstDateStr secondDate:(NSString *)secondDateStr
- (NSUInteger)compareDayDifferToSecondDate:(NSString *)secondDateStr {
    
    NSDate *_firstDate = [[self getYYYY_MM_DDDateString] convertStringToDate];
    NSDate *_secondDate = [[secondDateStr getYYYY_MM_DDDateString] convertStringToDate];
    
    NSUInteger unitFlags = NSDayCalendarUnit;
    NSCalendar *chineseClendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *differTime = [chineseClendar components:unitFlags fromDate:_firstDate toDate:_secondDate options:0];
    
    return [differTime day];
}




#pragma mark- 1:星期一 2：星期二 以此类推
/**
 *  根据输入数字返回是星期几
 *
 *  @param weekday 输入的参数 如1、2、3、4、5、6、7
 *
 *  @return 返回的星期几
 */
- (NSString *)getWeekdayByInteger:(NSInteger)weekday
{
    NSString *weekStr = @"";
    NSString *keyStr= [NSString stringWithFormat:@"common_components_calendar_02000%li", (long)weekday];
    weekStr = NSLocalizedStringWithInternational(keyStr, @"星期");
    return weekStr;
}


/**
 *  将字符串转换为日期格式
 *
 *  @return 返回的日期
 */
- (NSDate *)convertStringToDate { //convertDateToString
    // self 要转换为Date格式的字符串
    NSString *_year = [self substringWithRange:NSMakeRange(0, 4)];
    NSString *_month = [self substringWithRange:NSMakeRange(5, 2)];
    NSString *_day = [self substringWithRange:NSMakeRange(8, 2)];
    
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setYear:[_year intValue]];
    [dateComponents setMonth:[_month intValue]];
    [dateComponents setDay:[_day intValue]];
    [dateComponents setHour:23];
    [dateComponents setMinute:59];
    [dateComponents setSecond:59];
    NSDate *returnDate = [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
    
    return returnDate;
}


/**
 *  将字符串按照指定格式转换为日期
 *
 *  @param reg  格式化的格式由日期表达式reg指定
 *
 *  @return 返回的日期
 */
//- (NSDate *)formatterStringToDateWithReg:(NSString *)reg {
- (NSDate *)convertStringToDateWithFormat:(NSString *)reg {
    if(self==nil || [self length]==0 || reg==nil || [reg length]==0){
        return nil;
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init] ;
    [formatter setDateFormat:reg];
    NSDate * date = [formatter dateFromString:self];
    return date;
}

#pragma mark- 将字符串日期格式化为CFGregorianDate
/**
 *  ForExample:将字符串日期格式化为CFGregorianDate
 *
 *  @return 返回的CFGregorianDate格式日期
 */
- (CFGregorianDate)stringDateToCFGregorianDate {
    
    NSDate *date =  [self convertStringToDateWithFormat:@"yyyy-MM-dd hh:mm:ss"];
    
    if(date==nil){
        date = [self convertStringToDateWithFormat:@"yyyy-MM-dd"];
    }
    CFGregorianDate cfdate ;
    NSInteger unitFlags = NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit;
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comp = [cal components:unitFlags fromDate:date];
    cfdate.year = (SInt32)[comp year];
    cfdate.month = [comp month];
    cfdate.day = [comp day];
    return cfdate;
}


#pragma mark- 根据日期获得是星期几
/**
 *  根据日期获得是星期几
 *
 *  @param dateStr 要确定的日期字符串
 *
 *  @return 返回的是星期几 注意：周日是1，周一是2
 */
//- (NSInteger)getWeekFromDate:(NSString *)dateStr {
- (NSInteger)getWeekFromDateStr {
    
    if ([self isEmpty]) {
        return -1;
    }
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateFormatter *forMat = [[NSDateFormatter alloc] init];
    [forMat setDateFormat:@"yyyy-MM-dd"];
    NSDate *dat = [forMat dateFromString:self];
    NSInteger unitFlagas = NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit|NSWeekdayOrdinalCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit;
    NSDateComponents *comps = [calendar components:unitFlagas fromDate:dat];
    NSInteger weekday = [comps weekday]; //注意：周日是1，周一是2
    return weekday;
}


#pragma mark - 比较两个字符串日期大小
/**
 *  比较两个字符串日期大小
 *
 *  @param secondDate 被比较的时间字符串
 *
 *  @return NSComparisonResult 升序 降序 相等
 */
//- (NSComparisonResult)compareOneDate:(NSString *)firstDate with:(NSString *)secondDate
- (NSComparisonResult)compareWith:(NSString *)secondDateStr
{
    if ([self isEmpty]) {
        return NSOrderedAscending;
    }
    if ([secondDateStr isEmpty]) {
        return NSOrderedDescending;
    }
    NSComparisonResult result;
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    @try {
        NSDate *first = [formatter dateFromString:self];
        if (!first) {
            result = NSOrderedAscending;
        }
        if (first) {
            NSDate *second = [formatter dateFromString:secondDateStr];
            if (!second) {
                result = NSOrderedDescending;
            }
            else
            {
                result = [first compare:second];
            }
        }
    }
    @catch (NSException *exception) {
        result = NSOrderedAscending;
    }
    @finally {
        formatter = nil;
        return result;
    }
}


#pragma mark - 获取两个日期间的日期和星期列表
/**
 *  获取两个日期间的日期和星期列表
 *
 *  @param beginDate NSString
 *  @param endDate   NSString
 *
 *  @return NSArray
 */
//- (NSArray *)getWeekDateListBetween:(NSString *)beginDate and:(NSString *)endDate {
- (NSArray *)getWeekDateListBetweenSelfAndEnddatestr:(NSString *)enddatestr {
    if (!self || !enddatestr) {
        return nil;
    }
    if (![self isKindOfClass:[NSString class]] || ![enddatestr isKindOfClass:[NSString class]]) {
        return nil;
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *begin = [formatter dateFromString:self];
    if (!begin) {
        return nil;
    }
    NSDate *end = [formatter dateFromString:enddatestr];
    if (!end) {
        return nil;
    }
    if ([begin compare:end] == NSOrderedDescending) {
        return nil;
    }
    NSMutableArray *resultList = [NSMutableArray array];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *datesComponents, *dateUnitComponets;
    NSString *weekStr, *dateStr;
    NSMutableDictionary *tempDict;
    NSDate *tempDate;
    
    dateUnitComponets = [[NSDateComponents alloc]init];
    [dateUnitComponets setDay:1];
    
    datesComponents = [calendar components:NSDayCalendarUnit fromDate:begin toDate:end options:0];
    NSInteger dayCount = [datesComponents day];
    for (int i = 0; i <= dayCount; i++) {
        [dateUnitComponets setDay:i];
        tempDate = [calendar dateByAddingComponents:dateUnitComponets toDate:begin options:0];
        dateStr = [formatter stringFromDate:tempDate];
        //weekStr = [self getWeekdayByDay:tempDate];
        weekStr = [tempDate getWeekdayByDay];
        
        tempDict = [NSMutableDictionary dictionary];
        [tempDict setObject:dateStr forKey:kFlightDateKey];
        [tempDict setObject:weekStr forKey:kFlightWeekKey];
        [resultList addObject:tempDict];
    }
    
    return resultList;
}



/**
 *  给字符串进行加密
 *
 *  @return kCCEncrypt加密后字符串
 */
//- (NSString *) stringkCCEncrypt:(NSString *)source {
- (NSString *) stringkCCEncrypt {

    return (NSString *)[self doCipherWithType:kCCEncrypt andKey:nil];
}


/**
 *  字符串加密/解密
 *
 *  @param encryptOrDecrypt CCOperation 加密or解密
 *  @param key              NSString 关键字
 *
 *  @return NSString
 */
//- (NSString *) doCipher:(NSString*)plainText doType:(CCOperation)encryptOrDecrypt key:(NSString *)_key {
- (NSString *) doCipherWithType:(CCOperation)encryptOrDecrypt andKey:(NSString *)_key {

    const void *vplainText;
    size_t plainTextBufferSize;

    if (encryptOrDecrypt == kCCDecrypt)
    {
        NSData *encryptData = [[NSData alloc] initWithBase64EncodedString:self];
        plainTextBufferSize = [encryptData length];
        vplainText = [encryptData bytes];
    }
    else
    {
        plainTextBufferSize = [self length];
        vplainText = (const void *) [self UTF8String];
    }

    CCCryptorStatus ccStatus;
    uint8_t *bufferPtr = NULL;
    size_t bufferPtrSize = 0;
    size_t movedBytes = 0;

    bufferPtrSize = (plainTextBufferSize + kCCBlockSize3DES) & ~(kCCBlockSize3DES - 1);
    bufferPtr = malloc( bufferPtrSize * sizeof(uint8_t));
    memset((void *)bufferPtr, 0x0, bufferPtrSize);

    NSString *key = nil;
    if (_key != nil) {
        key = [[NSString stringWithFormat:@"%@%@", _key, @"000000000000000000000000"] substringToIndex:24];
    } else {
        key = @"spring20130628airlines!)";
    }
    NSString *initVec = @"87654321";
    const void *vkey = (const void *) [key UTF8String];
    const void *vinitVec = (const void *) [initVec UTF8String];

    ccStatus = CCCrypt(encryptOrDecrypt,
                       kCCAlgorithm3DES,
                       kCCOptionPKCS7Padding,
                       vkey, //"123456789012345678901234", //key
                       kCCKeySize3DES,
                       vinitVec, //"init Vec", //iv,
                       vplainText, //"Your Name", //plainText,
                       plainTextBufferSize,
                       (void *)bufferPtr,
                       bufferPtrSize,
                       &movedBytes);
    if (ccStatus == kCCParamError) return @"PARAM ERROR";
    else if (ccStatus == kCCBufferTooSmall) return @"BUFFER TOO SMALL";
    else if (ccStatus == kCCMemoryFailure) return @"MEMORY FAILURE";
    else if (ccStatus == kCCAlignmentError) return @"ALIGNMENT";
    else if (ccStatus == kCCDecodeError) return @"DECODE ERROR";
    else if (ccStatus == kCCUnimplemented) return @"UNIMPLEMENTED";

    NSString *result;

    if (encryptOrDecrypt == kCCDecrypt)
    {
        result =[[NSString alloc] initWithData: [NSData dataWithBytes:(const void *)bufferPtr length:(NSUInteger)movedBytes] encoding:NSASCIIStringEncoding];
    }
    else
    {
        NSData *myData = [NSData dataWithBytes:(const void *)bufferPtr length:(NSUInteger)movedBytes] ;
       	result = [NSString stringWithString: [myData base64Encoding]];
    }
    free(bufferPtr);
    
    return result;
}

#pragma mark - 对字符串的日期进行日期加减,日期格式为:yyyy-MM-dd
/**
 *  对字符串的日期进行日期加减,日期格式为:yyyy-MM-dd
 *
 *  @param dateStr NSString
 *  @param dayNum  int
 *
 *  @return NSString
 */

// - (NSString *)addDateByStr:(NSString *)dateStr addDay:(int)dayNum {
 - (NSString *)strDateAddDays:(int)dayNum {
     
    NSDate *date = [self convertStringToDateWithFormat:@"yyyy-MM-dd"];
    NSDate *d =  [date addDays:dayNum];
    NSString *newDateStr =  [d convertDateToStringWithFormat:@"yyyy-MM-dd"];
    return newDateStr;
 }


/**
 *  返回日期字符串的文字描述，如当天是2013年５月14日，而参数是：20130514,则返回值为“今天”，支持的返回值有：
 *
 *  @param dateStr '20130514'
 *
 *  @return 前天，昨天，今天，明天，后天，其它返回空字符串
 */

 //- (NSString *)formatDateComment:(NSString *)dateStr
 - (NSString *)formatDateDescriptions {
     
     NSString *str = nil;
     NSInteger i = [[[NSDate date] convertDateToStringWithFormat:@"YYYYMMdd"] compareDayDifferToSecondDate:self];
     switch (i) {
         case -2:{
             str = NSLocalizedStringWithInternational(@"common_util_stringutil_01001", @"前天") ;
             break;
         }case -1:{
             str = NSLocalizedStringWithInternational(@"common_util_stringutil_01002", @"昨天") ;
             break;
         }case 0:{
             str = NSLocalizedStringWithInternational(@"common_util_stringutil_01003", @"今天");
             break;
         }case 1: {
             str = NSLocalizedStringWithInternational(@"common_util_stringutil_01004", @"明天");
             break;
         }case 2: {
             str = NSLocalizedStringWithInternational(@"common_util_stringutil_01005", @"后天") ;
             break;
         } default:{
             str = @"" ;
            break;
         }
     }
     return str;
}


#pragma mark - 检查输入日期是否符合日期格式规范 合法返回YES
/**
 *  检查输入日期是否符合日期格式规范 合法返回YES
 *
 *  @param dateStr 传入的欲检测的字符串
 *
 *  @return dateStr符合日期格式返回YES,否则返回NO
 */
 - (BOOL)verdictDateCriterion {
     
     NSDate *newDate = [[self getYYYY_MM_DDDateString] convertStringToDate];
     NSString *newDateStr = [newDate convertDateToStringWithFormat:@"yyyyMMdd"];
     return [self isIgnoreCaseEqualsToStr:newDateStr];
 }


@end
















