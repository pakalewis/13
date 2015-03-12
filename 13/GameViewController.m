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
@property (strong, nonatomic) NSMutableArray *playedCardViews;

@property (nonatomic) CGFloat standardOverlap;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.game = [[Game alloc] init];
    self.game.player1.name = self.player1Name;
    self.selectedCardViews = [[NSMutableArray alloc] init];
    self.playedCardViews = [[NSMutableArray alloc] init];
    [self.game.player1 displayHand];

    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.player1HandContainer.backgroundColor = [UIColor clearColor];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self determineOverlap];
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

- (void) determineOverlap {
    // Inspect views/sizes to determine standardOverlap
    self.standardOverlap = 40;
}

- (void) dealCardViews {
//    CGFloat height = self.player1HandContainer.frame.size.height;
//    CGFloat width = self.player1HandContainer.frame.size.width / [self.playingCardViews count];
    CGFloat posX = self.player1HandContainer.frame.origin.x;
    CGFloat posY = self.player1HandContainer.frame.origin.y;
    
    CGFloat leadingSpace = self.player1HandContainer.frame.size.width - self.tableauView.frame.size.width;
    CGFloat overlap = leadingSpace / 12;
    
    int count = 0;
    for (PlayingCardView *playingCardView in self.playingCardViews) {
        CGRect frame = CGRectMake(posX + count * overlap, posY, playingCardView.frame.size.width, playingCardView.frame.size.height);

        [UIView animateWithDuration:0.3 animations:^{
            playingCardView.frame = frame;
        }];
        count++;
    }
}


// Helper method. Need to figure out how to call via invocation
- (void) animateCardView:(PlayingCardView *)playingCardView ToFrame:(CGRect)frame {
    [UIView animateWithDuration:0.3 animations:^{
        playingCardView.frame = frame;
    }];
}


- (void)adjustCardFrames {
    
    CGFloat containerWidth = self.player1HandContainer.frame.size.width;
    CGFloat cardWidth = self.tableauView.frame.size.width;
    
    CGFloat overlap = (containerWidth - cardWidth) / ([self.playingCardViews count] - 1);
    if (overlap > self.standardOverlap) {
        overlap = 40;
    }

    
    CGFloat totalOverlap = ([self.playingCardViews count] - 1) * overlap;
    NSLog(@"totalOverlap is %f", totalOverlap);
    CGFloat startingX = 10 + (containerWidth - cardWidth - totalOverlap) / 2;
    NSLog(@"startingX is %f", startingX);

    int count = 0;
    for (PlayingCardView *playingCardView in self.playingCardViews) {
        CGRect cardFrame = CGRectMake(startingX + (count * overlap),
                                      playingCardView.frame.origin.y,
                                      playingCardView.frame.size.width,
                                      playingCardView.frame.size.height);
        [UIView animateWithDuration:0.3 animations:^{
            playingCardView.frame = cardFrame;
        }];
        count++;
    }
    
}




- (IBAction)backButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:self completion:nil];
}


- (IBAction)playButtonPressed:(UIButton *)sender {
    // Ask the player to play the combination
    // Maybe this should return a BOOL to determine whether these animations should occur
    [self.game.player1 playCombination];
    
    [self condensePlayedCards];
    
    [self layDownSelectedCardsOntoTableau];

    [self adjustCardFrames];
}


- (void)layDownSelectedCardsOntoTableau {
    // Determine positions of frames for selected cards
    CGRect tableauFrame = self.tableauView.frame;
    CGFloat totalWidthOfSelection = tableauFrame.size.width + (self.standardOverlap * ([self.selectedCardViews count] - 1));
    CGFloat startingXPos = tableauFrame.origin.x + (tableauFrame.size.width / 2) - (totalWidthOfSelection / 2);
    
    int count = 0;
    for (PlayingCardView *playingCardView in self.selectedCardViews) {
        // Remove from the playingCardViews array and add to the playedCardViews array
        [self.playingCardViews removeObject:playingCardView];
        [self.playedCardViews addObject:playingCardView];
        
        [UIView animateWithDuration:0.9 animations:^{
            [self.view bringSubviewToFront:playingCardView];
            playingCardView.frame = CGRectMake(startingXPos + self.standardOverlap * count,
                                               tableauFrame.origin.y,
                                               playingCardView.frame.size.width,
                                               playingCardView.frame.size.height);
        }];
        count++;
    }
    [self.selectedCardViews removeAllObjects];
}


- (void)condensePlayedCards {
    // Condense previously played card views
    NSLog(@"Played cards on the tableau = %lu", [self.playedCardViews count]);
    for (PlayingCardView *playingCardView in self.playedCardViews) {
        [UIView animateWithDuration:0.3 animations:^{
            playingCardView.frame = self.tableauView.frame;
        }];
    }
    [self.playedCardViews removeAllObjects];
    
}


//    float timeBetweenEvents = 3.0;
//        NSMethodSignature *methodSig = [NSMethodSignature methodSignatureForSelector:@selector(animateCardView:ToFrame:)];
//        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
//        [invocation setTarget:self];
//        [invocation setSelector:@selector(animateCardView:ToFrame:)];
//        [invocation setArgument:&(playingCardView) atIndex:2];
//        [invocation setArgument:&frame atIndex:3];
//
//
//        [self performSelector:@selector(animateCardView:ToFrame:) withObject:playingCardView afterDelay:(count * timeBetweenEvents)];



@end
