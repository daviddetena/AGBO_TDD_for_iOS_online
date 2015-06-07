//
//  DTCBroker.h
//  Wallet
//
//  Created by David de Tena on 07/06/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTCMoney.h"

@interface DTCBroker : NSObject

#pragma mark - Methods

-(id<DTCMoney>) reduce:(DTCMoney *) money toCurrency:(NSString *) currency;
-(void) addRate:(NSInteger) rate
   fromCurrency:(NSString *) fromCurrency
     toCurrency:(NSString *) toCurrency;

@end
