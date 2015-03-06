//
//  ViewController.m
//  13
//
//  Created by Parker Lewis on 3/3/15.
//  Copyright (c) 2015 Parker Lewis. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;


@end

@implementation ViewController

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
    self.players = @[player1, player2, player3];

    self.deck = [[Deck alloc] init];
    [self.deck dealCardsToPlayers:self.players];
    
    for (Player *player in self.players) {
        NSLog(@"%@", [player displayHand]);
    }
    NSLog(@"%lu", [self.deck getCount]);

}

- (IBAction)buttonClicked:(UIButton *)sender {
    NSUInteger count = [self.deck getCount];
    NSLog(@"%lu", count);
    if (count > 0) {
        PlayingCard *card = [self.deck drawRandomCard];
        NSLog(@"%@", card.contents);
        self.label.text = card.contents;
    } else {
        self.label.text = @"no cards left";
    }
}


@end
