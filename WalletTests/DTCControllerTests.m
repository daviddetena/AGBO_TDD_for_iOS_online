//
//  DTCControllerTests.m
//  Wallet
//
//  Created by David de Tena on 07/06/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "DTCWallet.h"
#import "DTCWalletTableViewController.h"

@interface DTCControllerTests : XCTestCase

@property (nonatomic,strong) DTCWalletTableViewController *walletVC;
@property (nonatomic,strong) DTCWallet *wallet;
@end

@implementation DTCControllerTests

- (void)setUp {
    [super setUp];
    // Set up lab environment
    self.wallet = [[DTCWallet alloc] initWithAmount:1 currency:@"USD"];
    [self.wallet plus:[DTCMoney euroWithAmount:1]];
    self.walletVC = [[DTCWalletTableViewController alloc] initWithModel:self.wallet];
}

- (void)tearDown {
    // Tear down lab environment
    [super tearDown];
    self.walletVC = nil;
    self.wallet = nil;
}



// Test sections and rows
- (void) testThatNumberOfSectionsIsNumberOfCurrenciesPlusOne{
    
    NSUInteger sections = [self.walletVC numberOfSectionsInTableView:nil];

    // Number of elements per section
    XCTAssertEqual(sections, 3, @"The number of sections must be the number of currencies plus 1 (the total)");
}

- (void) testThatNumberOfCellsPerSectionIsNumberOfMoneysPlusOne{
    
    XCTAssertEqual(self.wallet.countEuros +1, [self.walletVC tableView:nil numberOfRowsInSection:0], @"Number of cells of Euros is the number of Euro moneys");
    
    XCTAssertEqual(self.wallet.countDollars +1, [self.walletVC tableView:nil numberOfRowsInSection:1], @"Number of cells of Dollars is the number of Dollar moneys");
    
    XCTAssertEqual(1, [self.walletVC tableView:nil numberOfRowsInSection:2], @"Number of cells for Total is one");
}


@end
