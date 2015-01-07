//
//  ViewController.h
//  HW_MVC
//
//  Created by Артур Сагидулин on 09.11.14.
//  Copyright (c) 2014 Артур Сагидулин. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UISwitch *mySwitcher;
@property (weak, nonatomic) IBOutlet UISegmentedControl *mySegControl;
@property (weak, nonatomic) IBOutlet UITextField *myField;
@property (weak, nonatomic) IBOutlet UIButton *myButton;
@property (weak,nonatomic)  IBOutlet UISlider *mySlider;
@property NSUserDefaults *defaults;


- (IBAction)switched:(UISwitch *)sender;
- (IBAction)tabbed:(UISegmentedControl *)sender;
- (IBAction)scrolled:(UISlider *)sender;
- (IBAction)pressed:(UIButton *)sender;
-(IBAction)textFieldChanged:(UITextField *)sender;

@end

