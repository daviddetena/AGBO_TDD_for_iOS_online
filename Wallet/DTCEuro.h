//
//  DTCEuro.h
//  Wallet
//
//  Created by David de Tena on 03/06/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTCMoney.h"

@interface DTCEuro : DTCMoney

#pragma mark - Init
-(id) initWithAmount:(NSInteger) amount;

-(DTCEuro *) times:(NSInteger) multiplier;

@end
