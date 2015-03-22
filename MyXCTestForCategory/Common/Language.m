//
//  Language.m
//  MyXCTestForCategory
//
//  Created by chang on 15/3/20.
//  Copyright (c) 2015年 chang. All rights reserved.
//

#import "Language.h"

@implementation Language
@synthesize LanguageName;
@synthesize forSISName;
@synthesize forURLName;

#pragma mark -  初始化
- (id)initWithLanguageName:(NSString *)name forSISName:(NSString *)sis forURLName:(NSString *)url
{
    self = [super init];
    if (self) {
        LanguageName=name;
        forSISName=sis;
        forURLName=url;
    }
    return self;
}
@end
