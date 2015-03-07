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

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    Player *player1 = [[Player alloc] init];
    player1.name = @"Parker";
    Player *player2 = [[Player alloc] init];
    player2.name = @"Grant";
    Player *player3 = [[Player alloc] init];
    player3.name = @"Carlo";
    Player *player4 = [[Player alloc] init];
    player4.name = @"Evan";
    self.players = @[player1, player2, player3, player4];
    
    self.deck = [[Deck alloc] init];
    [self.deck dealCardsToPlayers:self.players];
    
    for (Player *player in self.players) {
        NSLog(@"%@'s hand is %@", player.name, [player displayHand]);
    }

//    for (PlayingCard *card in player1.hand) {
////        NSLog(@"%@", card.contents);
//
//        CGFloat height = self.player1HandContainer.frame.size.height;
//        CGFloat width = self.player1HandContainer.frame.size.width / 13;
//        
//        CGRect cardFrame = CGRectMake(0, 0, 50, 100);
//        PlayingCardView *cardView = [[PlayingCardView alloc] initWithFrame:cardFrame];
//        cardView.rankLabel.text = [card rankAsString];
//        cardView.suitLabel.text = card.suit;
//        [self.player1HandContainer addSubview:cardView];
//
//    }
    
    CGRect cardFrame = CGRectMake(20, 20, 50, 100);
    PlayingCardView *cardView = [[PlayingCardView alloc] initWithFrame:cardFrame];
    cardView.rankLabel.text = @"4";
    cardView.suitLabel.text = @"CLUBS";
    [self.view addSubview:cardView];
//    [self.view bringSubviewToFront:cardView];
    
//    UIView *testView = [[UIView alloc] initWithFrame:cardFrame];
//    testView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:testView];
}

- (IBAction)backButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:self completion:nil];
}


@end
