//
//  ViewController.h
//  CCSDKDemo
//
//  Created by Marlon Vargas Contreras on 7/4/15.
//  Copyright (c) 2015 Krieger Electronics de Mexico SA de CV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *currentBirthday;
- (IBAction)startButtonSDK:(id)sender;
- (IBAction)deleteUserInfo:(id)sender;

#define genderMale       @"MALE"
#define genderFemale     @"FEMALE"
#define genderUnspecified   @"UNSPECIFIED"
typedef NSString*       gender;

@end