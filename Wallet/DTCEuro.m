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

-(DTCEuro *) times:(NSInteger) multiplier{
    DTCEuro *newEuro = [[DTCEuro alloc]
                        initWithAmount:self.amount * multiplier];
    return newEuro;
}


#pragma mark - Overwriten





@end
