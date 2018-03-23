//
//  ContactTVCell.m
//  threeTiertTable
//
//  Created by kim on 14/03/2018.
//  Copyright © 2018 kim. All rights reserved.
//

#import "MainTVCell.h"

@interface MainTVCell()

@end

@implementation MainTVCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self configureCell];
    }
    return self;
}

- (void)configureCell{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    UILabel *nameLabel = [UILabel new];
    _nameLabel = nameLabel;
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.font = [UIFont boldSystemFontOfSize:15];
    [self.contentView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.centerY.equalTo(self.contentView);
    }];
    UIButton *btn = [UIButton new];
    [btn setTitle:@"gogo" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(gotoClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).with.offset(-15);
        make.centerY.equalTo(self.contentView);
    }];
}
- (void)gotoClick:(UIButton *)sender{
    if(self.btnClickedBlock){
        self.btnClickedBlock();
    }
}
@end
