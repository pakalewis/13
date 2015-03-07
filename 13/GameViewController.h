//
//  GameViewController.h
//  13
//
//  Created by Parker Lewis on 3/6/15.
//  Copyright (c) 2015 Parker Lewis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"
#import "Player.h"
#import "PlayingCardView.h"

@interface GameViewController : UIViewController


@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) NSArray *players;

@end
