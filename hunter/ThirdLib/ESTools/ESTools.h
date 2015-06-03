//
//  ESTools.h
//  ESMicroPie
//
//  Created by 郑国里 on 14-3-13.
//  Copyright (c) 2014年 ES. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *工具类，提供：获取设备信息、常用加密解密、JSON处理、数据解析等公用方法
 */
@interface ESTools : NSObject

typedef void (^ESToolsBlock)(id data);
typedef void (^ESToolsResult)(BOOL result);

//获取设备信息

//Base64加密、解密
/**
 *Base64加密
 *@param argString 要进行base64加密（编码）的原始字符串
 *@return NSString* 返回进行base64加密（编码）后的字符串
 */
+ (NSString *)base64Encoded:(NSString *)argString;

/**
 *Base64加密解密
 *@param argString 要进行base64解密（译码）的原始字符串
 *@return NSString* 返回进行base64解密（译码）后的字符串
 */
+ (NSString *)base64Decoded:(NSString *)argString;

/**
 *NSData*类型的文本数据转换为base64格式字符串
 *@param (NSData *)argData 原始文本
 *@return NSString* 返回base64编码后的字符串
 */
+ (NSString *)base64EncodedDeal:(NSData *)argData;

/**
 *base64格式字符串转换为NSData*类型的文本数据
 *@param (NSString *)argString base64格式的字符串
 *@return (NSData *) 返回base64译码后的NSData*类型的的文本数据
 */
+ (NSData *)base64DecodedDeal:(NSString *)argString;

/*
 *GB编码的base64解码
 */
+ (NSString *)base64DecodedGB:(NSString *)argString;

/*
 *解码，根据不同的编码
 */
+ (NSData *)base64DecodedDeal:(NSString *)argString Encoding:(NSStringEncoding)encoding;

@end
