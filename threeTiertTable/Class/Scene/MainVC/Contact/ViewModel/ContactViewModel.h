//
//  ContactViewModel.h
//  threeTiertTable
//
//  Created by kim on 22/03/2018.
//  Copyright © 2018 kim. All rights reserved.
//

#ifndef ContactViewModel_h
#define ContactViewModel_h


#endif /* ContactViewModel_h */

#import <UIKit/UIKit.h>
#import "MainViewModelClass.h"
#import "Contactmodel.h"
@interface ContactViewModel : MainViewModelClass

- (void)fetchContactDataWithSourceView:(UIViewController *)vc;

//- (void)pushToVCwithSourceVC:(UIViewController *)sourceVC
//                    withData:(id)data
//                  withPushVC:(UIViewController *)pushVC;

@end
