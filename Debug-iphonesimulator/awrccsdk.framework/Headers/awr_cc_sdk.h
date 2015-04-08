//
//  awr_cc_sdk.h
//  awr-cc-sdk
//
//  Created by Marlon Vargas Contreras on 23/3/15.
//  Copyright (c) 2015 Krieger Electronics de Mexico SA de CV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface awr_cc_sdk : NSObject<CLLocationManagerDelegate>

@property CLLocationManager *locationManager;
@property CLBeaconRegion *kriegerBeaconRegion;

-(BOOL)startLocationFrameworkWithAppId:(NSNumber *)appId Birthday:(NSDate*)birthdayNSDate Gender:(NSString*)genderRegistered;

-(void)stopMonitoring;

-(void)stopMonitoringAndDeleteUserID;

@end
