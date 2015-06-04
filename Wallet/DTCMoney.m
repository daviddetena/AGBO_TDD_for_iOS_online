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
#import "DTCMoney-private.h"


@implementation DTCMoney

-(id) initWithAmount:(NSInteger) amount{
    if(self = [super init]){
        _amount = @(amount);
    }
    return self;
}

-(DTCMoney *) times:(NSInteger) multiplier{
    // No se debería llamar, sino que se debería
    // de usar el de la subclase
    
    // _cmd es parámetro oculto que recibe todo mensaje de Obj-C
    // y que indica el selector actual. self tb es pasado como
    // parámetro oculto
    return [self subclassResponsability:_cmd];
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
