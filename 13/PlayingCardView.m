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
        
        //        self.playingCard = [[PlayingCard alloc] init];
        
        self.backgroundColor = [UIColor blueColor];
        self.rankLabel = [[UILabel alloc] init];
        self.suitLabel = [[UILabel alloc] init];
        
        self.rankLabel.textAlignment = NSTextAlignmentCenter;
        self.suitLabel.textAlignment = NSTextAlignmentCenter;
        
        self.rankLabel.backgroundColor = [UIColor redColor];
        self.suitLabel.backgroundColor = [UIColor greenColor];
        
        
        [self addSubview:self.rankLabel];
        [self addSubview:self.suitLabel];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor blueColor];
        self.rankLabel = [[UILabel alloc] init];
        self.suitLabel = [[UILabel alloc] init];
        
        self.rankLabel.textAlignment = NSTextAlignmentLeft;
        self.suitLabel.textAlignment = NSTextAlignmentLeft;
        
        self.rankLabel.backgroundColor = [UIColor redColor];
        self.suitLabel.backgroundColor = [UIColor greenColor];
        
        CGRect rankFrame = CGRectMake(0, 0, frame.size.width, 40);
        self.rankLabel.frame = rankFrame;
        
        CGRect suitFrame = CGRectMake(0, 40, frame.size.width, 40);
        self.suitLabel.frame = suitFrame;

        [self addSubview:self.rankLabel];
        [self addSubview:self.suitLabel];
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
}




-(void)cardTappedGesture:(UITapGestureRecognizer *)tapGestureRecognizer {
    NSLog(@"%@, tapped", self.rankLabel.text);
}




- (void)adjustToFitFrame:(CGRect)frame {
    
    CGRect rankFrame = CGRectMake(0, 0, frame.size.width, 40);
    self.rankLabel.frame = rankFrame;

    CGRect suitFrame = CGRectMake(0, 40, frame.size.width, 40);
    self.suitLabel.frame = suitFrame;
    
}


@end
