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

-(void) testThatTimesRaisesException{
    DTCMoney *money = [[DTCMoney alloc] initWithAmount:1];
    // Exception: this method needs to be implemented in subclasses
    XCTAssertThrows([money times:2],@"Should raise an exception");
}

@end
