//
//  NewGame.h
//  13
//
//  Created by Parker Lewis on 3/4/15.
//  Copyright (c) 2015 Parker Lewis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "Deck.h"


@interface NewGame : NSObject

@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) NSArray *players;

@end
