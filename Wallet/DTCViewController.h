//
//  DTCViewController.h
//  Wallet
//
//  Created by David de Tena on 07/06/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DTCViewController : UIViewController

#pragma mark - Outlet
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

#pragma mark - Action
- (IBAction)displayText:(id)sender;


@end
