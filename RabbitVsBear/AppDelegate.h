//
//  AppDelegate.h
//  RabbitVsBear
//
//  Created by Oleksii Vynogradov on 3/29/12.
//  Copyright (c) 2012 IXC-USA Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) NSData *deviceToken;
@property (retain) NSMutableString *firstServer;
@property (retain) NSMutableString *secondServer;
@property (retain) NSMutableString *urlChoosed;
@property (retain) NSMutableDictionary *allURLs;

@property (retain) NSMutableString *appleID;
@property (retain) NSMutableString *messageFull;

@property (readwrite) BOOL isMessageConfirmed;
@property (readwrite) BOOL downloadCompleted;
@property (retain, nonatomic) NSMutableData *receivedData;

@end
