//
//  ContactTVCell.h
//  threeTiertTable
//
//  Created by kim on 14/03/2018.
//  Copyright © 2018 kim. All rights reserved.
//

#ifndef ContactTVCell_h
#define ContactTVCell_h


#endif /* ContactTVCell_h */
typedef void (^btnClickedBlock)(void);
@interface ContactTVCell : UITableViewCell

@property (nonatomic, weak)UILabel *nameLabel;
@property (nonatomic, copy)btnClickedBlock btnClickedBlock;

@end
