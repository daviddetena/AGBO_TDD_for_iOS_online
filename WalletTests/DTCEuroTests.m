//
//  DTCEuroTests.m
//  Wallet
//
//  Created by David de Tena on 03/06/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "DTCEuro.h"

@interface DTCEuroTests : XCTestCase

@end

@implementation DTCEuroTests

-(void) testMultiplication{
    
    // Escribimos "la carta a los Reyes Magos",
    // incluyendo código ideal de clases que
    // aún no tenemos
    DTCEuro *euro = [[DTCEuro alloc] initWithAmount:5];
    DTCEuro *ten = [[DTCEuro alloc] initWithAmount:10];
    DTCEuro *product = [euro times:2];
    
    XCTAssertEqualObjects(product,ten,@"€5 * 2 should be €10");
}

-(void) testEquality{
    DTCEuro *five = [[DTCEuro alloc] initWithAmount:5];
    DTCEuro *ten = [[DTCEuro alloc] initWithAmount:10];
    DTCEuro *total = [five times:2];
    
    XCTAssertEqualObjects(ten, total, @"Equivalent objects should be equal!");
}

/**
    Hacemos test de hash. En Cocoa, cuando una clase sobreescribe el método 
    isEqual: debe sobreescribir el método hash:. El framework de Cocoa impone
    que dos objetos que sean iguales deben tener el mismo hash; al contrario,
    no tiene por qué darse, es decir, dos objetos con el mismo hash no tienen
    por qué ser iguales.
 */
-(void) testHash{
    // a y b serán iguales porque tengo el testEquality que lo comprueba
    DTCEuro *a = [[DTCEuro alloc] initWithAmount:2];
    DTCEuro *b = [[DTCEuro alloc] initWithAmount:2];
    
    // método hash: devuelve un entero largo sin signo
    XCTAssertEqual([a hash], [b hash], @"Equal objects must have same hash");
}


- (void) testAmountStorage{
    DTCEuro *euro = [[DTCEuro alloc] initWithAmount:2];
    
    // We should only test the public interface of an object
    // The exception is for fixing bugs in private interface
    
    // Ask the compiler not to let us know about warnings in this method with the given selector
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    
    XCTAssertEqual(2,[[euro performSelector:@selector(amount)] integerValue], @"The value retrieved should be the same as the stored");

#pragma clang diagnostic pop
}

@end
