# README #


## PROJECT CONFIGURATION ##

### Import the SDK (Framework) ###

Use container awrccsdk.framework at folder Debug-iphoneos when performing test over a physical device, and container at folder Debug-Iphonesimulator when performing test at Xcode simulator.

1. Drag & drop the framework into your project, using the "Destination: Copy items if needed" setting while importing it.
2. In the editor (central panel), select General tab and locate the "Embedded Binaries" section. If the framework is not included, add it. Do the same for the "Linked Frameworks and Libraries" section.

3. Verify that the framework has been included at "Build Phases" tab, in "Link Binary With Libraries" sections. If not, use the (+) button to add it.
4. Locate the "Embed Frameworks" section and add the framework. Configuration within this section must be as follows (text in [ ] symbols is figurative):

    Destination: Frameworks   
    Subpath: [blank]   
    [unchecked] Copy only when installing   
    [frameworksname] .framework [checked]   


### Configure Notifications ###

In order to enable notifications to open the specified URLs generated by the SDK, inside your AppDelegate.m class, include this code:

    - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
        UILocalNotification *notification = [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];

        if(notification != nil){
            NSDictionary *userInfo = notification.userInfo;
            NSURL *siteURL = [NSURL URLWithString:[userInfo objectForKey:@"SiteURLKey"]];
            
            [[UIApplication sharedApplication] openURL:siteURL];
        }
    return YES;
    }

    -(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{

        NSDictionary *userInfo = notification.userInfo;
        NSURL *siteURL = [NSURL URLWithString:[userInfo objectForKey:@"SiteURLKey"]];
        if (UIApplicationStateInactive == [UIApplication sharedApplication].applicationState) {
            [[UIApplication sharedApplication] openURL:siteURL];
        }else{
            //Action if notification is received when app is at the foreground.
        }
    }

The View change will happen only when user choose to open the notification.

### Capabilities ###

Enable Location updates: in the Capabilities tab, within Background Modes section. Turn Location updates on.

## Create a key at Info.plist ##
To ask for permission to the user to get his location, app must have the key NSLocationAlwaysUsageDescription. To create it follow these steps: Locate your project's Info.plist file and select it, then at group "Information Property List" hover your cursor to the right of mentioned title and a (+) plus symbol will show, press it and type in the new key created (without quotation marks) "NSLocationAlwaysUsageDescription", then add a Value or description that will be shown to the user, being brief, why his/her location is required.


## USING THE SDK ##

In order to use the sdk, import it's methods

    #import <awrccsdk/awr_cc_sdk.h>

### Method Description ###

startLocationFrameworkWithAppId:Birthday:Gender:
Starts the SDK's and triggers it's configuration process. Should only be executed once per user session/

Arguments:  
appID (application number), a NSNumber value given to each developer by AWR Ideas, for more info visit awrideas.com  
birthday, a NSDate that contains the user birthday (dd/mm/yyyy)  
gender, a NSString indicating user gender. Value MUST be "MALE", "FEMALE" or "UNSPECIFIED" only (capitalized). Any other word will be ignored and the value will be set as "UNSPECIFIED" by default.  
Returns:  
boolean value (0/1) indicating the result of the SDK's internal configuration process, returning zero (0) if it failed.  


stopMonitoringAndDeleteUserID  
This method will stop every location process and will delete keys and data related to current user. A call to startLocationFrameworkWithAppId:Birthday:Gender will be required in order to start the SDK again.  

## SOLUTIONS TO COMMON PROBLEMS ##

If you see the this message after running the app (with a successful build).  
`  
dyld: Library not loaded:  
[…]  
Reason: image not found  
`  
Set the framework as Optional instead of Required in Project-> Targets-> Build Phases-> Link Binary with Libraries.

## SUPPORT ##

If something goes wrong, please contact the developers at info@krieger.mx

# LICENSE #

Copyright 2015 Krieger Electronics de México SA de CV

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
