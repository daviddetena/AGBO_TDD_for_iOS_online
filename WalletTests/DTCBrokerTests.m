//
//  DTCBrokerTests.m
//  Wallet
//
//  Created by David de Tena on 07/06/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "DTCMoney.h"
#import "DTCBroker.h"

@interface DTCBrokerTests : XCTestCase

@end

@implementation DTCBrokerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


// Test de reducción. Hacemos que $10 sean iguales a €5, con una tasa de
// reducción 2 a 1. (carta a reyes magos)
- (void) testSimpleReduction{
    
    DTCBroker *broker = [[DTCBroker alloc] init];

    // Sum of two amounts of dollars
    DTCMoney *sum = [[DTCMoney dollarWithAmount:5] plus:[DTCMoney dollarWithAmount:5]];
    DTCMoney *reduced = [broker reduce: sum toCurrency:@"USD"];
    
    // Check that a reduction of an amount in a currency is the same amount in that currency
    XCTAssertEqualObjects(sum, reduced, @"Conversion to same currency should be a NOP");
}

@end
