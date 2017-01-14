//
//  XMGTopicListCell.m
//  循环利用tableView
//
//  Created by xiaomage on 16/3/29.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "XMGTopicListCell.h"

@interface XMGTopicListCell() <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation XMGTopicListCell

- (void)awakeFromNib {
    
}

- (void)setModule:(NSString *)module
{
    _module = [module copy];
    
    [self.tableView reloadData];
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %zd", self.module, indexPath.row];
    
    return cell;
}

@end
