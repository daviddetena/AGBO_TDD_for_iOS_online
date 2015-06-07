//
//  DTCBroker.m
//  Wallet
//
//  Created by David de Tena on 07/06/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import "DTCBroker.h"
#import "DTCMoney.h"

@interface DTCBroker()

// We need a set of rates that we'll add to a dictionary
@property (nonatomic,strong) NSMutableDictionary *rates;

@end

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
-(DTCMoney *) reduce:(DTCMoney *) money
          toCurrency:(NSString *) currency{

    DTCMoney *result;
    double rate = [[self.rates
                       objectForKey:[self keyFromCurrency:money.currency
                                                          toCurrency:currency]] doubleValue];
    
    // Check that fromCurrency and toCurrency are the same
    if([money.currency isEqual:currency]){
        result = money;
    }
    else if(rate == 0){
        // NO rate found, exception raises
        [NSException raise:@"NoConversionRateException"
                    format:@"Must have a conversion from %@ to %@", money.currency, currency];
    }else{
        // We have rate
        NSInteger newAmount = [money.amount integerValue] * rate;
        result = [[DTCMoney alloc] initWithAmount:newAmount
                                         currency:currency];
    }

    return result;
}

-(void) addRate:(NSInteger) rate
   fromCurrency:(NSString *) fromCurrency
     toCurrency:(NSString *) toCurrency{
    
    // Add a rate to dictionary. Use a custom method to get the proper key
    [self.rates setObject:@(rate) forKey:[self keyFromCurrency:fromCurrency
                                                    toCurrency:toCurrency]];
    
    // Save the two rates
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
