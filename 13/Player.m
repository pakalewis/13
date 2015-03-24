//
//  Player.m
//  13
//
//  Created by Parker Lewis on 3/3/15.
//  Copyright (c) 2015 Parker Lewis. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)init {
    self = [super init];
    if (self) {
//        self.combinationToPlay = [[NSMutableArray alloc] init];
    }
    return self;
}
-(CardGroup *)combinationToPlay {
    if (!_combinationToPlay) {
        _combinationToPlay = [[CardGroup alloc] init];
    }

    return _combinationToPlay;
}

- (void)displayHand {
    NSString *handString = [NSString stringWithFormat:@"%@'s hand:", self.name];
    for (PlayingCard *card in self.hand) {
        handString = [handString stringByAppendingString:@" "];
        handString = [handString stringByAppendingString:card.contents];
    }
    NSLog(@"%@", handString);
}

- (void) displayCurrentCombination {
    NSString *comboString = @"Current combo: ";
    for (PlayingCard *card in self.combinationToPlay.cards) {
        comboString = [comboString stringByAppendingString:@" "];
        comboString = [comboString stringByAppendingString:card.contents];
    }
    NSLog(@"%@", comboString);
}

- (void)addCardToCombination:(PlayingCard *)card {
    [self.combinationToPlay.cards addObject:card];
    [self displayCurrentCombination];
}

- (void)removeCardFromCombination:(PlayingCard *)card {
    [self.combinationToPlay.cards removeObject:card];
    [self displayCurrentCombination];
}

- (void)playCombination {
    //First check if it can be played legally
    for (PlayingCard *card in self.combinationToPlay.cards) {
        [self.hand removeObject:card];
    }
    self.combinationToPlay = nil;
    [self displayCurrentCombination];
    [self displayHand];
}

@end
