//
//  Player.m
//  13
//
//  Created by Parker Lewis on 3/3/15.
//  Copyright (c) 2015 Parker Lewis. All rights reserved.
//

#import "Player.h"

@implementation Player


- (NSString *)displayHand {
    NSString *handString = @"";
    for (PlayingCard *card in self.hand) {
        handString = [handString stringByAppendingString:@" "];
        handString = [handString stringByAppendingString:card.contents];
    }
    return handString;
}


@end
