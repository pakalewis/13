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



//#pragma mark - Initialization
//
//- (void)setup
//{
//    self.backgroundColor = nil;
//    self.opaque = NO;
//    self.contentMode = UIViewContentModeRedraw;
//}
//
//- (void)awakeFromNib
//{
//    [self setup];
//}
//
//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    [self setup];
//    return self;
//}
//
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = nil;
        self.opaque = NO;
        self.contentMode = UIViewContentModeRedraw;

    }
    return self;
}

-(void)drawRect:(CGRect)rect {
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius: [self cornerRadius]];
    
    [roundedRect addClip];
    
    [[UIColor lightGrayColor] setFill];
    UIRectFill(self.bounds);
    
    [[UIColor blackColor] setStroke];
    roundedRect.lineWidth = 3;
    [roundedRect stroke];

    [self drawRankAndSuit];
}


#define CORNER_FONT_STANDARD_HEIGHT 180.0
#define CORNER_RADIUS 12.0

- (CGFloat)cornerScaleFactor { return self.bounds.size.height / CORNER_FONT_STANDARD_HEIGHT; }
- (CGFloat)cornerRadius { return CORNER_RADIUS * [self cornerScaleFactor]; }
- (CGFloat)cornerOffset { return [self cornerRadius] / 3.0; }


- (void)drawRankAndSuit {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    UIFont *font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    font = [font fontWithSize:font.pointSize * [self cornerScaleFactor]];

    
    UIColor *color;
    if (self.playingCard.isSuitRed) {
        color = [UIColor redColor];
    } else {
        color = [UIColor blackColor];
    }
    
    NSString *rankAndSuitString = [NSString stringWithFormat:@"%@\n%@", [self.playingCard rankAsString], self.playingCard.suit];
    NSDictionary * attributes = @{
                                  NSFontAttributeName : font,
                                  NSParagraphStyleAttributeName : paragraphStyle,
                                  NSForegroundColorAttributeName : color};
    if (self.playingCard.isSuitRed) {
        
        
    }
    NSAttributedString *attributedRankAndSuitString = [[NSAttributedString alloc] initWithString:rankAndSuitString attributes:attributes];
    
    CGRect textBounds;
    textBounds.origin = CGPointMake([self cornerOffset], [self cornerOffset]);
    textBounds.size = [attributedRankAndSuitString size];
    [attributedRankAndSuitString drawInRect:textBounds];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, self.bounds.size.width, self.bounds.size.height);
    CGContextRotateCTM(context, M_PI);
    
    [attributedRankAndSuitString drawInRect:textBounds];
    
    CGContextRestoreGState(UIGraphicsGetCurrentContext());
}


//@synthesize playingCard = _playingCard;
//- (PlayingCard *)playingCard {
//    return _playingCard;
//}
- (void)setPlayingCard:(PlayingCard *)playingCard {
    _playingCard = playingCard;
//    self.rankLabel.text = [NSString stringWithFormat:@" %@", self.playingCard.rankAsString];
//    self.suitLabel.text = [NSString stringWithFormat:@" %@", self.playingCard.suit];
//    self.centerLabel.text = [NSString stringWithFormat:@" %@", self.playingCard.suit];
//    if (playingCard.isSuitRed) {
//        self.rankLabel.textColor = [UIColor redColor];
//        self.suitLabel.textColor = [UIColor redColor];
//        self.centerLabel.textColor = [UIColor redColor];
//    }
}







@end
