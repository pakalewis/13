//
//  PlayingCard.m
//  13
//
//  Created by Parker Lewis on 3/3/15.
//  Copyright (c) 2015 Parker Lewis. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard


-(BOOL)isSuitBlack {
    if ([self.suit isEqualToString:@"♠︎"] || [self.suit isEqualToString:@"♣︎"]) {
        return YES;
    }
//    if ([self.suit isEqualToString:@"♣︎"]) {
//        return YES;
//    }
    return NO;
}

- (BOOL)isSuitRed {
    if ([self.suit isEqualToString:@"♦︎"] || [self.suit isEqualToString:@"♥︎"]) {
        return YES;
    }
    return NO;
}

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

- (NSString *) rankAsString {
    NSArray *rankStrings = [PlayingCard rankStrings];
    return rankStrings[self.rank];
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


- (NSComparisonResult)compare:(PlayingCard *)otherCard {
    NSArray *ranksInOrder = @[@"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K", @"A", @"2"];
    NSArray *suitsInOrder = @[@"♠︎", @"♣︎", @"♦︎", @"♥︎"];
    
    NSInteger rankCheck = [ranksInOrder indexOfObject:self.rankAsString] - [ranksInOrder indexOfObject:otherCard.rankAsString];
    NSInteger suitCheck = [suitsInOrder indexOfObject:self.suit] - [suitsInOrder indexOfObject:otherCard.suit];
    
    if (rankCheck > 0) {
        return NSOrderedDescending;
    } else if (rankCheck < 0) {
        return NSOrderedAscending;
    } else { // Ranks are the same
        if (suitCheck > 0) {
            return NSOrderedDescending;
        } else {
            return NSOrderedAscending;
        }
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
