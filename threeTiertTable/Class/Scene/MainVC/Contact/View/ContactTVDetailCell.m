//
//  ContactTVDetailCell.m
//  threeTiertTable
//
//  Created by kim on 22/03/2018.
//  Copyright © 2018 kim. All rights reserved.
//

#import "ContactTVDetailCell.h"

@interface ContactTVDetailCell()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong)NSArray *dataArr;

@end

@implementation ContactTVDetailCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(!self){
        return nil;
    }
    [self configureCell];
    return self;
}
- (void)configureCell{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor whiteColor];
    view.layer.cornerRadius = 6;
    view.layer.masksToBounds = YES;
    [self.contentView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).with.offset(30);
        make.right.equalTo(self.contentView).with.offset(-30);
        make.top.equalTo(self.contentView).with.offset(13);
        make.bottom.equalTo(self.contentView).with.offset(-13);
    }];
    UITableView *table = [[UITableView alloc]init];
    table.scrollEnabled = NO;
    table.delegate = self;
    table.dataSource = self;
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [view addSubview:table];
    [table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(view);
    }];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 20;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    UILabel *label = [[UILabel alloc]init];
    label.text = self.dataArr[indexPath.row][0];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:14];
    [cell.contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(cell.contentView).with.offset(3);
        make.centerY.equalTo(cell.contentView);
    }];
    UILabel *detailLabel = [[UILabel alloc]init];
    detailLabel.text = self.dataArr[indexPath.row][1];
    detailLabel.textColor = [UIColor blueColor];
    detailLabel.textAlignment = NSTextAlignmentRight;
    detailLabel.font = [UIFont systemFontOfSize:14];
    [cell.contentView addSubview:detailLabel];
    [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(cell.contentView).with.offset(-3);
        make.centerY.equalTo(cell.contentView);
    }];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (void)setModel:(ContactModel *)model{
    _model = model;
    
    self.dataArr = @[
  @[@"门派:",model.academy],
  @[@"电话",model.phoneNumber],
  @[@"QQ",model.qq],
  @[@"邮箱",model.email]];
}
#pragma mark--lazy load
- (NSArray *)dataArr{
    if(!_dataArr){
        _dataArr = [NSArray array];
    }
    return _dataArr;
}
@end
