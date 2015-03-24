//
//  Game.h
//  13
//
//  Created by Parker Lewis on 3/4/15.
//  Copyright (c) 2015 Parker Lewis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "Deck.h"


typedef enum {
    undetermined,
    singles,
    doubles,
    triples,
    bomb,
    run
} GameState;

@interface Game : NSObject


@property (nonatomic) GameState gameState;
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) NSArray *players;

@property (strong, nonatomic) Player * player1;
@property (strong, nonatomic) Player * player2;
@property (strong, nonatomic) Player * player3;
@property (strong, nonatomic) Player * player4;

@property (strong, nonatomic) NSMutableArray *selectedCards;



@end
