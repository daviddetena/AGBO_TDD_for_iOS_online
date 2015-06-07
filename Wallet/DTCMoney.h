//
//  DTCMoney.h
//  Wallet
//
//  Created by David de Tena on 04/06/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DTCMoney : NSObject

#pragma mark - Properties
@property (nonatomic,strong,readonly) NSNumber *amount;
@property (nonatomic,readonly) NSString *currency;

#pragma mark - Factory methods
// Replace instancetype with id so the compiler decide the
// returned type instead of instances of DTCMoney
+(id) euroWithAmount:(NSInteger) amount;
+(id) dollarWithAmount:(NSInteger) amount;

-(id) initWithAmount:(NSInteger) amount
            currency:(NSString *) currency;

// Replace DTCMoney * with id so the compiler
// returns the proper type depending on the
// class where this method is called
-(id) times:(NSInteger) multiplier;

-(DTCMoney *) plus:(DTCMoney *) other;

@end
