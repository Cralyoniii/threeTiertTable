//
//  ContactTVNameCell.m
//  threeTiertTable
//
//  Created by kim on 22/03/2018.
//  Copyright © 2018 kim. All rights reserved.
//

#import "ContactTVNameCell.h"

@interface ContactTVNameCell()

@property(nonatomic, weak)UILabel *nameLabel;

@end

@implementation ContactTVNameCell

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
    UILabel *label = [UILabel new];
    _nameLabel = label;
    label.textColor = [UIColor blackColor];
    label.font = [UIFont boldSystemFontOfSize:15];
    [self.contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).with.offset(13);
        make.centerY.equalTo(self.contentView);
    }];
}
- (void)setNameStr:(NSString *)nameStr{
    _nameStr = nameStr;
    _nameLabel.text = nameStr;
}

@end
