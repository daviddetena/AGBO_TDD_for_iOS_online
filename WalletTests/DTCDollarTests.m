//
//  DTCDollarTests.m
//  Wallet
//
//  Created by David de Tena on 04/06/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "DTCDollar.h"

@interface DTCDollarTests : XCTestCase

@end

@implementation DTCDollarTests

-(void) testMultiplication{
    DTCDollar *five = [[DTCDollar alloc] initWithAmount:5];
    DTCDollar *total = [five times:2];
    DTCDollar *ten = [[DTCDollar alloc] initWithAmount:10];
    XCTAssertEqualObjects(ten,total, @"$5 * 2 should be $10");
}


-(void) testEquality{
    DTCDollar *five = [[DTCDollar alloc] initWithAmount:5];
    DTCDollar *total = [five times:2];
    DTCDollar *ten = [[DTCDollar alloc] initWithAmount:10];
    
    XCTAssertEqualObjects(total, ten,@"Equivalent objects should be equal");
    XCTAssertFalse([total isEqual:five], @"Non equivalent objects should not be equal");
}

@end
