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
- (NSString *)contents {
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}


// Setter for rank property
- (void) setRank:(NSUInteger)rank {
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}


@synthesize suit = _suit;
- (NSString *)suit {
    return _suit ? _suit : @"?";
}

- (void) setSuit:(NSString *)suit {
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

// Class methods
+ (NSArray *)validSuits {
    return @[@"♠︎", @"♣︎", @"♦︎", @"♥︎"];
}

+ (NSArray *)rankStrings {
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger)maxRank {
    return [[PlayingCard rankStrings] count] -1;
}



@end
