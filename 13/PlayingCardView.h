//
//  PlayingCardView.h
//  13
//
//  Created by Parker Lewis on 3/6/15.
//  Copyright (c) 2015 Parker Lewis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView

@property (strong, nonatomic) UILabel * rankLabel;
@property (strong, nonatomic) UILabel * suitLabel;


- (void)adjustToFitFrame:(CGRect)frame;

@end
