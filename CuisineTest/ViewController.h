//
//  ViewController.h
//  CuisineTest
//
//  Created by O’lmasbek Axtamov on 13.04.20.
//  Copyright © 2020 O’lmasbek Axtamov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *scoreLbl;
@property (strong, nonatomic) IBOutlet UILabel *progressLbl;
- (IBAction)exitBtnPressed:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *questationLbl;
@property (strong, nonatomic) IBOutlet UIButton *aButton;
@property (strong, nonatomic) IBOutlet UIButton *bButton;
@property (strong, nonatomic) IBOutlet UIButton *cButton;
@property (strong, nonatomic) IBOutlet UIButton *dButton;

- (IBAction)pressedAnswer:(UIButton *)sender;

-(void)regenerateQuestations: (int) numberOfQuestation;
-(void)countTrueAnswers:(int) senderTag;
-(void)changeProgressView: (int) questations;

-(void)doButtonsCircled:(UIButton*)button;

@property (strong, nonatomic) IBOutlet UIView *progressView;

@end

