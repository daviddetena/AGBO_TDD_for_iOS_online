//
//  DTCMoney.m
//  Wallet
//
//  Created by David de Tena on 04/06/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import "DTCMoney.h"
#import "NSObject+GNUStepAddons.h"

@interface DTCMoney()

@property (nonatomic) NSInteger amount;

@end

@implementation DTCMoney

-(id) initWithAmount:(NSInteger) amount{
    if(self = [super init]){
        _amount = amount;
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

@end
