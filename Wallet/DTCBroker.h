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

#pragma mark - Properties

// We need a set of rates that we'll add to a dictionary
@property (nonatomic,strong) NSMutableDictionary *rates;


#pragma mark - Methods

-(DTCMoney *) reduce:(id<DTCMoney>) money toCurrency:(NSString *) currency;
-(void) addRate:(NSInteger) rate
   fromCurrency:(NSString *) fromCurrency
     toCurrency:(NSString *) toCurrency;
- (NSString *) keyFromCurrency:(NSString *) fromCurrency
                    toCurrency:(NSString *) toCurrency;

@end
