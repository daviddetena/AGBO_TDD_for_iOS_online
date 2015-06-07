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


#pragma mark - Init

// Overwrite init to initialize our dictionary as empty
-(id) init{
    if(self = [super init]){
        _rates = [@{}mutableCopy];
    }
    return self;
}


#pragma mark - Methods

// Implement this method the easiest way to pass the test
-(DTCMoney *) reduce:(id<DTCMoney>) money
          toCurrency:(NSString *) currency{

    // Double dispatch, le devolvemos la pregunta
    return [money reduceToCurrency:currency
                        withBroker:self];
}

-(void) addRate:(NSInteger) rate
   fromCurrency:(NSString *) fromCurrency
     toCurrency:(NSString *) toCurrency{
    
    // Add a rate to dictionary. Use a custom method to get the proper key
    [self.rates setObject:@(rate) forKey:[self keyFromCurrency:fromCurrency
                                                    toCurrency:toCurrency]];
    
    // Save the rate and its inverse
    [self.rates setObject:@(1.0/rate) forKey:[self keyFromCurrency:toCurrency
                                                    toCurrency:fromCurrency]];
    
}

#pragma mark - Utils
// Method that returns a key used in our rate dictionary
// fromCurrency - toCurrency
- (NSString *) keyFromCurrency:(NSString *) fromCurrency
                    toCurrency:(NSString *) toCurrency{
    
    return [NSString stringWithFormat:@"%@-%@",fromCurrency,toCurrency];
}

@end
