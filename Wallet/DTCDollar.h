//
//  DTCDollar.h
//  Wallet
//
//  Created by David de Tena on 04/06/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DTCDollar : NSObject

#pragma mark - Init
-(id) initWithAmount:(NSInteger) amount;

-(DTCDollar *) times:(NSInteger) multiplier;


@end
