//
//  DTCMoney.h
//  Wallet
//
//  Created by David de Tena on 04/06/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DTCMoney;
@class DTCBroker;

@protocol DTCMoney <NSObject>

-(id) initWithAmount:(NSInteger) amount
            currency:(NSString *) currency;

// Replace DTCMoney * with id so the compiler
// returns the proper type depending on the
// class where this method is called
// Returns an object that implements DTCMoney
// protocol: DTCMoney, DTCWallet, etc.
-(id<DTCMoney>) times:(NSInteger) multiplier;

-(id<DTCMoney>) plus:(DTCMoney *) other;

-(id<DTCMoney>) reduceToCurrency:(NSString *) currency withBroker:(DTCBroker *) broker;

@end


@interface DTCMoney : NSObject<DTCMoney>

#pragma mark - Properties
@property (nonatomic,strong,readonly) NSNumber *amount;
@property (nonatomic,readonly) NSString *currency;

#pragma mark - Factory methods
// Replace instancetype with id so the compiler decide the
// returned type instead of instances of DTCMoney
+(id) euroWithAmount:(NSInteger) amount;
+(id) dollarWithAmount:(NSInteger) amount;


@end
