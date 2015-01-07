//
//  ViewController.m
//  HW_MVC
//
//  Created by Артур Сагидулин on 09.11.14.
//  Copyright (c) 2014 Артур Сагидулин. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

@synthesize myButton,myField,mySegControl,mySwitcher,mySlider,defaults;


- (void)viewDidLoad {
    [super viewDidLoad];
    defaults = [NSUserDefaults standardUserDefaults];
    mySwitcher.on =([[defaults objectForKey:@"mySwitcher"]isEqualToString:@"YES"]) ? (YES) : (NO);
    mySegControl.selectedSegmentIndex = [[defaults objectForKey:@"mySegControl"] integerValue];
    mySlider.value = [defaults floatForKey:@"mySlider"];
    myField.text = [defaults objectForKey:@"myField"];
    NSData *cData = [defaults objectForKey:@"randColor"];
    myButton.backgroundColor = [NSKeyedUnarchiver unarchiveObjectWithData:cData];
}

- (UIColor *)randColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    return color;
}

-(IBAction)textFieldChanged:(UITextField *)sender{
    [defaults setObject:[myField text] forKey:@"myField"];
    NSLog(@"%@",[myField text]);
    [defaults synchronize];
}

- (IBAction)pressed:(UIButton *)sender {
    UIColor *randColor = [self randColor];
    myButton.backgroundColor = randColor;
    [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:randColor] forKey:@"randColor"];
    [defaults synchronize];
}

-(IBAction)switched:(UISwitch *)sender{
    if ([mySwitcher isOn]) {
        [defaults setObject:@"YES" forKey:@"mySwitcher"];
    } else {
        [defaults setObject:@"NO" forKey:@"mySwitcher"];
    }
    [defaults synchronize];
}
-(IBAction)tabbed:(id)sender{
    [defaults setObject:[NSNumber numberWithInt:[mySegControl selectedSegmentIndex]] forKey:@"mySegControl"];
    [defaults synchronize];
}

-(IBAction)scrolled:(id)sender{
    [defaults setFloat:[mySlider value] forKey:@"mySlider"];
    [defaults synchronize];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
