//
//  GameViewController.m
//  13
//
//  Created by Parker Lewis on 3/6/15.
//  Copyright (c) 2015 Parker Lewis. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()
@property (weak, nonatomic) IBOutlet UIView *player1HandContainer;
@property (strong, nonatomic) Player * player1;
@property (strong, nonatomic) Player * player2;
@property (strong, nonatomic) Player * player3;
@property (strong, nonatomic) Player * player4;

@property (strong, nonatomic) NSMutableArray *playingCardViews;
@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.player1 = [[Player alloc] init];
    self.player1.name = @"Parker";
    self.player2 = [[Player alloc] init];
    self.player2.name = @"Grant";
    self.player3 = [[Player alloc] init];
    self.player3.name = @"Carlo";
    self.player4 = [[Player alloc] init];
    self.player4.name = @"Evan";
    self.players = @[self.player1, self.player2, self.player3, self.player4];
    
    self.deck = [[Deck alloc] init];
    [self.deck dealCardsToPlayers:self.players];
    
    for (Player *player in self.players) {
        NSLog(@"%@'s hand is %@", player.name, [player displayHand]);
    }

    
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:true];

    self.playingCardViews = [[NSMutableArray alloc] init];
    
    for (PlayingCard *card in self.player1.hand) {
        PlayingCardView *cardView = [[PlayingCardView alloc] init];
        cardView.rankLabel.text = [card rankAsString];
        cardView.suitLabel.text = card.suit;
        [self.player1HandContainer addSubview:cardView];
        [self.playingCardViews addObject:cardView];
    }
    [self updateCardFrames];
}

- (IBAction)backButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:self completion:nil];
}

- (void)updateCardFrames {

    CGFloat height = self.player1HandContainer.frame.size.height;
    CGFloat width = self.player1HandContainer.frame.size.width / [self.playingCardViews count];
    
    int count = 0;
    for (PlayingCardView *playingCardView in self.playingCardViews) {
        CGRect cardFrame = CGRectMake(count * width, 0, width, height);
        playingCardView.frame = cardFrame;
        NSLog(@"%@", NSStringFromCGRect(cardFrame));
        [playingCardView adjustToFitFrame:cardFrame];
        count++;
    }
    
}


@end
