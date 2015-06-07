//
//  DTCBroker.m
//  Wallet
//
//  Created by David de Tena on 07/06/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import "DTCBroker.h"
#import "DTCMoney.h"

@implementation DTCBroker

#pragma mark - Methods

// Implement this method the easiest way to pass the test
-(DTCMoney *) reduce:(DTCMoney *) money
          toCurrency:(NSString *) currency{

    return money;
}

@end
