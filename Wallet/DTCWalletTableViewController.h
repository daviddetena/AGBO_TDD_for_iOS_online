//
//  DTCWalletTableViewController.h
//  Wallet
//
//  Created by David de Tena on 07/06/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DTCWallet;

@interface DTCWalletTableViewController : UITableViewController


#pragma mark - Init
-(id) initWithModel:(DTCWallet *) wallet;

@end
