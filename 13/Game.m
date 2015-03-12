//
//  Game.m
//  13
//
//  Created by Parker Lewis on 3/4/15.
//  Copyright (c) 2015 Parker Lewis. All rights reserved.
//

#import "Game.h"

@implementation Game

-(instancetype)init {
    self = [super init];
    if (self) {
        self.player1 = [[Player alloc] init];
        self.player1.name = @"Parker";
        self.player2 = [[Player alloc] init];
        self.player2.name = @"Grant";
        self.player3 = [[Player alloc] init];
        self.player3.name = @"Carlo";
        self.player4 = [[Player alloc] init];
        self.player4.name = @"Evan";
        self.players = @[self.player1, self.player2, self.player3, self.player4];

        
        self.deck = [[Deck alloc] init];
        [self.deck dealCardsToPlayers:self.players];
        [self.player1 displayHand];
    }

    return self;
}



@end
