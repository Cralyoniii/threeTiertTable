//
//  MainTVCell.h
//  threeTiertTable
//
//  Created by kim on 14/03/2018.
//  Copyright © 2018 kim. All rights reserved.
//

#ifndef MainTVCell_h
#define MainTVCell_h


#endif /* MainTVCell_h */
typedef void (^btnClickedBlock)(void);
@interface MainTVCell : UITableViewCell

@property (nonatomic, weak)UILabel *nameLabel;
@property (nonatomic, copy)btnClickedBlock btnClickedBlock;

@end
