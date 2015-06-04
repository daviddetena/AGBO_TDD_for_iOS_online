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



-(DTCDollar *) times:(NSInteger) multiplier{
    DTCDollar *newDollar = [[DTCDollar alloc]
                        initWithAmount:self.amount * multiplier];
    return newDollar;
}

#pragma mark - Overwriten



@end
