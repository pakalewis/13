//
//  PlayingCardView.m
//  13
//
//  Created by Parker Lewis on 3/6/15.
//  Copyright (c) 2015 Parker Lewis. All rights reserved.
//

#import "PlayingCardView.h"

@implementation PlayingCardView


- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor blueColor];
        
        CGRect rankFrame = CGRectMake(0, 0, frame.size.width / 4, 40);
        self.rankLabel = [[UILabel alloc] initWithFrame:rankFrame];
        self.rankLabel.backgroundColor = [UIColor redColor];
        
        CGRect suitFrame = CGRectMake(0, 40, frame.size.width / 4, 40);
        self.suitLabel = [[UILabel alloc] initWithFrame:suitFrame];
        self.suitLabel.backgroundColor = [UIColor greenColor];
        
        [self addSubview:self.rankLabel];
        [self addSubview:self.suitLabel];
    }
    return self;
}

@end
