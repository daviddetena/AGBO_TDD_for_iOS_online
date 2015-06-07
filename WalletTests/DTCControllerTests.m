//
//  DTCControllerTests.m
//  Wallet
//
//  Created by David de Tena on 07/06/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "DTCViewController.h"
#import "DTCWallet.h"
#import "DTCWalletTableViewController.h"

@interface DTCControllerTests : XCTestCase
@property (nonatomic,strong) DTCViewController *viewController;
@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) UILabel *label;

@property (nonatomic,strong) DTCWalletTableViewController *walletVC;
@property (nonatomic,strong) DTCWallet *wallet;
@end

@implementation DTCControllerTests

- (void)setUp {
    [super setUp];
    // Set up lab environment
    self.viewController = [[DTCViewController alloc] initWithNibName:nil bundle:nil];
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setTitle:@"Hello!" forState:UIControlStateNormal];
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];

    // Asign who the label is
    self.viewController.displayLabel = self.label;
    
    self.wallet = [[DTCWallet alloc] initWithAmount:1 currency:@"USD"];
    [self.wallet plus:[DTCMoney euroWithAmount:1]];
    self.walletVC = [[DTCWalletTableViewController alloc] initWithModel:self.wallet];
}

- (void)tearDown {
    // Tear down lab environment
    [super tearDown];
    self.viewController = nil;
    self.button = nil;
    self.label = nil;
}

- (void) testThatTextOnLabelIsEqualToTextOnButton{
    
    // Send the message. Action: displayText; sender:button
    [self.viewController displayText:self.button];
    
    // Check that the label and the button have the same text
    XCTAssertEqualObjects(self.button.titleLabel.text, self.label.text,@"Button and label should have the same text");
}


// Test sections and rows
- (void) testThatTableHasOneSection{
    
    NSUInteger sections = [self.walletVC numberOfSectionsInTableView:nil];

    // Number of elements per section
    XCTAssertEqual(sections, 1, @"There can only be one section!");
}

- (void) testThatNumberOfCellsIsNumberOfMoneyPlusOne{
    XCTAssertEqual(self.wallet.count + 1,
                   [self.walletVC tableView:nil numberOfRowsInSection:0],
                   @"The number of cells must be the number of moneys plus 1 (the total)");
}


@end
