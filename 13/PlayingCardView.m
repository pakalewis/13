//
//  PlayingCardView.m
//  13
//
//  Created by Parker Lewis on 3/6/15.
//  Copyright (c) 2015 Parker Lewis. All rights reserved.
//

#import "PlayingCardView.h"

@implementation PlayingCardView

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor lightGrayColor];
        self.layer.borderWidth = 2;
        self.layer.cornerRadius = 10;
        
        self.rankLabel = [[UILabel alloc] init];
        self.suitLabel = [[UILabel alloc] init];
        self.centerLabel = [[UILabel alloc] init];

        self.rankLabel.textAlignment = NSTextAlignmentLeft;
        self.suitLabel.textAlignment = NSTextAlignmentLeft;
        self.centerLabel.textAlignment = NSTextAlignmentCenter;

        self.rankLabel.backgroundColor = [UIColor clearColor];
        self.suitLabel.backgroundColor = [UIColor clearColor];
        self.centerLabel.backgroundColor = [UIColor clearColor];
        
        CGRect rankFrame = CGRectMake(0, 0, frame.size.width, 40);
        self.rankLabel.frame = rankFrame;
        
        CGRect suitFrame = CGRectMake(0, 40, frame.size.width, 40);
        self.suitLabel.frame = suitFrame;

        CGFloat centerLabelWidth = frame.size.width * 0.75;
        CGRect centerSuitFrame = CGRectMake((frame.size.width / 2) - (centerLabelWidth / 2), frame.size.height / 2 - centerLabelWidth / 2, centerLabelWidth, centerLabelWidth);
        self.centerLabel.frame = centerSuitFrame;

        [self addSubview:self.rankLabel];
        [self addSubview:self.suitLabel];
        [self addSubview:self.centerLabel];
    }
    return self;
}



//@synthesize playingCard = _playingCard;
//- (PlayingCard *)playingCard {
//    return _playingCard;
//}
- (void)setPlayingCard:(PlayingCard *)playingCard {
    _playingCard = playingCard;
    self.rankLabel.text = [NSString stringWithFormat:@" %@", self.playingCard.rankAsString];
    self.suitLabel.text = [NSString stringWithFormat:@" %@", self.playingCard.suit];
    self.centerLabel.text = [NSString stringWithFormat:@" %@", self.playingCard.suit];
    if (playingCard.isSuitRed) {
        self.rankLabel.textColor = [UIColor redColor];
        self.suitLabel.textColor = [UIColor redColor];
        self.centerLabel.textColor = [UIColor redColor];
    }
}








- (void)adjustToFitFrame:(CGRect)frame {
    
    CGRect rankFrame = CGRectMake(0, 0, frame.size.width, 40);
    self.rankLabel.frame = rankFrame;

    CGRect suitFrame = CGRectMake(0, 40, frame.size.width, 40);
    self.suitLabel.frame = suitFrame;
    
}


@end
