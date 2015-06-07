//
//  DTCBroker.h
//  Wallet
//
//  Created by David de Tena on 07/06/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DTCMoney;

@interface DTCBroker : NSObject

#pragma mark - Methods

-(DTCMoney *) reduce:(DTCMoney *) money toCurrency:(NSString *) currency;

@end
