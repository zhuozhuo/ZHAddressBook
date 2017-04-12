//
//  NSString+ZHCString.h
//  CAndEFirstShort
//
//  Created by aimoke on 16/10/17.
//  Copyright © 2016年 zhuo. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (ZHCString)

//获取中文拼音首字母
- (NSString *)chineseStringFirstCharactor;

//判断是否为中文开头
- (BOOL)isChineseCharacterBegin;

//判断是否为英文字母开头
- (BOOL)isLettersBegin;


@end
