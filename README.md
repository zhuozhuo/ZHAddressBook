>前两天有个朋友问我微信中的通讯录界面怎么实现的,然后写了个Demo给他参考,主要难点在于:中文,英文,特殊符号,表情混合排序,其次就是搜索功能，这里索引里面还得有搜索符号。

### 动态效果


![](http://upload-images.jianshu.io/upload_images/2926059-d17bba81b2b0b66d.gif?imageMogr2/auto-orient/strip)

### 难点剖析

*  中文获取首字母

```objective-c
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

```
* 字符串中文开头判断

```objective-c
-(BOOL)isChineseCharacterBegin
{
    NSAssert(self.length>0, @"isChineseCharacterBegin String can not is nil");
    int a = [self characterAtIndex:0];
    if( a > 0x4e00 && a < 0x9fff)
        return YES;
    else
        return NO;
}
```

*  英文字母开头判断

```objective-c
-(BOOL)isLettersBegin
{
    NSAssert(self.length>0, @"isLettersBegin String can not is nil");
    NSString *regex = @"[A-Za-z]+";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    NSString *preString = [self substringToIndex:1];
    return [predicate evaluateWithObject:preString];
}

```
* 字母排序
```objective-c
[resultMuArray sortedArrayUsingSelector:@selector(compare:)];
```

* 添加带搜索符号的索引字符
```objective-c
[rightIndexArray insertObject:UITableViewIndexSearch atIndex:0];
```

* 添加searchBar

```objective-c
self.showTableView.tableHeaderView = self.searchController.searchBar;

#pragma mark - property
-(UISearchController *)searchController
{
    if (!_searchController) {
        _searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
        _searchController.searchResultsUpdater = self;
        _searchController.delegate = self;
        _searchController.dimsBackgroundDuringPresentation = YES;
        _searchController.hidesNavigationBarDuringPresentation = YES;
        _searchController.searchBar.placeholder = @"Search";
        [_searchController.searchBar sizeToFit];
        _searchController.searchBar.keyboardType = UIKeyboardTypeDefault;
    }
    return _searchController;
}
```

### 特别注意
1. 我们在字母排序时首先要对数组里面的字母大小写要统一,不然排序错乱。

2.我们在对字符串进行首字母判断时,如果字符串前面有空格或回车则需要去掉。例如
```objective-c
string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];//去除空格和回车
```

### 下载链接
[GitHub]()