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
    DTCEuro *product = [euro times:2];
    
    XCTAssertEqual(product.amount,10, @"5*2 should be 10");
}

@end
