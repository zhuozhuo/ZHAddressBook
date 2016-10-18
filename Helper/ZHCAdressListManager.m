//
//  ZHCAdressListManager.m
//  CAndEFirstShort
//
//  Created by aimoke on 16/10/17.
//  Copyright © 2016年 zhuo. All rights reserved.
//

#import "ZHCAdressListManager.h"
#import "NSString+ZHCString.h"

#define UnknownString @"#"

@implementation ZHCAdressListManager

+(NSMutableArray *)getIndexArray:(NSArray *)sourceArray
{
    NSAssert(sourceArray != nil, @"getIndexArray sourceArray can not is nil");
    NSMutableArray *resultMuArray = [NSMutableArray array];
    for (NSString * string in sourceArray) {
        NSString *preString = [self getFirstLetter:string];
        if (![resultMuArray containsObject:preString]) {
            [resultMuArray addObject:preString];
        }
    }
    NSLog(@"resultsArray:%@",resultMuArray);
    if ([resultMuArray containsObject:UnknownString]) {
        [resultMuArray removeObject:UnknownString];
        NSArray *sortedArray = [resultMuArray sortedArrayUsingSelector:@selector(compare:)];
        resultMuArray = [NSMutableArray arrayWithArray:sortedArray];
        [resultMuArray addObject:UnknownString];
    }else{
        NSArray *sortedArray = [resultMuArray sortedArrayUsingSelector:@selector(compare:)];
        resultMuArray = [NSMutableArray arrayWithArray:sortedArray];
    }
    NSLog(@"newResultsArray:%@",resultMuArray);
    return resultMuArray;
}


+(NSMutableArray *)getSectionTitleArray:(NSArray *)sourceArray
{
    NSAssert(sourceArray != nil, @"getSectionTitleArray sourceArray can not is nil");
    NSMutableArray *resultMuArray = [NSMutableArray array];
    for (NSString * string in sourceArray) {
        NSString *preString = [self getFirstLetter:string];
        if (![resultMuArray containsObject:preString]) {
            [resultMuArray addObject:preString];
        }
    }
    if ([resultMuArray containsObject:UnknownString]) {
        [resultMuArray removeObject:UnknownString];
        NSArray *sortedArray = [resultMuArray sortedArrayUsingSelector:@selector(compare:)];
        resultMuArray = [NSMutableArray arrayWithArray:sortedArray];
        [resultMuArray addObject:UnknownString];
    }else{
        NSArray *sortedArray = [resultMuArray sortedArrayUsingSelector:@selector(compare:)];
        resultMuArray = [NSMutableArray arrayWithArray:sortedArray];
    }
    return resultMuArray;
}

+(NSMutableArray *)getContactSortedArray:(NSArray *)sourceArray
{
    NSAssert(sourceArray != nil, @"getContactSortedArray sourceArray can not is nil");
    NSMutableArray *sortedArray = [NSMutableArray array];
    NSMutableArray *sectionsArray = [self getSectionTitleArray:sourceArray];
    for (NSString *titleString in sectionsArray) {
        NSMutableArray *sameArray = [NSMutableArray array];
        for (NSString *object in sourceArray) {
            NSString *letterString = [self getFirstLetter:object];
            if ([titleString isEqualToString:letterString]) {
                [sameArray addObject:object];
            }
        }
        [sortedArray addObject:sameArray];
    }
    return sortedArray;
    
}

+(NSMutableArray *)getContainsObjectsWithSourceArray:(NSArray *)sourceArray withSearchString:(NSString *)searchString
{
     NSAssert(sourceArray != nil, @"getContainsObjectsWithSourceArray sourceArray can not is nil");
    if (searchString.length>0) {
        NSMutableArray *sameArray = [NSMutableArray array];
        for (NSString *object in sourceArray) {
            if ([object containsString:searchString]) {//字符串包含
                [sameArray addObject:object];
            }else{//首字母包含
                NSString *letterString = [self getFirstLetter:object];
                if ([searchString isEqualToString:letterString]) {
                    [sameArray addObject:object];
                }
            }
            
        }
        return sameArray;

    }else{
        return [NSMutableArray arrayWithArray:sourceArray];
    }
    
}

+(NSString *)getFirstLetter:(NSString *)string
{
    NSString *preString = UnknownString;
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];//去除两端空格和回车
    if ([string isChineseCharacterBegin]) {//中文
        preString = [string chineseStringFirstCharactor];
    }else if ([string isLettersBegin]){//字母
        preString = [[string substringToIndex:1]uppercaseString];
    }
    return preString;

}



@end
