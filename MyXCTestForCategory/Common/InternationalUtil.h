//
//  InternationalUtil.h
//  MyXCTestForCategory
//
//  Created by chang on 15/3/20.
//  Copyright (c) 2015年 chang. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kChangeLanguageNotification @"changeLanguage"

#define NSLocalizedStringWithInternational(key, comment) \
[[InternationalUtil bundle] localizedStringForKey:(key) value:(comment) table:@"International"]

#define NSLocalizedStringWithImage(comment) \
[UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@", ([InternationalUtil getFilePath]), (comment)]]

@interface InternationalUtil : NSObject

#pragma mark - 获取当前资源文件
+ (NSBundle *)bundle;

#pragma mark - 获取文件路径
+ (NSString *)getFilePath;

#pragma mark - 初始化语言文件
+ (void)initUserLanguage;

#pragma mark - 获取应用支持语言
+ (NSArray *)supportLanguages;

#pragma mark - 获取应用当前语言
+ (NSString *)userLanguage;

#pragma mark - 获取应用当前语言forHttp
+ (NSString *)userLanguageforHttp;

#pragma mark -  设置当前语言
+ (void)setUserlanguage:(NSString *)language;

+ (NSLocale *)getCurrLocale;
@end
