//
//  DTCWalletTests.m
//  Wallet
//
//  Created by David de Tena on 07/06/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "DTCMoney.h"
#import "DTCBroker.h"
#import "DTCWallet.h"

@interface DTCWalletTests : XCTestCase

@end

@implementation DTCWalletTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

// €40 + $20 = $100, 2:1
- (void) testAdditionWithReduction{
    
    DTCBroker *broker = [DTCBroker new];
    [broker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
    
    // €40
    DTCWallet *wallet = [[DTCWallet alloc] initWithAmount:40 currency:@"EUR"];
    // €40 + $20
    [wallet plus: [DTCMoney dollarWithAmount:20]];
    
    // Check that €40 => $80
    DTCMoney *reduced = [broker reduce:wallet toCurrency:@"USD"];
    
    XCTAssertEqualObjects(reduced, [DTCMoney dollarWithAmount:100],@"€40 + $20 = $100, rate 2:1");
}


// €1 + €1 = €2
-(void)testCountEuros {
    
    DTCWallet *wallet = [[DTCWallet alloc] initWithAmount:1 currency:@"EUR"];
    
    [wallet plus:[DTCMoney euroWithAmount:1]];
    
    NSInteger numberOfEuros = wallet.countEuros;
    
    XCTAssertEqual(numberOfEuros, 2, @"€2");
}


// $1 + $1 = $2
-(void)testCountDollars {
    
    DTCWallet *wallet = [[DTCWallet alloc] initWithAmount:1 currency:@"USD"];
    
    [wallet plus:[DTCMoney dollarWithAmount:1]];
    
    NSInteger numberOfDollars = wallet.countDollars;
    
    XCTAssertEqual(numberOfDollars, 2, @"$2");
}



@end
