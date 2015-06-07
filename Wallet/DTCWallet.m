//
//  DTCWallet.m
//  Wallet
//
//  Created by David de Tena on 07/06/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import "DTCWallet.h"

@interface DTCWallet()
// Property to save all the moneys
@property (nonatomic,strong) NSMutableArray *moneys;
@end

@implementation DTCWallet


#pragma mark - DTCMoney protocol

-(id) initWithAmount:(NSInteger)amount
            currency:(NSString *)currency{

    if(self = [super init]){
        // Init the array and save the first money
        DTCMoney *money = [[DTCMoney alloc] initWithAmount:amount
                                                  currency:currency];
        _moneys = [NSMutableArray array];
        [_moneys addObject:money];
    }
    return self;
}

// Returns self with the addition
-(id<DTCMoney>) plus:(DTCMoney *)other{
    [_moneys addObject:other];
    
    return self;
}

// New array with each element is multiplied by the multiplier
- (id<DTCMoney>) times:(NSInteger)multiplier{
    NSMutableArray *newMoneys = [NSMutableArray arrayWithCapacity:self.moneys.count];
    
    for (DTCMoney *each in self.moneys) {
        DTCMoney *newMoney = [each times:multiplier];
        [newMoneys addObject:newMoney];
    }
    self.moneys = newMoneys;
    return self;
}

// Reduce each element in the array of moneys to the given currency
-(id<DTCMoney>) reduceToCurrency:(NSString *)currency
                      withBroker:(DTCBroker *)broker{

    // Init with 0 (default) in the given currency
    DTCMoney *result = [[DTCMoney alloc] initWithAmount:0 currency:currency];
    
    // Add to the result the amount of each money in the array reduced to the given currency
    for (DTCMoney *each in self.moneys) {
        result = [result plus:[each reduceToCurrency:currency withBroker:broker]];
    }
    
    return result;
}

@end
