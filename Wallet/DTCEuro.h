//
//  DTCEuro.h
//  Wallet
//
//  Created by David de Tena on 03/06/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DTCEuro : NSObject

@property (nonatomic,readonly) NSInteger amount;

#pragma mark - Init
-(id) initWithAmount:(NSInteger) amount;

-(void) times:(NSInteger) multiplier;

@end
