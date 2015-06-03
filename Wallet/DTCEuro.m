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

@end
