//
//  PlayingGameViewController.m
//  Matchismo
//
//  Created by Ming HU on 4/7/13.
//  Copyright (c) 2013 Ming HU. All rights reserved.
//

#import "PlayingGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface PlayingGameViewController ()

@property (weak, nonatomic) IBOutlet UISwitch *modSwitch;

@end


@implementation PlayingGameViewController


- (Deck *)createDeck
{
  return [[PlayingCardDeck alloc] init];
}

- (IBAction)changeGameMod:(UISwitch *)sender
{
  NSLog(@"try to change mod");
  [self switchGameMod];
}

@end
