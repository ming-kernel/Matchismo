//
//  CardGameViewController.h
//  Matchismo
//
//  Created by Ming HU on 21/3/13.
//  Copyright (c) 2013 Ming HU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface CardGameViewController : UIViewController

- (void)switchGameMod;

// abstract
- (Deck *)createDeck;




@end
