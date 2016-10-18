//
//  NSString+ZHCString.m
//  CAndEFirstShort
//
//  Created by aimoke on 16/10/17.
//  Copyright © 2016年 zhuo. All rights reserved.
//

#import "NSString+ZHCString.h"

@implementation NSString (ZHCString)

-(NSString *)chineseStringFirstCharactor
{
    NSAssert(self.length>0, @"chineseStringFirstCharactor String can not is nil");
    //转成可变字符串
    NSMutableString *str = [[NSMutableString alloc]initWithString:self];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformToLatin, NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformStripDiacritics, NO);
    //转化为大写拼音
    NSString *pinString = [str capitalizedString];
    //获取并返回首字母
    return [[pinString substringToIndex:1]uppercaseString];
    
}

-(BOOL)isChineseCharacterBegin
{
    NSAssert(self.length>0, @"isChineseCharacterBegin String can not is nil");
    int a = [self characterAtIndex:0];
    if( a > 0x4e00 && a < 0x9fff)
        return YES;
    else
        return NO;
}


-(BOOL)isLettersBegin
{
    NSAssert(self.length>0, @"isLettersBegin String can not is nil");
    NSString *regex = @"[A-Za-z]+";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    NSString *preString = [self substringToIndex:1];
    return [predicate evaluateWithObject:preString];
}


@end
