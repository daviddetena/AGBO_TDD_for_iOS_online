//
//  DTCDollar.m
//  Wallet
//
//  Created by David de Tena on 04/06/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//
//  Import @property amount from private

#import "DTCDollar.h"
#import "DTCMoney-private.h"

@implementation DTCDollar

-(DTCDollar *) times:(NSInteger) multiplier{
    DTCDollar *newDollar = [[DTCDollar alloc]
                        initWithAmount:[self.amount integerValue] * multiplier];
    return newDollar;
}

#pragma mark - Overwriten



@end
