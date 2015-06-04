//
//  DTCMoney.m
//  Wallet
//
//  Created by David de Tena on 04/06/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//
//  Import @property amount from private

#import "DTCMoney.h"
#import "DTCEuro.h"
#import "DTCDollar.h"
#import "NSObject+GNUStepAddons.h"
#import "DTCMoney-private.h"


@implementation DTCMoney

#pragma mark - Factory methods
+(id) euroWithAmount:(NSInteger) amount{
    return [[DTCEuro alloc] initWithAmount:amount];
}

+(id) dollarWithAmount:(NSInteger) amount{
    return [[DTCDollar alloc] initWithAmount:amount];
}


#pragma mark - Init
-(id) initWithAmount:(NSInteger) amount{
    if(self = [super init]){
        _amount = @(amount);
    }
    return self;
}

-(id) times:(NSInteger) multiplier{
    DTCMoney *newMoney = [[DTCMoney alloc]
                          initWithAmount:[self.amount integerValue] * multiplier];
    return newMoney;
}

#pragma mark - Overwritten
/*
    Incluimos el nombre de la clase y el valor de account en el description
 */
-(NSString *) description{
    return [NSString stringWithFormat:@"<%@ %ld>",[self class], (long)[self amount]];
}


// Implement the simplest way: compare the two amounts
-(BOOL) isEqual:(id)object{
    return [self amount]==[object amount];
}

// Hash: inherited from NSObject simply returns the object's memory address
// as a number
-(NSUInteger) hash{
    return (NSUInteger)self.amount;
}

@end
