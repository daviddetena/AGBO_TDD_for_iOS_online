//
//  DTCDollar.m
//  Wallet
//
//  Created by David de Tena on 04/06/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import "DTCDollar.h"

@interface DTCDollar()

@property (nonatomic) NSInteger amount;

@end

@implementation DTCDollar

#pragma mark - Init
-(id) initWithAmount:(NSInteger) amount{
    if(self = [super init]){
        _amount = amount;
    }
    return self;
}

-(DTCDollar *) times:(NSInteger) multiplier{
    DTCDollar *newDollar = [[DTCDollar alloc]
                        initWithAmount:self.amount * multiplier];
    return newDollar;
}

#pragma mark - Overwriten

// Implement the simplest way: compare the two amounts
-(BOOL) isEqual:(id)object{
    return [self amount]==[object amount];
}

@end
