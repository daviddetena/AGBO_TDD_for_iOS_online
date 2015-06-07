//
//  DTCWallet.h
//  Wallet
//
//  Created by David de Tena on 07/06/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTCMoney.h"

@interface DTCWallet : NSObject<DTCMoney>

@property (nonatomic,readonly) NSUInteger count;

@end
