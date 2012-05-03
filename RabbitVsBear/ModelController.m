//
//  ModelController.m
//  RabbitVsBear
//
//  Created by Oleksii Vynogradov on 3/29/12.
//  Copyright (c) 2012 IXC-USA Corp. All rights reserved.
//

#import "ModelController.h"

#import "DataViewController.h"

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */

@interface ModelController()
@property (readonly, strong, nonatomic) NSArray *pageData;
@end

@implementation ModelController

@synthesize pageData = _pageData;
@synthesize pageViewController = _pageViewController;

- (id)init
{
    self = [super init];
    if (self) {
        // Create the data model.
        //NSURL *play1 = [[NSBundle mainBundle] URLForResource:@"page10audioUA" withExtension:@"mp3"];

        NSDictionary *page1 = [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"page1GIPhone.png"],@"imageIphoneLandscape",[UIImage imageNamed:@"page1VIPhone.png"],@"imageIphonePortrait",[UIImage imageNamed:@"page1GIPad.png"],@"imageIPadLandscape",[UIImage imageNamed:@"page1VIPad.png"],@"imageIPadPortrait",@"01",@"page", nil];
        NSDictionary *page2 = [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"page2GIPhone.png"],@"imageIphoneLandscape",[UIImage imageNamed:@"page2VIPhone.png"],@"imageIphonePortrait",[UIImage imageNamed:@"page2GIPad.png"],@"imageIPadLandscape",[UIImage imageNamed:@"page2VIPad.png"],@"imageIPadPortrait",@"02",@"page", nil];
        NSDictionary *page3 = [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"page3GIPhone.png"],@"imageIphoneLandscape",[UIImage imageNamed:@"page3VIPhone.png"],@"imageIphonePortrait",[UIImage imageNamed:@"page3GIPad.png"],@"imageIPadLandscape",[UIImage imageNamed:@"page3VIPad.png"],@"imageIPadPortrait",@"03",@"page", nil];
        NSDictionary *page4 = [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"page4GIPhone.png"],@"imageIphoneLandscape",[UIImage imageNamed:@"page4VIPhone.png"],@"imageIphonePortrait",[UIImage imageNamed:@"page4GIPad.png"],@"imageIPadLandscape",[UIImage imageNamed:@"page4VIPad.png"],@"imageIPadPortrait",@"04",@"page", nil];
        NSDictionary *page5 = [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"page5GIPhone.png"],@"imageIphoneLandscape",[UIImage imageNamed:@"page5VIPhone.png"],@"imageIphonePortrait",[UIImage imageNamed:@"page5GIPad.png"],@"imageIPadLandscape",[UIImage imageNamed:@"page5VIPad.png"],@"imageIPadPortrait",@"05",@"page", nil];
        NSDictionary *page6 = [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"page6GIPhone.png"],@"imageIphoneLandscape",[UIImage imageNamed:@"page6VIPhone.png"],@"imageIphonePortrait",[UIImage imageNamed:@"page6GIPad.png"],@"imageIPadLandscape",[UIImage imageNamed:@"page6VIPad.png"],@"imageIPadPortrait",@"06",@"page", nil];
        NSDictionary *page7 = [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"page1GIPhone.png"],@"imageIphoneLandscape",[UIImage imageNamed:@"page1VIPhone.png"],@"imageIphonePortrait",[UIImage imageNamed:@"page1GIPad.png"],@"imageIPadLandscape",[UIImage imageNamed:@"page1VIPad.png"],@"imageIPadPortrait",@"07",@"page", nil];
        NSDictionary *page8 = [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"page8GIPhone.png"],@"imageIphoneLandscape",[UIImage imageNamed:@"page8VIPhone.png"],@"imageIphonePortrait",[UIImage imageNamed:@"page8GIPad.png"],@"imageIPadLandscape",[UIImage imageNamed:@"page8VIPad.png"],@"imageIPadPortrait",@"08",@"page", nil];
        NSDictionary *page9 = [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"page1GIPhone.png"],@"imageIphoneLandscape",[UIImage imageNamed:@"page1VIPhone.png"],@"imageIphonePortrait",[UIImage imageNamed:@"page1GIPad.png"],@"imageIPadLandscape",[UIImage imageNamed:@"page1VIPad.png"],@"imageIPadPortrait",@"09",@"page", nil];
        NSDictionary *page10 = [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"page1GIPhone.png"],@"imageIphoneLandscape",[UIImage imageNamed:@"page1VIPhone.png"],@"imageIphonePortrait",[UIImage imageNamed:@"page1GIPad.png"],@"imageIPadLandscape",[UIImage imageNamed:@"page1VIPad.png"],@"imageIPadPortrait",@"10",@"page", nil];
        NSDictionary *page11 = [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"page1GIPhone.png"],@"imageIphoneLandscape",[UIImage imageNamed:@"page1VIPhone.png"],@"imageIphonePortrait",[UIImage imageNamed:@"page1GIPad.png"],@"imageIPadLandscape",[UIImage imageNamed:@"page1VIPad.png"],@"imageIPadPortrait",@"11",@"page", nil];
        NSDictionary *page12 = [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"page1GIPhone.png"],@"imageIphoneLandscape",[UIImage imageNamed:@"page1VIPhone.png"],@"imageIphonePortrait",[UIImage imageNamed:@"page1GIPad.png"],@"imageIPadLandscape",[UIImage imageNamed:@"page1VIPad.png"],@"imageIPadPortrait",@"12",@"page", nil];
        NSDictionary *page13 = [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"page1GIPhone.png"],@"imageIphoneLandscape",[UIImage imageNamed:@"page1VIPhone.png"],@"imageIphonePortrait",[UIImage imageNamed:@"page1GIPad.png"],@"imageIPadLandscape",[UIImage imageNamed:@"page1VIPad.png"],@"imageIPadPortrait",@"13",@"page", nil];
        NSDictionary *page14 = [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"page1GIPhone.png"],@"imageIphoneLandscape",[UIImage imageNamed:@"page1VIPhone.png"],@"imageIphonePortrait",[UIImage imageNamed:@"page1GIPad.png"],@"imageIPadLandscape",[UIImage imageNamed:@"page1VIPad.png"],@"imageIPadPortrait",@"14",@"page", nil];
        NSDictionary *page15 = [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"page1GIPhone.png"],@"imageIphoneLandscape",[UIImage imageNamed:@"page1VIPhone.png"],@"imageIphonePortrait",[UIImage imageNamed:@"page1GIPad.png"],@"imageIPadLandscape",[UIImage imageNamed:@"page1VIPad.png"],@"imageIPadPortrait",@"15",@"page", nil];
        NSDictionary *page16 = [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"page1GIPhone.png"],@"imageIphoneLandscape",[UIImage imageNamed:@"page1VIPhone.png"],@"imageIphonePortrait",[UIImage imageNamed:@"page1GIPad.png"],@"imageIPadLandscape",[UIImage imageNamed:@"page1VIPad.png"],@"imageIPadPortrait",@"16",@"page", nil];
        
        //NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        _pageData = [NSArray arrayWithObjects:page1,page2,page3,page4,page5,page6,page7,page8,page9,page10,page11,page12,page13,page14,page15,page16,nil];//[[dateFormatter monthSymbols] copy];
    }
    return self;
}

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard
{   
    // Return the data view controller for the given index.
    if (([self.pageData count] == 0) || (index >= [self.pageData count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    DataViewController *dataViewController = [storyboard instantiateViewControllerWithIdentifier:@"DataViewController"];
    dataViewController.dataObject = [self.pageData objectAtIndex:index];
    //NSLog(@"viewControllerAtIndex: data :%@ for page:%u",dataViewController.dataObject,index);

    dataViewController.modelController = self;
    return dataViewController;
}

- (NSUInteger)indexOfViewController:(DataViewController *)viewController
{   
     // Return the index of the given data view controller.
     // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
    return [self.pageData indexOfObject:viewController.dataObject];
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(DataViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(DataViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageData count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

@end
