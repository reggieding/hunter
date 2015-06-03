//
//  ESTools.m
//  ESMicroPie
//
//  Created by 郑国里 on 14-3-13.
//  Copyright (c) 2014年 ES. All rights reserved.
//

#import "ESTools.h"

@implementation ESTools

/**
 *base64加密、解密要用到的编码表
 */
static const char encodingTable[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

//Base64加密、解密
/**
 *Base64加密
 *@param argString 要进行base64加密（编码）的原始字符串
 *@return NSString* 返回进行base64加密（编码）后的字符串
 */
+ (NSString *)base64Encoded:(NSString *)argString
{
    NSData *data=[argString dataUsingEncoding:NSUTF8StringEncoding];
    return [self base64EncodedDeal:data];
}

/**
 *Base64加密解密
 *@param argString 要进行base64解密（译码）的原始字符串
 *@return NSString* 返回进行base64解密（译码）后的字符串
 */
+ (NSString *)base64Decoded:(NSString *)argString
{
    NSData *data=[self base64DecodedDeal:argString];
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];;
}


/**
 *NSData*类型的文本数据转换为base64格式字符串
 *@param (NSData *)argData 原始文本
 *@return NSString* 返回base64编码后的字符串
 */
+ (NSString *)base64EncodedDeal:(NSData *)argData
{
    NSData *data=argData;
    
    if ([data length] == 0){
        return @"";
    }
    
    char *characters = malloc((([data length] + 2) / 3) * 4);
    if (characters == NULL){
        return nil;
    }
    
    NSUInteger length = 0;
    NSUInteger i = 0;
    while (i < [data length]){
        char buffer[3] = {0,0,0};
        short bufferLength = 0;
        while (bufferLength < 3 && i < [data length]){
            buffer[bufferLength++] = ((char *)[data bytes])[i++];
        }
        
        //Encode the bytes in the buffer to four characters, including padding "=" characters if necessary.
        characters[length++] = encodingTable[(buffer[0] & 0xFC) >> 2];
        characters[length++] = encodingTable[((buffer[0] & 0x03) << 4) | ((buffer[1] & 0xF0) >> 4)];
        if (bufferLength > 1){
            characters[length++] = encodingTable[((buffer[1] & 0x0F) << 2) | ((buffer[2] & 0xC0) >> 6)];
        }else{
            characters[length++] = '=';
        }
        
        if (bufferLength > 2){
            characters[length++] = encodingTable[buffer[2] & 0x3F];
        }else{
            characters[length++] = '=';
        }
    }
    
    return [[NSString alloc] initWithBytesNoCopy:characters length:length encoding:NSASCIIStringEncoding freeWhenDone:YES];
}


/*
 *GB编码的base64解码
 */
+ (NSString *)base64DecodedGB:(NSString *)argString
{
    NSStringEncoding gbkEncoding =CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSData *data=[self base64DecodedDeal:argString Encoding:gbkEncoding];
    return [[NSString alloc]initWithData:data encoding:gbkEncoding];;
}


/*
 *解码，根据不同的编码
 */
+ (NSData *)base64DecodedDeal:(NSString *)argString Encoding:(NSStringEncoding)encoding
{
    NSString *string=argString;
    
    if (string == nil){
        [NSException raise:NSInvalidArgumentException format:nil];
    }
    
    if ([string length] == 0){
        return [NSData data];
    }
    
    static char *decodingTable = NULL;
    if (decodingTable == NULL){
        decodingTable = malloc(256);
        if (decodingTable == NULL){
            return nil;
        }
        memset(decodingTable, CHAR_MAX, 256);
        NSUInteger i;
        for (i = 0; i < 64; i++){
            decodingTable[(short)encodingTable[i]] = i;
        }
    }
    
    const char *characters = [string cStringUsingEncoding:encoding];
    if (characters == NULL){//  Not an ASCII string!
        return nil;
    }
    
    char *bytes = malloc((([string length] + 3) / 4) * 3);
    if (bytes == NULL){
        return nil;
    }
    
    NSUInteger length = 0;
    NSUInteger i = 0;
    while (YES){
        char buffer[4];
        short bufferLength;
        for (bufferLength = 0; bufferLength < 4; i++){
            if (characters[i] == '\0'){
                break;
            }
            if (isspace(characters[i]) || characters[i] == '='){
                continue;
            }
            buffer[bufferLength] = decodingTable[(short)characters[i]];
            if (buffer[bufferLength++] == CHAR_MAX){//  Illegal character!
                free(bytes);
                return nil;
            }
        }
        
        if (bufferLength == 0){
            break;
        }
        if (bufferLength == 1){//  At least two characters are needed to produce one byte!
            free(bytes);
            return nil;
        }
        
        //Decode the characters in the buffer to bytes.
        bytes[length++] = (buffer[0] << 2) | (buffer[1] >> 4);
        if (bufferLength > 2){
            bytes[length++] = (buffer[1] << 4) | (buffer[2] >> 2);
        }
        if (bufferLength > 3){
            bytes[length++] = (buffer[2] << 6) | buffer[3];
        }
    }
    
    bytes = realloc(bytes, length);
    
    return [NSData dataWithBytesNoCopy:bytes length:length];
}




/**
 *base64格式字符串转换为NSData*类型的文本数据
 *@param (NSString *)argString base64格式的字符串
 *@return (NSData *) 返回base64译码后的NSData*类型的的文本数据
 */
+ (NSData *)base64DecodedDeal:(NSString *)argString
{
    NSString *string=argString;
    
    if (string == nil){
        [NSException raise:NSInvalidArgumentException format:nil];
    }
    
    if ([string length] == 0){
        return [NSData data];
    }
    
    static char *decodingTable = NULL;
    if (decodingTable == NULL){
        decodingTable = malloc(256);
        if (decodingTable == NULL){
            return nil;
        }
        memset(decodingTable, CHAR_MAX, 256);
        NSUInteger i;
        for (i = 0; i < 64; i++){
            decodingTable[(short)encodingTable[i]] = i;
        }
    }
    
    const char *characters = [string cStringUsingEncoding:NSASCIIStringEncoding];
    if (characters == NULL){//  Not an ASCII string!
        return nil;
    }
    
    char *bytes = malloc((([string length] + 3) / 4) * 3);
    if (bytes == NULL){
        return nil;
    }
    
    NSUInteger length = 0;
    NSUInteger i = 0;
    while (YES){
        char buffer[4];
        short bufferLength;
        for (bufferLength = 0; bufferLength < 4; i++){
            if (characters[i] == '\0'){
                break;
            }
            if (isspace(characters[i]) || characters[i] == '='){
                continue;
            }
            buffer[bufferLength] = decodingTable[(short)characters[i]];
            if (buffer[bufferLength++] == CHAR_MAX){//  Illegal character!
                free(bytes);
                return nil;
            }
        }
        
        if (bufferLength == 0){
            break;
        }
        if (bufferLength == 1){//  At least two characters are needed to produce one byte!
            free(bytes);
            return nil;
        }
        
        //Decode the characters in the buffer to bytes.
        bytes[length++] = (buffer[0] << 2) | (buffer[1] >> 4);
        if (bufferLength > 2){
            bytes[length++] = (buffer[1] << 4) | (buffer[2] >> 2);
        }
        if (bufferLength > 3){
            bytes[length++] = (buffer[2] << 6) | buffer[3];
        }
    }
    
    bytes = realloc(bytes, length);
    
    return [NSData dataWithBytesNoCopy:bytes length:length];
}

@end
