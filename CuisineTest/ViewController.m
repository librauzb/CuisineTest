//
//  ViewController.m
//  CuisineTest
//
//  Created by O’lmasbek Axtamov on 13.04.20.
//  Copyright © 2020 O’lmasbek Axtamov. All rights reserved.
//

#import "ViewController.h"
@interface ViewController (){
    NSArray *questationBank;
    NSArray *questationImagesBank;
    NSArray *aAnswersBank;
    NSArray *bAnswersBank;
    NSArray *cAnswersBank;
    NSArray *dAnswersBank;
    NSArray *correctAnswersBank;
    int questationNumber;
    int trueAnswers;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self doButtonsCircled:_aButton];
    [self doButtonsCircled:_bButton];
    [self doButtonsCircled:_cButton];
    [self doButtonsCircled:_dButton];
    
    trueAnswers = 0;
    questationNumber = 0;
   
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Questations" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    questationBank = [dict objectForKey:@"questationText"];
    questationImagesBank = [dict objectForKey:@"questationImage"];
    aAnswersBank = [dict objectForKey:@"optionA"];
    bAnswersBank = [dict objectForKey:@"optionB"];
    cAnswersBank = [dict objectForKey:@"optionC"];
    dAnswersBank = [dict objectForKey:@"optionD"];
    correctAnswersBank = [dict objectForKey:@"correctAnswer"];
    
    [self regenerateQuestations:questationNumber];
}

-(void)regenerateQuestations:(int)numberOfQuestation{
    
    [self changeProgressView:numberOfQuestation];
    
    
    self.progressLbl.text = [NSString stringWithFormat:@"%d/%lu",numberOfQuestation+1,(unsigned long)questationBank.count];
    self.scoreLbl.text = [NSString stringWithFormat:@"Score: %d",trueAnswers];
    
    
    
    self.questationLbl.text = [questationBank objectAtIndex:numberOfQuestation];
    
    NSString *filepath = [[NSBundle mainBundle]pathForResource:[questationImagesBank objectAtIndex:numberOfQuestation] ofType:@"jpg"];
    self.imageView.image = [UIImage imageWithContentsOfFile:filepath];
    
    [self.aButton setTitle:[NSString stringWithFormat:@"A: %@", [aAnswersBank objectAtIndex:numberOfQuestation]] forState:UIControlStateNormal];
    [self.bButton setTitle:[NSString stringWithFormat:@"B: %@", [bAnswersBank objectAtIndex:numberOfQuestation]] forState:UIControlStateNormal];
    [self.cButton setTitle:[NSString stringWithFormat:@"C: %@", [cAnswersBank objectAtIndex:numberOfQuestation]] forState:UIControlStateNormal];
    [self.dButton setTitle:[NSString stringWithFormat:@"D: %@", [dAnswersBank objectAtIndex:numberOfQuestation]] forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)pressedAnswer:(UIButton *)sender {
    [self countTrueAnswers:(int)(sender.tag)];
}

-(void)countTrueAnswers:(int)senderTag{
    
    int trueAnswer = [[correctAnswersBank objectAtIndex:questationNumber] intValue];
    if(senderTag == trueAnswer){
        trueAnswers++;
    }
    if (questationNumber <29) {
        questationNumber++;
    }
    else{
        self.aButton.enabled = false;
        self.bButton.enabled = false;
        self.cButton.enabled = false;
        self.dButton.enabled = false;
    }
    [self regenerateQuestations:questationNumber];
}

-(void)changeProgressView:(int)questations{
    
    CGRect newFrame = self.progressView.frame;
    newFrame.size.width = ((float)(self.view.frame.size.width)/(float)(questationBank.count))*(float)(questations+1);
    newFrame.size.height = self.progressView.frame.size.height;
    [self.progressView setFrame:newFrame];
    

}

-(void)doButtonsCircled:(UIButton *)button{
    button.layer.cornerRadius = 10;
    button.clipsToBounds = YES;
    button.titleLabel.font = [UIFont fontWithName:@"Helvatica" size:21.0];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:21.0];
}

- (IBAction)exitBtnPressed:(id)sender {
    exit(0);
}
@end
