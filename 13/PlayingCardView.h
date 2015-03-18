//
//  PlayingCardView.h
//  13
//
//  Created by Parker Lewis on 3/6/15.
//  Copyright (c) 2015 Parker Lewis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayingCard.h"
@interface PlayingCardView : UIView

@property (strong, nonatomic) PlayingCard *playingCard;

@property (nonatomic) BOOL faceUp;
@property (strong, nonatomic) UITapGestureRecognizer *tapGestureRecognizer;


@end
