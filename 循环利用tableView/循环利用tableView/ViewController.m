//
//  ViewController.m
//  循环利用tableView
//
//  Created by xiaomage on 16/3/29.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "ViewController.h"
#import "XMGTopicListCell.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) NSArray *modules;
@end

@implementation ViewController

static NSString * const XMGTopicListCellId = @"XMGTopicListCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.modules = @[@"政治", @"社会", @"体育", @"娱乐",
                     @"政治2", @"社会2", @"体育2", @"娱乐2",
                     @"政治3", @"社会3", @"体育3", @"娱乐3"];

    // 布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = self.view.bounds.size;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 对于垂直滚动：每一行之间的间距，对于水平滚动：同一行每一个item之间的间距
    layout.minimumLineSpacing = 0;
    
    // collectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.pagingEnabled = YES;
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.backgroundColor = [UIColor redColor];
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([XMGTopicListCell class]) bundle:nil] forCellWithReuseIdentifier:XMGTopicListCellId];
    [self.view addSubview:collectionView];
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.modules.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    XMGTopicListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:XMGTopicListCellId forIndexPath:indexPath];
    
    cell.module = self.modules[indexPath.item];
    
    return cell;
}

#pragma mark - <UICollectionViewDelegate>
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"%zd", (int)(scrollView.contentOffset.x / scrollView.frame.size.width));
}
@end
