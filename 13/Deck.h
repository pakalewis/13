//
//  Deck.h
//  13
//
//  Created by Parker Lewis on 3/3/15.
//  Copyright (c) 2015 Parker Lewis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayingCard.h"
#import "Player.h"

@interface Deck : NSObject

- (void) addCard:(PlayingCard *)card atTop:(BOOL)atTop;
- (void) addCard:(PlayingCard *)card;
- (PlayingCard *)drawRandomCard;
- (NSUInteger) getCount;
- (void) dealCardsToPlayers:(NSArray *)players;

@end
