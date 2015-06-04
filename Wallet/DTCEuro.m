//
//  DTCEuro.m
//  Wallet
//
//  Created by David de Tena on 03/06/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import "DTCEuro.h"

@interface DTCEuro()

@property (nonatomic) NSInteger amount;

@end

@implementation DTCEuro

#pragma mark - Init
-(id) initWithAmount:(NSInteger) amount{
    if(self = [super init]){
        _amount = amount;
    }
    return self;
}


-(DTCEuro *) times:(NSInteger) multiplier{
    DTCEuro *newEuro = [[DTCEuro alloc]
                        initWithAmount:self.amount * multiplier];
    return newEuro;
}


#pragma mark - Overwriten

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
