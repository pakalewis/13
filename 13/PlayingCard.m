//
//  PlayingCard.m
//  13
//
//  Created by Parker Lewis on 3/3/15.
//  Copyright (c) 2015 Parker Lewis. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard


// Getter for contents property
- (NSString*) contents {
    return [NSString stringWithFormat:@"%lu%@", (unsigned long)self.rank, self.suit];
}


+ (NSArray*) validSuits {
    return @[@"♠︎", @"♣︎", @"♦︎", @"♥︎"];
}

@synthesize suit = _suit;
- (NSString*) suit {
    return _suit ? _suit : @"?";
}

- (void) setSuit:(NSString*)suit {
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}


@end
