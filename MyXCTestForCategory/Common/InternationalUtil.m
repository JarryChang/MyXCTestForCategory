//
//  InternationalUtil.h
//  MyXCTestForCategory
//
//  Created by chang on 15/3/20.
//  Copyright (c) 2015年 chang. All rights reserved.
//

#import "InternationalUtil.h"
#import "Language.h"


@implementation InternationalUtil

static NSBundle *bundle = nil;
#pragma mark - 获取当前资源文件
+ (NSBundle *)bundle {
    return bundle;
}

#pragma mark - 初始化语言文件
+ (void)initUserLanguage {
    NSString *path = [InternationalUtil getFilePath];
    bundle = [NSBundle bundleWithPath:path];// 生成bundle
}

#pragma mark - 获取文件路径
+ (NSString *)getFilePath {
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *string = [def valueForKey:@"userLanguage"];
    if (string.length == 0) {
        NSArray *languages = [def objectForKey:@"AppleLanguages"];
        NSString *current = [languages objectAtIndex:0];
        
        if([current isEqualToString:@"zh-Hant"]||[current isEqualToString:@"en"]||[current isEqualToString:@"ja"]){
            string = current;
        }
        else{
            string = @"zh-Hans";
        }
        [def setValue:string forKey:@"userLanguage"];
        [def synchronize];// 持久化，不加的话不会保存
    }
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:string ofType:@"lproj"];
    return path;
}

#pragma mark - 获取应用支持语言
+ (NSArray *)supportLanguages{
    Language *lan1=[[Language alloc]initWithLanguageName:@"简体中文" forSISName:@"zh-Hans" forURLName:@"zh_CN"];
    Language *lan2=[[Language alloc]initWithLanguageName:@"繁體中文" forSISName:@"zh-Hant" forURLName:@"zh_HK"];
    Language *lan3=[[Language alloc]initWithLanguageName:@"English" forSISName:@"en" forURLName:@"en_US"];
    Language *lan4=[[Language alloc]initWithLanguageName:@"日本語" forSISName:@"ja" forURLName:@"ja_JP"];
    NSArray *languageArr=[[NSArray alloc]initWithObjects:lan1,lan2,lan3,lan4, nil];
    return languageArr;
}

#pragma mark - 获取应用当前语言
+ (NSString *)userLanguage {
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *language = [def valueForKey:@"userLanguage"];
    return language;
}

#pragma mark - 获取应用当前语言forHttp
+ (NSString *)userLanguageforHttp {
    NSString *language = [InternationalUtil userLanguage];
    NSArray *supportLanguages = [InternationalUtil supportLanguages];
    for (int i=0;i<supportLanguages.count;i++) {
        Language *lan=[supportLanguages objectAtIndex:i];
        if([lan.forSISName isEqualToString:language]){
            return lan.forURLName;
        }
    }
    return @"zh_CN";
}

#pragma mark -  设置当前语言
+ (void)setUserlanguage:(NSString *)language {
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    // 1.第一步改变bundle的值
    NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:@"lproj"];
    bundle = [NSBundle bundleWithPath:path];
    // 2.持久化
    [def setValue:language forKey:@"userLanguage"];
    [def synchronize];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeLanguage" object:nil];
}

+ (NSLocale *)getCurrLocale{
    
    NSLocale *currLocal=[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    if([@"zh-Hans" isEqual:self.userLanguage]) {
        currLocal=[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    }else if([@"zh-Hant" isEqual:self.userLanguage]){
        currLocal=[[NSLocale alloc] initWithLocaleIdentifier:@"zh_Hant_TW"];
    }
    else if([@"en" isEqual:self.userLanguage]){
        currLocal=[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    }
    else if([@"ja" isEqual:self.userLanguage]){
        currLocal=[[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"];
    }
    return currLocal;
}
@end
