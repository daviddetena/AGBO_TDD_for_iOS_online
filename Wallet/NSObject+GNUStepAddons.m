//
//  NSObject+GNUStepAddons.m
//  Wallet
//
//  Created by David de Tena on 04/06/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

// Import objective-C runtime

#import <objc/runtime.h>
#import "NSObject+GNUStepAddons.h"

@implementation NSObject (GNUStepAddons)

-(id) subclassResponsability: (SEL) aSel{
    
    // Si lo que devuelve object_getClass es una clase, tendremos métodos de clase (+)
    // o de instancia (-)
    char prefix = class_isMetaClass(object_getClass(self)) ? '+' : '-';
    
    // Lanzamos excepción indicando que el método tal (from selector) debería ser sobreescrito
    // por su subclase
    [NSException raise: NSInvalidArgumentException
                format:@"%@%c%@ should be overriden by its subclass",
     NSStringFromClass([self class]),prefix,NSStringFromSelector(aSel)];
    
    return self;    //not reached
}

@end
