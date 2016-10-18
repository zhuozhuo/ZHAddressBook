//
//  GitHub:https://github.com/zhuozhuo

//  博客：http://www.jianshu.com/users/39fb9b0b93d3/latest_articles

//  欢迎投稿分享：http://www.jianshu.com/collection/4cd59f940b02

//  Created by aimoke on 16/10/17.
//  Copyright © 2016年 zhuo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZHCString)

//获取中文拼音首字母
-(NSString *)chineseStringFirstCharactor;

//判断是否为中文开头
-(BOOL)isChineseCharacterBegin;

//判断是否为英文字母开头
-(BOOL)isLettersBegin;


@end
