//
//  ViewController.h
//  13
//
//  Created by Parker Lewis on 3/3/15.
//  Copyright (c) 2015 Parker Lewis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayingCard.h"
#import "Deck.h"
#import "Player.h"


@interface ViewController : UIViewController

@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) NSArray *players;

@end

