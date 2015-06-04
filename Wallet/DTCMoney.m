//
//  DTCMoney.m
//  Wallet
//
//  Created by David de Tena on 04/06/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//
//  Import @property amount from private

#import "DTCMoney.h"
#import "NSObject+GNUStepAddons.h"

@interface DTCMoney()
@property (nonatomic,strong) NSNumber *amount;
@end

@implementation DTCMoney

#pragma mark - Factory methods
+(id) euroWithAmount:(NSInteger) amount{
    return [[DTCMoney alloc] initWithAmount:amount currency:@"EUR"];
}

+(id) dollarWithAmount:(NSInteger) amount{
    return [[DTCMoney alloc] initWithAmount:amount currency:@"USD"];
}


#pragma mark - Init
-(id) initWithAmount:(NSInteger) amount
            currency:(NSString *) currency{
    if(self = [super init]){
        _amount = @(amount);
        _currency = currency;
    }
    return self;
}

-(id) times:(NSInteger) multiplier{
    DTCMoney *newMoney = [[DTCMoney alloc]
                          initWithAmount:[self.amount integerValue] * multiplier currency:self.currency];
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
