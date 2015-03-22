//
//  Language.h
//  MyXCTestForCategory
//
//  Created by chang on 15/3/20.
//  Copyright (c) 2015年 chang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Language : NSObject{
}
@property (nonatomic,strong)NSString *LanguageName;//语言名
@property (nonatomic,strong)NSString *forSISName;//系统识别码
@property (nonatomic,strong)NSString *forURLName;//url传输码

#pragma mark -  初始化
- (id)initWithLanguageName:(NSString *)name forSISName:(NSString *)sis forURLName:(NSString *)url;

@end
