//
//  GitHub:https://github.com/zhuozhuo

//  博客：http://www.jianshu.com/users/39fb9b0b93d3/latest_articles

//  欢迎投稿分享：http://www.jianshu.com/collection/4cd59f940b02

//
//  Created by aimoke on 16/10/17.
//  Copyright © 2016年 zhuo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHCAdressListManager : NSObject


/**
 获取索引数组

 @param sourceArray 源数组

 @return 返回可变索引数组
 */
+(NSMutableArray *)getIndexArray:(NSArray *)sourceArray;


/**
 获取排序后的数组

 @param sourceArray 源数组

 @return 排序后的可变数组
 */
+(NSMutableArray *)getContactSortedArray:(NSArray *)sourceArray;


/**
 获取排序后标题数组

 @param sourceArray 源数组

 @return 可变的标题数组
 */
+(NSMutableArray *)getSectionTitleArray:(NSArray *)sourceArray;


/**
 获取源数组中相匹配的对象

 @param sourceArray 源数组
 @param searchString 搜索字符串

 @return 可变的数组
 */
+(NSMutableArray *)getContainsObjectsWithSourceArray:(NSArray *)sourceArray withSearchString:(NSString *)searchString;
@end
