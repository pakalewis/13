//
//  GameViewController.m
//  13
//
//  Created by Parker Lewis on 3/6/15.
//  Copyright (c) 2015 Parker Lewis. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()
@property (weak, nonatomic) IBOutlet UIView *tableauView;
@property (weak, nonatomic) IBOutlet UIView *player1HandContainer;

@property (strong, nonatomic) NSMutableArray *playingCardViews;
@property (strong, nonatomic) NSMutableArray *selectedCardViews;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.game = [[NewGame alloc] init];
    self.selectedCardViews = [[NSMutableArray alloc] init];

    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    [self createCardViews];
}


- (void) createCardViews {
    self.playingCardViews = [[NSMutableArray alloc] init];
    
    for (PlayingCard *card in self.game.player1.hand) {
        PlayingCardView *cardView = [[PlayingCardView alloc] initWithFrame:self.tableauView.frame];
        cardView.playingCard = card;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cardTappedGesture:)];
        [cardView addGestureRecognizer:tapGesture];
        [self.view addSubview:cardView];
        [self.playingCardViews addObject:cardView];
    }
    [self dealCardViews];
//    [self updateCardFrames];

}


-(void)cardTappedGesture:(UITapGestureRecognizer *)tapGestureRecognizer {
    PlayingCardView *tappedPlayingCardView = (PlayingCardView *)tapGestureRecognizer.view;
    NSLog(@"The tapped card is %@", tappedPlayingCardView.playingCard.contents);
    [self selectPlayingCard:tappedPlayingCardView];
    
    
}

- (void)selectPlayingCard:(PlayingCardView *)playingCardView {
    CGRect frame = playingCardView.frame;
    
    if (playingCardView.playingCard.isSelected) { // already selected
        playingCardView.playingCard.selected = NO;
        [self.game.player1 removeCardFromCombination:playingCardView.playingCard];
        [self.selectedCardViews removeObject:playingCardView];
        [UIView animateWithDuration:0.3 animations:^{
            playingCardView.frame = CGRectMake(frame.origin.x, frame.origin.y + 40, frame.size.width, frame.size.height);
        }];
    } else { // now it is selected
        playingCardView.playingCard.selected = YES;
        [self.game.player1 addCardToCombination:playingCardView.playingCard];
        [self.selectedCardViews addObject:playingCardView];
        [UIView animateWithDuration:0.3 animations:^{
            playingCardView.frame = CGRectMake(frame.origin.x, frame.origin.y - 40, frame.size.width, frame.size.height);
        }];
    }
}



- (void) dealCardViews {
//    CGFloat height = self.player1HandContainer.frame.size.height;
    CGFloat width = self.player1HandContainer.frame.size.width / [self.playingCardViews count];
    CGFloat posX = self.player1HandContainer.frame.origin.x;
    CGFloat posY = self.player1HandContainer.frame.origin.y;
    
    
    int count = 0;
    for (PlayingCardView *playingCardView in self.playingCardViews) {
        CGRect frame = CGRectMake(posX + count * width, posY, playingCardView.frame.size.width, playingCardView.frame.size.height);
        [UIView animateWithDuration:0.3 animations:^{
            playingCardView.frame = frame;
        }];
        count++;
    }
    

}



- (void)updateCardFrames {
    
    CGFloat height = self.player1HandContainer.frame.size.height;
    CGFloat width = self.player1HandContainer.frame.size.width / [self.playingCardViews count];
    
    int count = 0;
    for (PlayingCardView *playingCardView in self.playingCardViews) {
        CGRect cardFrame = CGRectMake(count * width, 0, width, height);
        playingCardView.frame = cardFrame;
        //        NSLog(@"%@", NSStringFromCGRect(cardFrame));
        [playingCardView adjustToFitFrame:cardFrame];
        count++;
    }
    
}




- (IBAction)backButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:self completion:nil];
}


- (IBAction)playButtonPressed:(UIButton *)sender {
    [self.game.player1 playCombination];
    for (PlayingCardView *playingCardView in self.selectedCardViews) {
        [self.playingCardViews removeObject:playingCardView];
        
        CGRect tableauFrame = self.tableauView.frame;

        [UIView animateWithDuration:0.3 animations:^{
            [self.view bringSubviewToFront:playingCardView];
            playingCardView.frame = CGRectMake(tableauFrame.origin.x, tableauFrame.origin.y, playingCardView.frame.size.width, playingCardView.frame.size.height);
        }];

    }
//    [self updateCardFrames];
}


@end
