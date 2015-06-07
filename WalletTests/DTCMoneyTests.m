//
//  DTCMoneyTests.m
//  Wallet
//
//  Created by David de Tena on 04/06/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "DTCMoney.h"

@interface DTCMoneyTests : XCTestCase

@end

@implementation DTCMoneyTests

-(void) testCurrencies{
    XCTAssertEqualObjects(@"EUR",[[DTCMoney euroWithAmount:1] currency], @"The currency of euros should be EUR.");
    XCTAssertEqualObjects(@"USD",[[DTCMoney dollarWithAmount:1] currency], @"The currency of dollars should be USD");
}

-(void) testMultiplication{
    
    // Escribimos "la carta a los Reyes Magos",
    // incluyendo código ideal de clases que
    // aún no tenemos
    DTCMoney *euro = [DTCMoney euroWithAmount:5];
    DTCMoney *ten = [DTCMoney euroWithAmount:10];
    DTCMoney *product = [euro times:2];
    
    XCTAssertEqualObjects(product,ten,@"€5 * 2 should be €10");
}

-(void) testEquality{
    DTCMoney *five = [DTCMoney euroWithAmount:5];
    DTCMoney *ten = [DTCMoney euroWithAmount:10];
    DTCMoney *total = [five times:2];
    
    XCTAssertEqualObjects(ten, total, @"Equivalent objects should be equal!");
    
    // Put this test simply to verify that passes with dollar as well
    XCTAssertEqualObjects([DTCMoney dollarWithAmount:4], [[DTCMoney dollarWithAmount:2] times:2],@"Equivalent objects should be equal!");
}


// Check that $1 != €1
-(void) testDifferentCurrencies{
    DTCMoney *euro = [DTCMoney euroWithAmount:1];
    DTCMoney *dollar = [DTCMoney dollarWithAmount:1];
    
    XCTAssertNotEqualObjects(euro, dollar,@"Different currencies should not be equal!");
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
    DTCMoney *a = [DTCMoney euroWithAmount:2];
    DTCMoney *b = [DTCMoney euroWithAmount:2];
    
    // método hash: devuelve un entero largo sin signo
    XCTAssertEqual([a hash], [b hash], @"Equal objects must have same hash");
    // Put this test simply to verify that passes with dollar as well
    XCTAssertEqual([[DTCMoney dollarWithAmount:1] hash],[[DTCMoney dollarWithAmount:1] hash],@"Equal objects must have same hash");
}


- (void) testAmountStorage{
    DTCMoney *euro = [DTCMoney euroWithAmount:2];
    
    // We should only test the public interface of an object
    // The exception is for fixing bugs in private interface
    
    // Ask the compiler not to let us know about warnings in this method with the given selector
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    
    XCTAssertEqual(2,[[euro performSelector:@selector(amount)] integerValue], @"The value retrieved should be the same as the stored");
    // Put this test simply to verify that passes with dollar as well
    XCTAssertEqual(2,[[[DTCMoney dollarWithAmount:2] performSelector:@selector(amount)] integerValue], @"The value retrieved should be the same as the stored");
#pragma clang diagnostic pop
}


// Simple test of addition
-(void) testSimpleAddition{
    XCTAssertEqualObjects([[DTCMoney dollarWithAmount:5] plus:
                           [DTCMoney dollarWithAmount:5]],
                           [DTCMoney dollarWithAmount:10],@"$5 + $5 = $10");
}

// Check that the hash is the same that amount. (Now amount is a NSNumber and hash
// is a NSUInteger)
- (void) testThatHashIsAmount{
    DTCMoney *one = [DTCMoney dollarWithAmount:1];
    XCTAssertEqual([one hash], 1,@"The hash must be the same as the amount");
}

// We want that our DTCMoney description method has the template <DTCMoney: $1>
- (void) testDescription{
    DTCMoney *one = [DTCMoney dollarWithAmount:1];
    NSString *desc = @"<DTCMoney: $1>";
    
    XCTAssertEqualObjects(desc, [one description],@"Description must match template");
}



@end
