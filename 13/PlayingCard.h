//
//  PlayingCard.h
//  13
//
//  Created by Parker Lewis on 3/3/15.
//  Copyright (c) 2015 Parker Lewis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlayingCard : NSObject


@property (strong, nonatomic) NSString *contents;
@property (nonatomic) NSUInteger rank;
@property (strong, nonatomic) NSString *suit;
@property (nonatomic, getter=isSelected) BOOL selected;

- (NSString *) rankAsString;


// Class methods
+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
