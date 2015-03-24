//
//  Player.h
//  13
//
//  Created by Parker Lewis on 3/3/15.
//  Copyright (c) 2015 Parker Lewis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayingCard.h"
#import "CardGroup.h"

@interface Player : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSMutableArray *hand;
@property (strong, nonatomic) CardGroup *combinationToPlay;

- (void)displayHand;
- (void)displayCurrentCombination;
- (void)addCardToCombination:(PlayingCard *)card;
- (void)removeCardFromCombination:(PlayingCard *)card;
- (void)playCombination;

@end
