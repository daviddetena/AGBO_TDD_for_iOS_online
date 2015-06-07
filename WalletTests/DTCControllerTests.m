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

@interface DTCControllerTests : XCTestCase
@property (nonatomic,strong) DTCViewController *viewController;
@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) UILabel *label;
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

@end
