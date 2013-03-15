//
//  RootViewController.m
//  RabbitVsBear
//
//  Created by Oleksii Vynogradov on 3/29/12.
//  Copyright (c) 2012 IXC-USA Corp. All rights reserved.
///

#import "RootViewController.h"

#import "ModelController.h"

#import "DataViewController.h"

@interface RootViewController ()
@property (readonly, strong, nonatomic) ModelController *modelController;
@end

@implementation RootViewController

@synthesize pageViewController = _pageViewController;
@synthesize modelController = _modelController;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // Configure the page view controller and add it as a child view controller.
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageViewController.delegate = self;

    DataViewController *startingViewController = [self.modelController viewControllerAtIndex:0 storyboard:self.storyboard];
    NSArray *viewControllers = [NSArray arrayWithObject:startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:NULL];

    self.pageViewController.dataSource = self.modelController;

    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];

    // Set the page view controller's bounds using an inset rect so that self's view is visible around the edges of the pages.
//    CGRect pageViewRect = self.view.bounds;
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
//        pageViewRect = CGRectInset(pageViewRect, 40.0, 40.0);
//    }
//    self.pageViewController.view.frame = pageViewRect;

    [self.pageViewController didMoveToParentViewController:self];

    //EDITED Need to take care of all gestureRecogizers. Got a bug when only setting the delegate for Tap
        for (UIGestureRecognizer *gR in self.pageViewController.gestureRecognizers) {
            gR.delegate = self;
        }
    // Add the page view controller's gesture recognizers to the book view controller's view so that the gestures are started more easily.
    //self.view.gestureRecognizers = self.pageViewController.gestureRecognizers;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    DataViewController *startingViewController = [self.pageViewController.viewControllers objectAtIndex:0];
    [startingViewController shouldAutorotate];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (BOOL)shouldAutorotate {
    UIInterfaceOrientation orientation = [[UIDevice currentDevice] orientation];
    return [self shouldAutorotateToInterfaceOrientation:orientation];
}

- (ModelController *)modelController
{
     // Return the model controller object, creating it if necessary.
     // In more complex implementations, the model controller may be passed to the view controller.
    if (!_modelController) {
        _modelController = [[ModelController alloc] init];
        _modelController.pageViewController = self.pageViewController ;
    }
    return _modelController;
}

#pragma mark - UIPageViewController delegate methods

/*
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    
}
 */

- (UIPageViewControllerSpineLocation)pageViewController:(UIPageViewController *)pageViewController spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation
{
//    if (UIInterfaceOrientationIsPortrait(orientation) || ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)) {
//    if (UIInterfaceOrientationIsPortrait(orientation) || ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)) {

    // In portrait orientation or on iPhone: Set the spine position to "min" and the page view controller's view controllers array to contain just one view controller. Setting the spine position to 'UIPageViewControllerSpineLocationMid' in landscape orientation sets the doubleSided property to YES, so set it to NO here.
        
        UIViewController *currentViewController = [self.pageViewController.viewControllers objectAtIndex:0];
        NSArray *viewControllers = [NSArray arrayWithObject:currentViewController];
        [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:NULL];
        
        self.pageViewController.doubleSided = NO;
        return UIPageViewControllerSpineLocationMin;
//    }

    // In landscape orientation: Set set the spine location to "mid" and the page view controller's view controllers array to contain two view controllers. If the current page is even, set it to contain the current and next view controllers; if it is odd, set the array to contain the previous and current view controllers.
//    DataViewController *currentViewController = [self.pageViewController.viewControllers objectAtIndex:0];
//    NSArray *viewControllers = nil;
//
//    NSUInteger indexOfCurrentViewController = [self.modelController indexOfViewController:currentViewController];
//    if (indexOfCurrentViewController == 0 || indexOfCurrentViewController % 2 == 0) {
//        UIViewController *nextViewController = [self.modelController pageViewController:self.pageViewController viewControllerAfterViewController:currentViewController];
//        viewControllers = [NSArray arrayWithObjects:currentViewController, nextViewController, nil];
//    } else {
//        UIViewController *previousViewController = [self.modelController pageViewController:self.pageViewController viewControllerBeforeViewController:currentViewController];
//        viewControllers = [NSArray arrayWithObjects:previousViewController, currentViewController, nil];
//    }
//    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:NULL];


    return UIPageViewControllerSpineLocationMid;
}
#pragma mark - UIGestureRecognizerDelegate delegate methods


-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    //Touch gestures below top bar should not make the page turn.
    //EDITED Check for only Tap here instead.
    //if ([gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]]) {
        CGPoint touchPoint = [touch locationInView:self.view];
        //NSLog(@">>>>>>>>>>>>>>>>%@",NSStringFromCGPoint(touchPoint));
        DataViewController *startingViewController = [self.pageViewController.viewControllers objectAtIndex:0];
        
        if (CGRectContainsPoint(startingViewController.playStop.frame, touchPoint) || CGRectContainsPoint(startingViewController.buttonsView.frame, touchPoint)  || CGRectContainsPoint(startingViewController.image1.frame, touchPoint)  || CGRectContainsPoint(startingViewController.image2.frame, touchPoint)  || CGRectContainsPoint(startingViewController.image4.frame, touchPoint)  || CGRectContainsPoint(startingViewController.image3.frame, touchPoint)  || CGRectContainsPoint(startingViewController.image5.frame, touchPoint)  || CGRectContainsPoint(startingViewController.image6.frame, touchPoint)  || CGRectContainsPoint(startingViewController.image7.frame, touchPoint)  || CGRectContainsPoint(startingViewController.nextPageButton.frame, touchPoint)  || CGRectContainsPoint(startingViewController.previousPageButton.frame, touchPoint)) {
            //NSLog(@"touchPoint.y > 90 && touchPoint.y < 312 %@",NSStringFromCGPoint(touchPoint));

            return NO;
        }
    //}
    return NO;
}
@end
