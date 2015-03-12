//
//  MainMenuViewController.m
//  13
//
//  Created by Parker Lewis on 3/3/15.
//  Copyright (c) 2015 Parker Lewis. All rights reserved.
//

#import "MainMenuViewController.h"
#import "GameViewController.h"

@interface MainMenuViewController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *enterYourNameLabel;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;

@property (strong, nonatomic) IBOutlet UIButton *playNewGameButton;

@end

@implementation MainMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.playNewGameButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.playNewGameButton.layer.cornerRadius = 10;
    self.playNewGameButton.layer.borderWidth = 2;
    
    self.nameTextField.delegate = self;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tapGesture];
    self.titleLabel.text = @"13 (Tiến Lên)";
    self.enterYourNameLabel.text = @"Enter Your Name";
    self.nameTextField.placeholder = @"your name";
    
    
}

- (IBAction)buttonClicked:(UIButton *)sender {
    // Present a new game on the GameViewController

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"New Game"]) {
        if ([segue.destinationViewController isMemberOfClass:[GameViewController class]]) {
            NSLog(@"correct class");
            GameViewController *gameViewController = segue.destinationViewController;
            gameViewController.player1Name = self.nameTextField.text;

        }
        
    }
}

-(void)dismissKeyboard {
    [self.nameTextField resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.nameTextField resignFirstResponder];
    return YES;
}
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    return YES;
}


@end
