//
//  GitHub:https://github.com/zhuozhuo

//  博客：http://www.jianshu.com/users/39fb9b0b93d3/latest_articles

//  欢迎投稿分享：http://www.jianshu.com/collection/4cd59f940b02
//
//  Created by aimoke on 16/10/17.
//  Copyright © 2016年 zhuo. All rights reserved.
//

#import "ViewController.h"
#import "ZHCAdressListManager.h"
#import "ZHPushViewController.h"


@interface ViewController ()
{
    NSMutableArray *rightIndexArray;   //索引数组
    NSMutableArray *sectionTitleArray; //tableView section title 数组
    NSMutableArray *searchMuArray;     //搜索结果数组
    NSArray *sourceArray;              //需要排序的源数组
}

@end


@implementation ViewController

#pragma mark - view life

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"通讯录";
    searchMuArray = [NSMutableArray array];
    self.showTableView.tableHeaderView = self.searchController.searchBar;
    self.showTableView.tableFooterView = [UIView new];
    sourceArray = [NSArray arrayWithObjects:
                               @"Perry", @"GitHub", @"卓", @"kuke", @"习毛", @"gcd", @"毛线", @"NB", @"😄来来来", @" ￥Chin ese ", @"https://github.com ", @"ZHChat",
                               @"开源技术", @"社区", @"开发者", @"传播",
                               @"1024", @"aaa", @"100", @"中国", @"国庆",
                               @"键盘", @"鼠标", @"hello", @"world", @"sb",
                               nil];
    self.sortedArray = [ZHCAdressListManager getContactSortedArray:sourceArray];
    rightIndexArray = [ZHCAdressListManager getIndexArray:sourceArray];
    [rightIndexArray insertObject:UITableViewIndexSearch atIndex:0];
    sectionTitleArray = [ZHCAdressListManager getSectionTitleArray:sourceArray];

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - property
- (UISearchController *)searchController
{
    if (!_searchController) {
        _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
        _searchController.searchResultsUpdater = self;
        _searchController.delegate = self;
        _searchController.dimsBackgroundDuringPresentation = NO;
        _searchController.hidesNavigationBarDuringPresentation = YES;
        _searchController.searchBar.placeholder = @"Search";
        [_searchController.searchBar sizeToFit];
        _searchController.searchBar.keyboardType = UIKeyboardTypeDefault;
    }
    return _searchController;
}


#pragma mark - UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    [self searchResultsWithString:searchController.searchBar.text];
}


#pragma mark - private methods
- (void)searchResultsWithString:(NSString *)searchString
{
    if (searchString.length > 0) {
        searchMuArray = [ZHCAdressListManager getContainsObjectsWithSourceArray:sourceArray withSearchString:searchString];
    } else {
        searchMuArray = [NSMutableArray arrayWithArray:sourceArray];
    }
    [self.showTableView reloadData];
}


#pragma mark － TableView datasource
- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    if (self.searchController.isActive) {
        return nil;
    }
    return rightIndexArray;
}


- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    if (index == 0) {
        [tableView scrollRectToVisible:CGRectMake(0, 0, tableView.frame.size.width, tableView.tableHeaderView.frame.size.height) animated:NO];
        return -1;
    }
    return index - 1;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (self.searchController.isActive) {
        return nil;
    }
    return [sectionTitleArray objectAtIndex:section];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.searchController.isActive) {
        return 1;
    }
    return sectionTitleArray.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.searchController.isActive) {
        return searchMuArray.count;
    }
    NSArray *array = [self.sortedArray objectAtIndex:section];
    return array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    NSString *string = nil;
    if (self.searchController.isActive) {
        string = [searchMuArray objectAtIndex:indexPath.row];
    } else {
        NSArray *array = [self.sortedArray objectAtIndex:indexPath.section];
        string = [array objectAtIndex:indexPath.row];
    }
    cell.textLabel.text = string;
    return cell;
}


#pragma mark - TableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZHPushViewController *pushVC = [[ZHPushViewController alloc] initWithNibName:@"ZHPushViewController" bundle:[NSBundle mainBundle]];
    [self.searchController.searchBar resignFirstResponder];
    [self.searchController dismissViewControllerAnimated:YES completion:^(void) {
        [self.navigationController pushViewController:pushVC animated:YES];
    }];
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Remove seperator inset
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }

    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }

    // Explictly set your cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}


@end
