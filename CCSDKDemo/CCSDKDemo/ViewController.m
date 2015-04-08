//
//  ViewController.m
//  CCSDKDemo
//
//  Created by Marlon Vargas Contreras on 7/4/15.
//  Copyright (c) 2015 Krieger Electronics de Mexico SA de CV. All rights reserved.
//

#import "ViewController.h"
#import <awrccsdk/awr_cc_sdk.h>

@interface ViewController (){
    awr_cc_sdk *_awr_cc_sdk;
    
    UIDatePicker *datePicker;
    UITapGestureRecognizer *tapOutsideKeyboard;
    NSDate *birthdayNSDate;
    NSString *genderRegistered;
    BOOL successfulSDKStart;
}
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*review gender types at header class*/
    genderRegistered = genderMale;
    
    datePicker = UIDatePicker.new;
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker setDate: [NSDate date]];
    [datePicker addTarget:self action:@selector(upgradeDateUIDatePicker) forControlEvents:UIControlEventValueChanged];
    
    [self.currentBirthday setInputView:datePicker];
    
    tapOutsideKeyboard = UITapGestureRecognizer.new;
    //tapOutsideKeyboard.delegate = self;
    [tapOutsideKeyboard addTarget:self action:@selector(outOfKeyboard)];
    [self.view addGestureRecognizer:tapOutsideKeyboard];
    
    _awr_cc_sdk = [[awr_cc_sdk alloc] init];
    
    /*************************MODIFY METHOD WHEREVER AFFECTED*/
    
    //[_awr_cc_sdk startLocationFrameworkWithAppId:@5144752345317376 Birthday:birthdayNSDate Gender:genderRegistered];
    NSLog(@"__viewDidLoad__");
}

//Date picker
- (void)upgradeDateUIDatePicker{
    NSDateFormatter *landDateFormat = NSDateFormatter.new;
    [landDateFormat setDateFormat:@"dd/MM/yyyy"];
    self.currentBirthday.text = [landDateFormat stringFromDate:datePicker.date]; //obtiene la fecha que tiene el picker y lo manda al textField.
    birthdayNSDate = datePicker.date;
    NSLog(@"\n La fecha elegida: %@ \n", self.currentBirthday.text);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    return YES;
}

- (void) outOfKeyboard{
    [self.currentBirthday resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startButtonSDK:(id)sender {
    successfulSDKStart = [_awr_cc_sdk startLocationFrameworkWithAppId:@5759522421342208 Birthday:birthdayNSDate Gender:genderRegistered];
    NSLog(@"\nBoolean value: %d \n",successfulSDKStart);
    //NSLog(@"bool %s", successfulSDKStart ? "true" : "false");
}

- (IBAction)deleteUserInfo:(id)sender {
    [_awr_cc_sdk stopMonitoringAndDeleteUserID];
}

@end

