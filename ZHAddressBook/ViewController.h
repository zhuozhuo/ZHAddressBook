//
//  GitHub:https://github.com/zhuozhuo

//  博客：http://www.jianshu.com/users/39fb9b0b93d3/latest_articles

//  欢迎投稿分享：http://www.jianshu.com/collection/4cd59f940b02
//
//  Created by aimoke on 16/10/17.
//  Copyright © 2016年 zhuo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating, UISearchControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *showTableView;
@property (strong, nonatomic) UISearchController *searchController;
@property (strong, nonatomic) NSArray *sortedArray; //已经排序的数组

@end
