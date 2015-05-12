//
//  ViewController.m
//  MVC
//
//  Created by Артур Сагидулин on 12.05.15.
//  Copyright (c) 2015 Артур Сагидулин. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISwitch *mySwitch;
@property (weak, nonatomic) IBOutlet UISegmentedControl *mySegments;
@property (weak, nonatomic) IBOutlet UISlider *mySlider;
@property (weak, nonatomic) IBOutlet UITextField *myField;
@property (weak, nonatomic) IBOutlet UIButton *myButton;
@property NSUserDefaults *defaults;


- (IBAction)switched:(id)sender;
- (IBAction)choised:(id)sender;
- (IBAction)swiped:(id)sender;
- (IBAction)pressed:(id)sender;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_myField addTarget:self action:@selector(textChanged:)
       forControlEvents:UIControlEventEditingChanged];
    _defaults = [NSUserDefaults standardUserDefaults];
    [self setupScreen];
}

-(void)setupScreen{
    [_mySwitch setOn:[_defaults boolForKey:@"switcher"]];
    [_mySegments setSelectedSegmentIndex:[_defaults integerForKey:@"segments"]];
    [_mySlider setValue:[_defaults floatForKey:@"slider"]];
    [_myField setText:[_defaults objectForKey:@"text"]];
    
    UIColor *stored = [UIColor colorWithHue:[_defaults floatForKey:@"button"] saturation:1.0 brightness:1.0 alpha:1.0];
    [_myButton setBackgroundColor:stored];
}

- (IBAction)switched:(id)sender {
    if ([_mySwitch isOn]) {
        [_defaults setBool:YES forKey:@"switcher"];
    } else {
        [_defaults setBool:NO forKey:@"switcher"];
    }
    [_defaults synchronize];
}

- (IBAction)choised:(id)sender {
    [_defaults setInteger:[_mySegments selectedSegmentIndex]
                   forKey:@"segments"];
    
    [_defaults synchronize];
}

- (IBAction)swiped:(id)sender {
    [_defaults setFloat:[_mySlider value]
                 forKey:@"slider"];
    [_defaults synchronize];
}

-(void)textChanged:(id)sender{
    NSLog(@"%@", _myField.text);
    [_defaults setObject:[_myField text] forKey:@"text"];
    [_defaults synchronize];
}

- (IBAction)pressed:(id)sender {
    float rand = drand48();
    UIColor *random = [UIColor colorWithHue:rand saturation:1.0 brightness:1.0 alpha:1.0];
    _myButton.backgroundColor = random;
    [_defaults setFloat:rand forKey:@"button"];
    [_defaults synchronize];
}
@end
