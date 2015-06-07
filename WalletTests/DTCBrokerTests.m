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
@property (nonatomic,strong) DTCBroker *emptyBroker;
@property (nonatomic,strong) DTCMoney *oneDollar;
@end

@implementation DTCBrokerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.emptyBroker = [DTCBroker new];
    self.oneDollar = [DTCMoney dollarWithAmount:1];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.emptyBroker = nil;
    self.oneDollar = nil;
}


// Test de reducción
- (void) testSimpleReduction{
    // Sum of two amounts of dollars
    DTCMoney *sum = [[DTCMoney dollarWithAmount:5] plus:[DTCMoney dollarWithAmount:5]];
    DTCMoney *reduced = [self.emptyBroker reduce: sum toCurrency:@"USD"];
    
    // Check that a reduction of an amount in a currency is the same amount in that currency
    XCTAssertEqualObjects(sum, reduced, @"Conversion to same currency should be a NOP");
}

// Queremos $10 == €5, 2:1
- (void) testReduction{
    
    // We want broker to have a rate method from one currency to another
    [self.emptyBroker addRate: 2 fromCurrency:@"EUR" toCurrency:@"USD"];
    
    DTCMoney *dollars = [DTCMoney dollarWithAmount:10];
    DTCMoney *euros = [DTCMoney euroWithAmount:5];
    
    // Reduce dollars to euros
    DTCMoney *converted = [self.emptyBroker reduce:dollars toCurrency:@"EUR"];
    XCTAssertEqualObjects(converted, euros,@"$10 should be €5, rate 2:1");
    
}

// Test to check that an exception is raised if no rates is found to that conversion
- (void) testThatNoRateRaisesException{
    XCTAssertThrows([self.emptyBroker reduce:self.oneDollar toCurrency:@"EUR"],@"No rates should cause exception");
}


// Test to check that $1 converted to USD is still $1
- (void) testThatNilConversionDoesNotChangeMoney{
    
    XCTAssertEqualObjects(self.oneDollar,
                          [self.emptyBroker reduce:self.oneDollar
                                        toCurrency:@"USD"],@"A nil conversion should have no effect");
}


@end
