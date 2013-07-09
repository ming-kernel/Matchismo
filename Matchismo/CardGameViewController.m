//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Ming HU on 21/3/13.
//  Copyright (c) 2013 Ming HU. All rights reserved.
//

#import "CardGameViewController.h"

#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;



@property (strong, nonatomic) CardMatchingGame *game;

@end


@implementation CardGameViewController

// IBOutlet set functions
- (void)setCardButtons:(NSArray *)cardButtons
{
  _cardButtons = cardButtons;
  [self updateUI];
  NSLog(@"setCardButtons");
}


- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected | UIControlStateDisabled];
      
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = card.isUnplayable ? 0.3 : 1.0;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    if (self.game.lastResult)
        self.resultLabel.text = self.game.lastResult;
  
}

// abstract
- (Deck *)createDeck
{
  return nil; 
}


- (void)switchGameMod
{
  if (self.game.matchNumbers == 2) {
    self.game.matchNumbers = 3;
  } else if (self.game.matchNumbers == 3) {
    self.game.matchNumbers = 2;
  }
}

- (CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count usingDeck:[self createDeck]];
    return _game;
}


- (IBAction)flipCard:(UIButton *)sender
{
//  NSLog(@"card flipped");
  
  [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];

  [self updateUI];
}

- (IBAction)resetGame:(UIButton *)sender
{
  NSLog(@"resetGame");
  self.game = nil;
  [self updateUI];
}




@end
