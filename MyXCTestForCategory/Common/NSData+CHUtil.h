//
//  NSData+CHUtil.h
//  MyXCTestForCategory
//
//  Created by chang on 15/3/20.
//  Copyright (c) 2015年 chang. All rights reserved.
//
//  类别：扩展NSData常用方法

#import <Foundation/Foundation.h>

@interface NSData (CHUtil)

/**
 *  将字符串转换为Base64Encoded处理后的NSData
 *
 *  @param string 输入的字符串
 *
 *  @return 经处理后返回结果
 */
- (NSData*)dataWithBase64EncodedString: (NSString*)string;

/**
 *  将字符串转换为Base64Encoded处理后的NSData的实现方法
 *
 *  @param string 输入的字符串
 *
 *  @return 经处理后返回结果
 */
- (id)initWithBase64EncodedString: (NSString*)string;

/**
 *  base64Encoding
 *
 *  @return NSString
 */
- (NSString*)base64Encoding;

/**
 *  base64EncodingWithLineLength
 *
 *  @param lineLength NSUInteger
 *
 *  @return NSString
 */
- (NSString*)base64EncodingWithLineLength: (NSUInteger)lineLength;


@end
