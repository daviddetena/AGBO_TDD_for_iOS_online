//
//  DTCEuro.m
//  Wallet
//
//  Created by David de Tena on 03/06/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//
//  Import @property amount from private

#import "DTCEuro.h"
#import "DTCMoney-private.h"


@implementation DTCEuro

-(DTCEuro *) times:(NSInteger) multiplier{
    DTCEuro *newEuro = [[DTCEuro alloc]
                        initWithAmount:[self.amount integerValue] * multiplier];
    return newEuro;
}


#pragma mark - Overwriten





@end
