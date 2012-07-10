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
        // Landscape = Gorisontal
        // Portrait = Vertical
        
        
        // Create the data model.
        //NSURL *play1 = [[NSBundle mainBundle] URLForResource:@"page10audioUA" withExtension:@"mp3"];

        NSDictionary *page1 = [NSDictionary dictionaryWithObjectsAndKeys:
                               @"01",@"page",

                               [UIImage imageNamed:@"page1GIPhone_fon.png"],@"image_IPhone_Landscape",
                               [UIImage imageNamed:@"page1VIPhone_fon.png"],@"image_IPhone_Portrait",
                               [UIImage imageNamed:@"page1GIPad_fon.png"],@"image_IPad_Landscape",
                               [UIImage imageNamed:@"page1VIPad_fon.png"],@"image_IPad_Portrait",

                               
                               [UIImage imageNamed:@"page1VIPhone_medved.png"],@"image1_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(86,48,163,250)),@"image1_IPhone_Portrait_Point",
                               [UIImage imageNamed:@"page1GIPhone_madved.png"],@"image1_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(178, 10,163,250)),@"image1_IPhone_Landscape_Point",
                               [UIImage imageNamed:@"page1VIPad_medved.png"],@"image1_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(216,82,372,576)),@"image1_IPad_Portrait_Point",
                               [UIImage imageNamed:@"page1GIPad_medved.png"],@"image1_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(384,7,342,531)),@"image1_IPad_Landscape_Point",
                               @"Medved",@"image1_voiceName",

                               
                               [UIImage imageNamed:@"page1VIPhone_zaychik.png"],@"image2_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(16, 229,99,69)),@"image2_IPhone_Portrait_Point",
                               [UIImage imageNamed:@"page1GIPhone_zaychik.png"],@"image2_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(35, 146,99,69)),@"image2_IPhone_Landscape_Point",
                               [UIImage imageNamed:@"page1VIPad_zaychik.png"],@"image2_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(-9,523,236,170)),@"image2_IPad_Portrait_Point",
                               [UIImage imageNamed:@"page1GIPad_zaychik.png"],@"image2_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(55,387,221,171)),@"image2_IPad_Landscape_Point",
                               @"Zayec",@"image2_voiceName",

                               
                               [UIImage imageNamed:@"page1VIPhone_kuznechik.png"],@"image3_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(252, 151,48,32)),@"image3_IPhone_Portrait_Point",
                               [UIImage imageNamed:@"page1GIPhone_kuznechik.png"],@"image3_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(330, 62,48,32)),@"image3_IPhone_Landscape_Point",
                               [UIImage imageNamed:@"page1VIPad_kuznechik.png"],@"image3_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(607,316,115,68)),@"image3_IPad_Portrait_Point",
                               [UIImage imageNamed:@"page1GIPad_kuznechik.png"],@"image3_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(722,266,97,57)),@"image3_IPad_Landscape_Point",
                               @"Kuznechik",@"image3_voiceName",


                               [UIImage imageNamed:@"page1VIPhone_belka.png"],@"image4_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(-2, 114,86,63)),@"image4_IPhone_Portrait_Point",
                               [UIImage imageNamed:@"page1GIPhone_belka.png"],@"image4_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(61, 67,86,63)),@"image4_IPhone_Landscape_Point",
                               [UIImage imageNamed:@"page1VIPad_belka.png"],@"image4_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 242,191,142)),@"image4_IPad_Portrait_Point",
                               [UIImage imageNamed:@"page1GIPad_belka.png"],@"image4_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(151,165,213,156)),@"image4_IPad_Landscape_Point",
                               @"Belka",@"image4_voiceName",


                               [UIImage imageNamed:@"page1VIPhone_ptica.png"],@"image5_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(245, 27,40,37)),@"image5_IPhone_Portrait_Point",
                               [UIImage imageNamed:@"page1GIPhone_ptica.png"],@"image5_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(330, 10,40,37)),@"image5_IPhone_Landscape_Point",
                               [UIImage imageNamed:@"page1VIPad_ptica.png"],@"image5_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(591,35,98,91)),@"image5_IPad_Portrait_Point",
                               [UIImage imageNamed:@"page1GIPad_ptica.png"],@"image5_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(713,54,83,75)),@"image5_IPad_Landscape_Point",
                               @"Vorona",@"image5_voiceName",


                               [UIImage imageNamed:@""],@"image5_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image5_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image5_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image5_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Landscape_Point",


                               [UIImage imageNamed:@""],@"image6_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image6_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image6_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image6_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPad_Landscape_Point",


                               [UIImage imageNamed:@""],@"image7_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image7_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image7_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image7_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPad_Landscape_Point",

                               
                               nil];
                                                   
        NSDictionary *page2 = [NSDictionary dictionaryWithObjectsAndKeys:
                               @"02",@"page",

                               [UIImage imageNamed:@"page2GIPhone_fon.png"],@"image_IPhone_Landscape",
                               [UIImage imageNamed:@"page2VIPhone_fon.png"],@"image_IPhone_Portrait",
                               [UIImage imageNamed:@"page2GIPad_fon.png"],@"image_IPad_Landscape",
                               [UIImage imageNamed:@"page2VIPad_fon.png"],@"image_IPad_Portrait",
                               
                               [UIImage imageNamed:@"page2VIPhone_medved.png"],@"image1_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(112, -23,202,267)),@"image1_IPhone_Portrait_Point",
                               [UIImage imageNamed:@"page2GIPhone_medved.png"],@"image1_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(255, -5,201,258)),@"image1_IPhone_Landscape_Point",
                               [UIImage imageNamed:@"page2VIPad_medved.png"],@"image1_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(296,-12,458,605)),@"image1_IPad_Portrait_Point",
                               [UIImage imageNamed:@"page2GIPad_medved.png"],@"image1_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(542,-27,462,605)),@"image1_IPad_Landscape_Point",
                               @"Medved",@"image1_voiceName",

                               
                               [UIImage imageNamed:@"page2VIPhone_vorona.png"],@"image2_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(117, 212,100,70)),@"image2_IPhone_Portrait_Point",
                               [UIImage imageNamed:@"page2GIPhone_vorona.png"],@"image2_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(142, 167,100,70)),@"image2_IPhone_Landscape_Point",
                               [UIImage imageNamed:@"page2VIPad_vorona.png"],@"image2_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(339,498,231,162)),@"image2_IPad_Portrait_Point",
                               [UIImage imageNamed:@"page2GIPad_vorona.png"],@"image2_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(417,438,231,162)),@"image2_IPad_Landscape_Point",
                               @"Vorona",@"image2_voiceName",

                               
                               [UIImage imageNamed:@"page2VIPhone_ezh.png"],@"image3_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(75, 173,80,97)),@"image3_IPhone_Portrait_Point",
                               [UIImage imageNamed:@"page2GIPhone_ezh.png"],@"image3_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(88, 135,80,97)),@"image3_IPhone_Landscape_Point",
                               [UIImage imageNamed:@"page2VIPad_ezh.png"],@"image3_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(217,427,184,222)),@"image3_IPad_Portrait_Point",
                               [UIImage imageNamed:@"page2GIPad_ezh.png"],@"image3_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(294,329,184,222)),@"image3_IPad_Landscape_Point",
                               @"Ezh",@"image3_voiceName",

                               
                               [UIImage imageNamed:@"page2VIPhone_lisa.png"],@"image4_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 82, 100, 170)),@"image4_IPhone_Portrait_Point",
                               [UIImage imageNamed:@"page2GIPhone_lisa.png"],@"image4_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(13, 57, 100, 170)),@"image4_IPhone_Landscape_Point",
                               [UIImage imageNamed:@"page2VIPad_lisa.png"],@"image4_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(38,199,235,394)),@"image4_IPad_Portrait_Point",
                               [UIImage imageNamed:@"page2GIPad_lisa.png"],@"image4_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(75,152,235,394)),@"image4_IPad_Landscape_Point",
                               @"Lisica",@"image4_voiceName",

                               
                               [UIImage imageNamed:@""],@"image5_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image5_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image5_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image5_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Landscape_Point",

                               
                               [UIImage imageNamed:@""],@"image5_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image5_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image5_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image5_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Landscape_Point",
                               
                               [UIImage imageNamed:@""],@"image6_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image6_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image6_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image6_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPad_Landscape_Point",
                               
                               [UIImage imageNamed:@""],@"image7_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image7_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image7_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image7_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPad_Landscape_Point",
                               
                               @"02",@"page", nil];
        
        NSDictionary *page3 = [NSDictionary dictionaryWithObjectsAndKeys:
                               @"03",@"page",

                               [UIImage imageNamed:@"page3GIPhone_fon.png"],@"image_IPhone_Landscape",
                               [UIImage imageNamed:@"page3VIPhone_fon.png"],@"image_IPhone_Portrait",
                               [UIImage imageNamed:@"page3GIPad_fon.png"],@"image_IPad_Landscape",
                               [UIImage imageNamed:@"page3VIPad_fon.png"],@"image_IPad_Portrait",
                               
                               [UIImage imageNamed:@"page3VIPhone_medved.png"],@"image1_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 81,315,460)),@"image1_IPhone_Portrait_Point",
                               [UIImage imageNamed:@"page3GIPhone_medved.png"],@"image1_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(-46,0,350,300)),@"image1_IPhone_Landscape_Point",
                               [UIImage imageNamed:@"page3VIPad_medved.png"],@"image1_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0,28,747,989)),@"image1_IPad_Portrait_Point",
                               [UIImage imageNamed:@"page3GIPad_medved.png"],@"image1_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(42,-15,876,768)),@"image1_IPad_Landscape_Point",
                               @"Medved",@"image1_voiceName",

                               
                               [UIImage imageNamed:@""],@"image2_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image2_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image2_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image2_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image2_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image2_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image2_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image2_IPad_Landscape_Point",
                               
                               [UIImage imageNamed:@""],@"image3_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image3_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image3_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image3_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPad_Landscape_Point",
                               
                               [UIImage imageNamed:@""],@"image4_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image4_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image4_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image4_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPad_Landscape_Point",
                               
                               [UIImage imageNamed:@""],@"image5_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image5_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image5_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image5_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Landscape_Point",
                               
                               [UIImage imageNamed:@""],@"image5_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image5_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image5_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image5_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Landscape_Point",
                               
                               [UIImage imageNamed:@""],@"image6_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image6_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image6_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image6_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPad_Landscape_Point",
                               
                               [UIImage imageNamed:@""],@"image7_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image7_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image7_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image7_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPad_Landscape_Point",
                               
                               @"03",@"page", nil];
        
        NSDictionary *page4 = [NSDictionary dictionaryWithObjectsAndKeys:
                               @"04",@"page",

                               [UIImage imageNamed:@"page4GIPhone_fon.png"],@"image_IPhone_Landscape",
                               [UIImage imageNamed:@"page4VIPhone_fon.png"],@"image_IPhone_Portrait",
                               [UIImage imageNamed:@"page4GIPad_fon.png"],@"image_IPad_Landscape",
                               [UIImage imageNamed:@"page4VIPad_fon.png"],@"image_IPad_Portrait",
                               
                               [UIImage imageNamed:@"page4VIPhone_belka.png"],@"image1_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(30,77,128,167)),@"image1_IPhone_Portrait_Point",
                               [UIImage imageNamed:@"page4GIPhone_belka.png"],@"image1_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(50,21,129,167)),@"image1_IPhone_Landscape_Point",
                               [UIImage imageNamed:@"page4VIPad_belka.png"],@"image1_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(40,131,310,400)),@"image1_IPad_Portrait_Point",
                               [UIImage imageNamed:@"page4GIPad_belka.png"],@"image1_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(73,74,310,400)),@"image1_IPad_Landscape_Point",
                               @"Belka",@"image1_voiceName",

                               
                               [UIImage imageNamed:@"page4VIPhone_zayka.png"],@"image2_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(123,49,160,211)),@"image2_IPhone_Portrait_Point",
                               [UIImage imageNamed:@"page4GIPhone_zayka.png"],@"image2_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(216,-10,160,211)),@"image2_IPhone_Landscape_Point",
                               [UIImage imageNamed:@"page4VIPad_zayka.png"],@"image2_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(302,67,375,499)),@"image2_IPad_Portrait_Point",
                               [UIImage imageNamed:@"page4GIPad_zayka.png"],@"image2_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(474,0,375,499)),@"image2_IPad_Landscape_Point",
                               @"Zayec",@"image2_voiceName",

                               
                               [UIImage imageNamed:@"page4VIPhone_vorona.png"],@"image3_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(71,192,192,108)),@"image3_IPhone_Portrait_Point",
                               [UIImage imageNamed:@"page4GIPhone_vorona.png"],@"image3_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(110,115,192,108)),@"image3_IPhone_Landscape_Point",
                               [UIImage imageNamed:@"page4VIPad_vorona.png"],@"image3_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(173,387,408,271)),@"image3_IPad_Portrait_Point",
                               [UIImage imageNamed:@"page4GIPad_vorona.png"],@"image3_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(240,289,408,271)),@"image3_IPad_Landscape_Point",
                               @"Vorona",@"image3_voiceName",

                               
                               [UIImage imageNamed:@"page4VIPhone_zhuk.png"],@"image4_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(39,252,48,36)),@"image4_IPhone_Portrait_Point",
                               [UIImage imageNamed:@"page4VIPhone_zhuk.png"],@"image4_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(42,179,48,36)),@"image4_IPhone_Landscape_Point",
                               [UIImage imageNamed:@"page4VIPad_zhuk.png"],@"image4_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(70,558,106,78)),@"image4_IPad_Portrait_Point",
                               [UIImage imageNamed:@"page4VIPad_zhuk.png"],@"image4_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(126,464,106,78)),@"image4_IPad_Landscape_Point",
                               @"Zhuk",@"image4_voiceName",

                               
                               [UIImage imageNamed:@""],@"image5_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image5_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image5_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image5_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Landscape_Point",
                               
                               [UIImage imageNamed:@""],@"image5_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image5_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image5_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image5_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Landscape_Point",
                               
                               [UIImage imageNamed:@""],@"image6_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image6_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image6_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image6_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPad_Landscape_Point",
                               
                               [UIImage imageNamed:@""],@"image7_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image7_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image7_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image7_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPad_Landscape_Point",
                               
                               @"04",@"page", nil];
        
        NSDictionary *page5 = [NSDictionary dictionaryWithObjectsAndKeys:
                               @"05",@"page",

                               [UIImage imageNamed:@"page5GIPhone_fon.png"],@"image_IPhone_Landscape",
                               [UIImage imageNamed:@"page5VIPhone_fon.png"],@"image_IPhone_Portrait",
                               [UIImage imageNamed:@"page5GIPad_fon.png"],@"image_IPad_Landscape",
                               [UIImage imageNamed:@"page5VIPad_fon.png"],@"image_IPad_Portrait",
                               
                               [UIImage imageNamed:@"page5VIPhone_papa.png"],@"image1_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(20,0,166,269)),@"image1_IPhone_Portrait_Point",
                               [UIImage imageNamed:@"page5GIPhone_papa.png"],@"image1_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(61,-8,138,226)),@"image1_IPhone_Landscape_Point",
                               [UIImage imageNamed:@"page5VIPad_papa.png"],@"image1_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(60,34,373,603)),@"image1_IPad_Portrait_Point",
                               [UIImage imageNamed:@"page5GIPad_papa.png"],@"image1_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(121,0,332,538)),@"image1_IPad_Landscape_Point",
                               @"Zayec",@"image1_voiceName",

                               
                               [UIImage imageNamed:@"page5VIPhone_mama.png"],@"image2_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(135,52,160,211)),@"image2_IPhone_Portrait_Point",
                               [UIImage imageNamed:@"page5GIPhone_mama.png"],@"image2_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(151,40,142,161)),@"image2_IPhone_Landscape_Point",
                               [UIImage imageNamed:@"page5VIPad_mama.png"],@"image2_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(324,167,373,433)),@"image2_IPad_Portrait_Point",
                               [UIImage imageNamed:@"page5GIPad_mama.png"],@"image2_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(335,113,339,386)),@"image2_IPad_Landscape_Point",
                               @"Zayec",@"image2_voiceName",

                               
                               [UIImage imageNamed:@"page5VIPhone_3zaychik.png"],@"image3_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(32,147,89,124)),@"image3_IPhone_Portrait_Point",
                               [UIImage imageNamed:@"page5GIPhone_3zaychik.png"],@"image3_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(81,114,75,105)),@"image3_IPhone_Landscape_Point",
                               [UIImage imageNamed:@"page5VIPad_3zaychik.png"],@"image3_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(70,361,196,282)),@"image3_IPad_Portrait_Point",
                               [UIImage imageNamed:@"page5GIPad_3zaychik.png"],@"image3_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(173,265,196,282)),@"image3_IPad_Landscape_Point",
                               @"Zayec",@"image3_voiceName",

                               
                               [UIImage imageNamed:@"page5VIPhone_2zaychik.png"],@"image4_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(88,190,88,93)),@"image4_IPhone_Portrait_Point",
                               [UIImage imageNamed:@"page5GIPhone_2zaychik.png"],@"image4_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(139,141,76,78)),@"image4_IPhone_Landscape_Point",
                               [UIImage imageNamed:@"page5VIPad_2zaychik.png"],@"image4_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(210,462,195,209)),@"image4_IPad_Portrait_Point",
                               [UIImage imageNamed:@"page5GIPad_2zaychik.png"],@"image4_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(319,356,195,209)),@"image4_IPad_Landscape_Point",
                               @"Zayec",@"image4_voiceName",

                               
                               [UIImage imageNamed:@"page5VIPhone_1zaychik.png"],@"image5_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(202,140,87,129)),@"image5_IPhone_Portrait_Point",
                               [UIImage imageNamed:@"page5GIPhone_1zaychik.png"],@"image5_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(230,106,74,108)),@"image5_IPhone_Landscape_Point",
                               [UIImage imageNamed:@"page5VIPad_1zaychik.png"],@"image5_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(455,348,197,289)),@"image5_IPad_Portrait_Point",
                               [UIImage imageNamed:@"page5GIPad_1zaychik.png"],@"image5_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(531,240,197,289)),@"image5_IPad_Landscape_Point",
                               @"Zayec",@"image5_voiceName",

                               
                               [UIImage imageNamed:@""],@"image5_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image5_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image5_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image5_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Landscape_Point",
                               
                               [UIImage imageNamed:@""],@"image6_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image6_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image6_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image6_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPad_Landscape_Point",
                               
                               [UIImage imageNamed:@""],@"image7_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image7_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image7_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image7_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPad_Landscape_Point",
                               
                               @"05",@"page", nil];
        
        NSDictionary *page6 = [NSDictionary dictionaryWithObjectsAndKeys:
                               @"06",@"page",

                               [UIImage imageNamed:@"page6GIPhone_fon.png"],@"image_IPhone_Landscape",
                               [UIImage imageNamed:@"page6VIPhone_fon.png"],@"image_IPhone_Portrait",
                               [UIImage imageNamed:@"page6GIPad_fon.png"],@"image_IPad_Landscape",
                               [UIImage imageNamed:@"page6VIPad_fon.png"],@"image_IPad_Portrait",
                               
                               [UIImage imageNamed:@"page6VIPhone_zayac.png"],@"image1_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(126,0,177,253)),@"image1_IPhone_Portrait_Point",
                               [UIImage imageNamed:@"page6GIPhone_zayac.png"],@"image1_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(152,0,157,227)),@"image1_IPhone_Landscape_Point",
                               [UIImage imageNamed:@"page6VIPad_zayac.png"],@"image1_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(351,11,363,524)),@"image1_IPad_Portrait_Point",
                               [UIImage imageNamed:@"page6GIPad_zayac.png"],@"image1_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(420,-7,363,524)),@"image1_IPad_Landscape_Point",
                               @"Zayec",@"image1_voiceName",

                               
                               [UIImage imageNamed:@"page6VIPhone_muravey.png"],@"image2_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(31,172,59,52)),@"image2_IPhone_Portrait_Point",
                               [UIImage imageNamed:@"page6GIPhone_muravey.png"],@"image2_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(61,156,55,46)),@"image2_IPhone_Landscape_Point",
                               [UIImage imageNamed:@"page6VIPad_muravey.png"],@"image2_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(56,399,122,105)),@"image2_IPad_Portrait_Point",
                               [UIImage imageNamed:@"page6GIPad_muravey.png"],@"image2_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(125,381,122,105)),@"image2_IPad_Landscape_Point",
                               @"Muravey",@"image2_voiceName",

                               
                               [UIImage imageNamed:@""],@"image3_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image3_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image3_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image3_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPad_Landscape_Point",
                               
                               [UIImage imageNamed:@""],@"image4_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image4_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image4_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image4_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPad_Landscape_Point",
                               
                               [UIImage imageNamed:@""],@"image5_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image5_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image5_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image5_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Landscape_Point",
                               
                               [UIImage imageNamed:@""],@"image5_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image5_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image5_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image5_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Landscape_Point",
                               
                               [UIImage imageNamed:@""],@"image6_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image6_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image6_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image6_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPad_Landscape_Point",
                               
                               [UIImage imageNamed:@""],@"image7_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image7_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image7_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image7_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPad_Landscape_Point",
                               
                               @"06",@"page", nil];
        
        NSDictionary *page7 = [NSDictionary dictionaryWithObjectsAndKeys:
                               @"07",@"page",

                               [UIImage imageNamed:@"page7GIPhone_fon.png"],@"image_IPhone_Landscape",
                               [UIImage imageNamed:@"page7VIPhone_fon.png"],@"image_IPhone_Portrait",
                               [UIImage imageNamed:@"page7GIPad_fon.png"],@"image_IPad_Landscape",
                               [UIImage imageNamed:@"page7VIPad_fon.png"],@"image_IPad_Portrait",
                               
                               [UIImage imageNamed:@"page7VIPhone_zayac.png"],@"image1_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(12,44,238,146)),@"image1_IPhone_Portrait_Point",
                               [UIImage imageNamed:@"page7GIPhone_zayac.png"],@"image1_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(29,-9,238,146)),@"image1_IPhone_Landscape_Point",
                               [UIImage imageNamed:@"page7VIPad_zayac.png"],@"image1_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(26,32,581,354)),@"image1_IPad_Portrait_Point",
                               [UIImage imageNamed:@"page7GIPad_zaychik.png"],@"image1_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(65,-11,571,347)),@"image1_IPad_Landscape_Point",
                               @"Zayec",@"image1_voiceName",

                               
                               [UIImage imageNamed:@""],@"image2_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image2_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image2_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image2_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image2_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image2_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image2_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image2_IPad_Landscape_Point",
                               
                               [UIImage imageNamed:@""],@"image3_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image3_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image3_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image3_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPad_Landscape_Point",
                               
                               [UIImage imageNamed:@""],@"image4_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image4_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image4_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image4_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPad_Landscape_Point",
                               
                               [UIImage imageNamed:@""],@"image5_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image5_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image5_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image5_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Landscape_Point",
                               
                               [UIImage imageNamed:@""],@"image5_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image5_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image5_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image5_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Landscape_Point",
                               
                               [UIImage imageNamed:@""],@"image6_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image6_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image6_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image6_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPad_Landscape_Point",
                               
                               [UIImage imageNamed:@""],@"image7_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image7_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image7_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image7_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPad_Landscape_Point",
                               
                               @"07",@"page", nil];
        
        NSDictionary *page8 = [NSDictionary dictionaryWithObjectsAndKeys:
                               @"08",@"page",

                               [UIImage imageNamed:@"page8GIPhone_fon.png"],@"image_IPhone_Landscape",
                               [UIImage imageNamed:@"page8VIPhone_fon.png"],@"image_IPhone_Portrait",
                               [UIImage imageNamed:@"page8GIPad_fon.png"],@"image_IPad_Landscape",
                               [UIImage imageNamed:@"page8VIPad_fon.png"],@"image_IPad_Portrait",
                               
                               [UIImage imageNamed:@"page8VIPhone_medved.png"],@"image1_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(94,24,211,258)),@"image1_IPhone_Portrait_Point",
                               [UIImage imageNamed:@"page8GIPhone_medved.png"],@"image1_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(252,28,189,202)),@"image1_IPhone_Landscape_Point",
                               [UIImage imageNamed:@"page8VIPad_medved.png"],@"image1_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(265,55,468,554)),@"image1_IPad_Portrait_Point",
                               [UIImage imageNamed:@"page8GIPad_medved.png"],@"image1_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(497,38,439,540)),@"image1_IPad_Landscape_Point",
                               @"Medved",@"image1_voiceName",

                               
                               [UIImage imageNamed:@"page8VIPhone_soroka.png"],@"image2_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0,67,142,101)),@"image2_IPhone_Portrait_Point",
                               [UIImage imageNamed:@"page8GIPhone_soroka.png"],@"image2_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(66,28,140,101)),@"image2_IPhone_Landscape_Point",
                               [UIImage imageNamed:@"page8VIPad_soroka.png"],@"image2_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(7,132,313,227)),@"image2_IPad_Portrait_Point",
                               [UIImage imageNamed:@"page8GIPad_soroka.png"],@"image2_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(187,119,319,229)),@"image2_IPad_Landscape_Point",
                               @"Soroka",@"image2_voiceName",

                               
                               [UIImage imageNamed:@""],@"image3_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image3_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image3_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image3_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPad_Landscape_Point",
                               
                               [UIImage imageNamed:@""],@"image4_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image4_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image4_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image4_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPad_Landscape_Point",
                               
                               [UIImage imageNamed:@""],@"image5_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image5_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image5_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image5_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Landscape_Point",
                               
                               [UIImage imageNamed:@""],@"image5_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image5_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image5_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image5_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Landscape_Point",
                               
                               [UIImage imageNamed:@""],@"image6_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image6_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image6_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image6_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPad_Landscape_Point",
                               
                               [UIImage imageNamed:@""],@"image7_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image7_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image7_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image7_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPad_Landscape_Point",
                               
                               @"08",@"page", nil];
        
        NSDictionary *page9 = [NSDictionary dictionaryWithObjectsAndKeys:
                               @"09",@"page",

                               [UIImage imageNamed:@"page9GIPhone_fon.png"],@"image_IPhone_Landscape",
                               [UIImage imageNamed:@"page9VIPhone_fon.png"],@"image_IPhone_Portrait",
                               [UIImage imageNamed:@"page9GIPad_fon.png"],@"image_IPad_Landscape",
                               [UIImage imageNamed:@"page9VIPad_fon.png"],@"image_IPad_Portrait",
                               
                               [UIImage imageNamed:@"page9VIPhone_medved.png"],@"image1_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(123,0,191,317)),@"image1_IPhone_Portrait_Point",
                               [UIImage imageNamed:@"page9GIPhone_medved.png"],@"image1_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(210,0,209,261)),@"image1_IPhone_Landscape_Point",
                               [UIImage imageNamed:@"page9VIPad_medved.png"],@"image1_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(308, 0,446,749)),@"image1_IPad_Portrait_Point",
                               [UIImage imageNamed:@"page9GIPad_medved.png"],@"image1_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(433,0,502,620)),@"image1_IPad_Landscape_Point",
                               @"Medved",@"image1_voiceName",

                               
                               [UIImage imageNamed:@"page9VIPhone_zayac.png"],@"image2_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(7,100,163,197)),@"image2_IPhone_Portrait_Point",
                               [UIImage imageNamed:@"page9GIPhone_zayac.png"],@"image2_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(53,56,144,166)),@"image2_IPhone_Landscape_Point",
                               [UIImage imageNamed:@"page9VIPad_zayac.png"],@"image2_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(-3,219,381,452)),@"image2_IPad_Portrait_Point",
                               [UIImage imageNamed:@"page9GIPad_zayac.png"],@"image2_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(91,196,326,376)),@"image2_IPad_Landscape_Point",
                               @"Zayec",@"image2_voiceName",

                               
                               [UIImage imageNamed:@""],@"image3_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image3_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image3_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image3_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPad_Landscape_Point",
                               
                               [UIImage imageNamed:@""],@"image4_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image4_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image4_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image4_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPad_Landscape_Point",
                               
                               [UIImage imageNamed:@""],@"image5_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image5_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image5_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image5_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Landscape_Point",
                               
                               [UIImage imageNamed:@""],@"image5_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image5_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image5_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image5_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Landscape_Point",
                               
                               [UIImage imageNamed:@""],@"image6_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image6_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image6_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image6_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPad_Landscape_Point",
                               
                               [UIImage imageNamed:@""],@"image7_IPhone_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPhone_Portrait_Point",
                               [UIImage imageNamed:@""],@"image7_IPhone_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPhone_Landscape_Point",
                               [UIImage imageNamed:@""],@"image7_IPad_Portrait",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPad_Portrait_Point",
                               [UIImage imageNamed:@""],@"image7_IPad_Landscape",
                               NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPad_Landscape_Point",
                               
                               @"09",@"page", nil];
        NSDictionary *page10 = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"10",@"page",

                                [UIImage imageNamed:@"page10GIPhone_fon.png"],@"image_IPhone_Landscape",
                                [UIImage imageNamed:@"page10VIPhone_fon.png"],@"image_IPhone_Portrait",
                                [UIImage imageNamed:@"page10GIPad_fon.png"],@"image_IPad_Landscape",
                                [UIImage imageNamed:@"page10VIPad_fon.png"],@"image_IPad_Portrait",
                                
                                [UIImage imageNamed:@"page10VIPhone_medved.png"],@"image1_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(58,0,256,256)),@"image1_IPhone_Portrait_Point",
                                [UIImage imageNamed:@"page10GIPhone_medved.png"],@"image1_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(192, 0,283,242)),@"image1_IPhone_Landscape_Point",
                                [UIImage imageNamed:@"page10VIPhone_medved.png"],@"image1_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(174,0,583,582)),@"image1_IPad_Portrait_Point",
                                [UIImage imageNamed:@"page10GIPhone_medved.png"],@"image1_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(427,0,583,582)),@"image1_IPad_Landscape_Point",
                                @"Medved",@"image1_voiceName",

                                
                                [UIImage imageNamed:@"page10VIPhone_zayac.png"],@"image2_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(7,100,310,257)),@"image2_IPhone_Portrait_Point",
                                [UIImage imageNamed:@"page10GIPhone_zayac.png"],@"image2_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(86,7,308,254)),@"image2_IPhone_Landscape_Point",
                                [UIImage imageNamed:@"page10VIPad_zayac.png"],@"image2_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(-18,24,664,561)),@"image2_IPad_Portrait_Point",
                                [UIImage imageNamed:@"page10GIPad_zayac.png"],@"image2_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(138,4,719,600)),@"image2_IPad_Landscape_Point",
                                @"Zayec",@"image2_voiceName",

                                
                                [UIImage imageNamed:@""],@"image3_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image3_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image3_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image3_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPad_Landscape_Point",
                                
                                [UIImage imageNamed:@""],@"image4_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image4_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image4_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image4_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPad_Landscape_Point",
                                
                                [UIImage imageNamed:@""],@"image5_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image5_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image5_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image5_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Landscape_Point",
                                
                                [UIImage imageNamed:@""],@"image5_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image5_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image5_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image5_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Landscape_Point",
                                
                                [UIImage imageNamed:@""],@"image6_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image6_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image6_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image6_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPad_Landscape_Point",
                                
                                [UIImage imageNamed:@""],@"image7_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image7_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image7_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image7_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPad_Landscape_Point",
                                
                                @"10",@"page", nil];
        NSDictionary *page11 = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"11",@"page",

                                [UIImage imageNamed:@"page11GIPhone_fon.png"],@"image_IPhone_Landscape",
                                [UIImage imageNamed:@"page11VIPhone_fon.png"],@"image_IPhone_Portrait",
                                [UIImage imageNamed:@"page11GIPad_fon.png"],@"image_IPad_Landscape",
                                [UIImage imageNamed:@"page11VIPad_fon.png"],@"image_IPad_Portrait",
                                
                                [UIImage imageNamed:@"page11VIPhone_medved.png"],@"image1_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0,0,112,260)),@"image1_IPhone_Portrait_Point",
                                [UIImage imageNamed:@"page11GIPhone_medved.png"],@"image1_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0,0,153,250)),@"image1_IPhone_Landscape_Point",
                                [UIImage imageNamed:@"page11VIPad_medved.png"],@"image1_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0,0,257,590)),@"image1_IPad_Portrait_Point",
                                [UIImage imageNamed:@"page11GIPad_medved.png"],@"image1_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0,0,355,599)),@"image1_IPad_Landscape_Point",
                                @"Medved",@"image1_voiceName",

                                
                                [UIImage imageNamed:@"page11VIPhone_zaychiki.png"],@"image2_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(142,20,187,186)),@"image2_IPhone_Portrait_Point",
                                [UIImage imageNamed:@"page11GIPhone_zaychiki.png"],@"image2_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(206,-5,217,205)),@"image2_IPhone_Landscape_Point",
                                [UIImage imageNamed:@"page11VIPad_zaychiki.png"],@"image2_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(322,29,474,434)),@"image2_IPad_Portrait_Point",
                                [UIImage imageNamed:@"page11GIPad_zaychiki.png"],@"image2_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(420,36,478,434)),@"image2_IPad_Landscape_Point",
                                @"Zayec",@"image2_voiceName",

                                
                                [UIImage imageNamed:@""],@"image3_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image3_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image3_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image3_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPad_Landscape_Point",
                                
                                [UIImage imageNamed:@""],@"image4_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image4_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image4_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image4_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPad_Landscape_Point",
                                
                                [UIImage imageNamed:@""],@"image5_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image5_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image5_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image5_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Landscape_Point",
                                
                                [UIImage imageNamed:@""],@"image5_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image5_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image5_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image5_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Landscape_Point",
                                
                                [UIImage imageNamed:@""],@"image6_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image6_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image6_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image6_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPad_Landscape_Point",
                                
                                [UIImage imageNamed:@""],@"image7_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image7_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image7_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image7_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPad_Landscape_Point",
                                
                                @"11",@"page", nil];
        
        NSDictionary *page12 = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"12",@"page",

                                [UIImage imageNamed:@"page12GIPhone_fon.png"],@"image_IPhone_Landscape",
                                [UIImage imageNamed:@"page12VIPhone_fon.png"],@"image_IPhone_Portrait",
                                [UIImage imageNamed:@"page12GIPad_fon.png"],@"image_IPad_Landscape",
                                [UIImage imageNamed:@"page12VIPad_fon.png"],@"image_IPad_Portrait",
                                
                                [UIImage imageNamed:@"page12VIPhone_zaychiki.png"],@"image1_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(39,20,280,285)),@"image1_IPhone_Portrait_Point",
                                [UIImage imageNamed:@"page12GIPhone_zaychiki.png"],@"image1_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(96,-3,226,233)),@"image1_IPhone_Landscape_Point",
                                [UIImage imageNamed:@"page12VIPad_zaychiki.png"],@"image1_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(108,47,600,611)),@"image1_IPad_Portrait_Point",
                                [UIImage imageNamed:@"page12GIPad_zaychiki.png"],@"image1_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(172,0,566,583)),@"image1_IPad_Landscape_Point",
                                @"Zayec",@"image1_voiceName",

                                
                                [UIImage imageNamed:@""],@"image2_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image2_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image2_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image2_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image2_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image2_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image2_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image2_IPad_Landscape_Point",
                                
                                [UIImage imageNamed:@""],@"image3_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image3_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image3_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image3_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPad_Landscape_Point",
                                
                                [UIImage imageNamed:@""],@"image4_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image4_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image4_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image4_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPad_Landscape_Point",
                                
                                [UIImage imageNamed:@""],@"image5_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image5_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image5_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image5_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Landscape_Point",
                                
                                [UIImage imageNamed:@""],@"image5_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image5_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image5_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image5_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Landscape_Point",
                                
                                [UIImage imageNamed:@""],@"image6_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image6_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image6_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image6_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPad_Landscape_Point",
                                
                                [UIImage imageNamed:@""],@"image7_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image7_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image7_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image7_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPad_Landscape_Point",
                                
                                @"12",@"page", nil];
        
        NSDictionary *page13 = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"13",@"page",

                                [UIImage imageNamed:@"page13GIPhone_fon.png"],@"image_IPhone_Landscape",
                                [UIImage imageNamed:@"page13VIPhone_fon.png"],@"image_IPhone_Portrait",
                                [UIImage imageNamed:@"page13GIPad_fon.png"],@"image_IPad_Landscape",
                                [UIImage imageNamed:@"page13VIPad_fon.png"],@"image_IPad_Portrait",
                                
                                [UIImage imageNamed:@"page13VIPhone_medved.png"],@"image1_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(135,-10,179,250)),@"image1_IPhone_Portrait_Point",
                                [UIImage imageNamed:@"page13GIPhone_medved.png"],@"image1_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(212,-17,147,209)),@"image1_IPhone_Landscape_Point",
                                [UIImage imageNamed:@"page13VIPad_medved.png"],@"image1_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(335,-17,394,536)),@"image1_IPad_Portrait_Point",
                                [UIImage imageNamed:@"page13GIPad_medved.png"],@"image1_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(497,-30,340,482)),@"image1_IPad_Landscape_Point",
                                @"Medved",@"image1_voiceName",

                                
                                [UIImage imageNamed:@"page13VIPhone_zaychik.png"],@"image2_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(12,195,132,100)),@"image2_IPhone_Portrait_Point",
                                [UIImage imageNamed:@"page13GIPhone_zaychik.png"],@"image2_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(60,139,107,82)),@"image2_IPhone_Landscape_Point",
                                [UIImage imageNamed:@"page13VIPad_zaychik.png"],@"image2_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(74,420,272,214)),@"image2_IPad_Portrait_Point",
                                [UIImage imageNamed:@"page13GIPad_zaychik.png"],@"image2_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(156,335,272,214)),@"image2_IPad_Landscape_Point",
                                @"Zayec",@"image2_voiceName",

                                
                                [UIImage imageNamed:@""],@"image3_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image3_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image3_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image3_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPad_Landscape_Point",
                                
                                [UIImage imageNamed:@""],@"image4_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image4_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image4_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image4_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPad_Landscape_Point",
                                
                                [UIImage imageNamed:@""],@"image5_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image5_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image5_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image5_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Landscape_Point",
                                
                                [UIImage imageNamed:@""],@"image5_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image5_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image5_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image5_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Landscape_Point",
                                
                                [UIImage imageNamed:@""],@"image6_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image6_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image6_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image6_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPad_Landscape_Point",
                                
                                [UIImage imageNamed:@""],@"image7_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image7_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image7_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image7_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPad_Landscape_Point",
                                
                                @"13",@"page", nil];
        NSDictionary *page14 = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"14",@"page",

                                [UIImage imageNamed:@"page14GIPhone_fon.png"],@"image_IPhone_Landscape",
                                [UIImage imageNamed:@"page14VIPhone_fon.png"],@"image_IPhone_Portrait",
                                [UIImage imageNamed:@"page14GIPad_fon.png"],@"image_IPad_Landscape",
                                [UIImage imageNamed:@"page14VIPad_fon.png"],@"image_IPad_Portrait",
                                
                                [UIImage imageNamed:@"page14VIPhone_medved.png"],@"image1_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0,7,165,258)),@"image1_IPhone_Portrait_Point",
                                [UIImage imageNamed:@"page14GIPhone_medved.png"],@"image1_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0,0,206,228)),@"image1_IPhone_Landscape_Point",
                                [UIImage imageNamed:@"page14VIPad_medved.png"],@"image1_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0,-3,363,579)),@"image1_IPad_Portrait_Point",
                                [UIImage imageNamed:@"page14GIPad_medved.png"],@"image1_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0,-5,446,591)),@"image1_IPad_Landscape_Point",
                                @"Medved",@"image1_voiceName",

                                
                                [UIImage imageNamed:@"page14VIPhone_zaychik.png"],@"image2_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(164,175,90,103)),@"image2_IPhone_Portrait_Point",
                                [UIImage imageNamed:@"page14GIPhone_zaychik.png"],@"image2_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(244,115,93,105)),@"image2_IPhone_Landscape_Point",
                                [UIImage imageNamed:@"page14VIPad_zaychik.png"],@"image2_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(407,368,204,238)),@"image2_IPad_Portrait_Point",
                                [UIImage imageNamed:@"page14GIPad_zaychik.png"],@"image2_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(515,315,204,238)),@"image2_IPad_Landscape_Point",
                                @"Zayec",@"image2_voiceName",

                                
                                [UIImage imageNamed:@""],@"image3_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image3_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image3_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image3_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPad_Landscape_Point",
                                
                                [UIImage imageNamed:@""],@"image4_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image4_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image4_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image4_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPad_Landscape_Point",
                                
                                [UIImage imageNamed:@""],@"image5_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image5_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image5_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image5_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Landscape_Point",
                                
                                [UIImage imageNamed:@""],@"image5_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image5_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image5_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image5_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Landscape_Point",
                                
                                [UIImage imageNamed:@""],@"image6_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image6_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image6_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image6_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPad_Landscape_Point",
                                
                                [UIImage imageNamed:@""],@"image7_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image7_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image7_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image7_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPad_Landscape_Point",
                                
                                @"14",@"page", nil];
        NSDictionary *page15 = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"15",@"page",

                                [UIImage imageNamed:@"page15GIPhone_fon.png"],@"image_IPhone_Landscape",
                                [UIImage imageNamed:@"page15VIPhone_fon.png"],@"image_IPhone_Portrait",
                                [UIImage imageNamed:@"page15GIPad_fon.png"],@"image_IPad_Landscape",
                                [UIImage imageNamed:@"page15VIPad_fon.png"],@"image_IPad_Portrait",
                                
                                [UIImage imageNamed:@"page15VIPhone_medved.png"],@"image1_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,314,271)),@"image1_IPhone_Portrait_Point",
                                [UIImage imageNamed:@"page15GIPhone_medved.png"],@"image1_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,459,320)),@"image1_IPhone_Landscape_Point",
                                [UIImage imageNamed:@"page15VIPad_medved.png"],@"image1_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, -1,754,672)),@"image1_IPad_Portrait_Point",
                                [UIImage imageNamed:@"page15GIPad_medved.png"],@"image1_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,994,657)),@"image1_IPad_Landscape_Point",
                                @"Medved",@"image1_voiceName",

                                
                                [UIImage imageNamed:@""],@"image2_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image2_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image2_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image2_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image2_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image2_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image2_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image2_IPad_Landscape_Point",
                                
                                [UIImage imageNamed:@""],@"image3_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image3_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image3_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image3_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image3_IPad_Landscape_Point",
                                
                                [UIImage imageNamed:@""],@"image4_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image4_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image4_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image4_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image4_IPad_Landscape_Point",
                                
                                [UIImage imageNamed:@""],@"image5_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image5_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image5_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image5_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Landscape_Point",
                                
                                [UIImage imageNamed:@""],@"image5_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image5_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image5_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image5_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image5_IPad_Landscape_Point",
                                
                                [UIImage imageNamed:@""],@"image6_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image6_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image6_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image6_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image6_IPad_Landscape_Point",
                                
                                [UIImage imageNamed:@""],@"image7_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPhone_Portrait_Point",
                                [UIImage imageNamed:@""],@"image7_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPhone_Landscape_Point",
                                [UIImage imageNamed:@""],@"image7_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPad_Portrait_Point",
                                [UIImage imageNamed:@""],@"image7_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(0, 0,0,0)),@"image7_IPad_Landscape_Point",
                                
                                @"15",@"page", nil];
        NSDictionary *page16 = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"16",@"page",

                                [UIImage imageNamed:@"page16GIPhone_fon.png"],@"image_IPhone_Landscape",
                                [UIImage imageNamed:@"page16VIPhone_fon.png"],@"image_IPhone_Portrait",
                                [UIImage imageNamed:@"page16GIPad_fon.png"],@"image_IPad_Landscape",
                                [UIImage imageNamed:@"page16VIPad_fon.png"],@"image_IPad_Portrait",
                                
                                [UIImage imageNamed:@"page16VIPhone_lisa.png"],@"image1_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(0,28,160,205)),@"image1_IPhone_Portrait_Point",
                                [UIImage imageNamed:@"page16GIPhone_lisa.png"],@"image1_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(15,18,157,197)),@"image1_IPhone_Landscape_Point",
                                [UIImage imageNamed:@"page16VIPad_lisa.png"],@"image1_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(8,84,358,451)),@"image1_IPad_Portrait_Point",
                                [UIImage imageNamed:@"page16GIPad_lisa.png"],@"image1_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(9,90,358,451)),@"image1_IPad_Landscape_Point",
                                @"Lisica",@"image1_voiceName",

                                
                                [UIImage imageNamed:@"page16VIPhone_belka.png"],@"image2_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(129,61,129,139)),@"image2_IPhone_Portrait_Point",
                                [UIImage imageNamed:@"page16GIPhone_belka.png"],@"image2_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(220,48,124,137)),@"image2_IPhone_Landscape_Point",
                                [UIImage imageNamed:@"page16VIPad_belka.png"],@"image2_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(316,134,270,301)),@"image2_IPad_Portrait_Point",
                                [UIImage imageNamed:@"page16GIPad_belka.png"],@"image2_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(429,94,270,301)),@"image2_IPad_Landscape_Point",
                                @"Belka",@"image2_voiceName",

                                
                                [UIImage imageNamed:@"page16VIPhone_kuznechil.png"],@"image3_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(122,39,31,33)),@"image3_IPhone_Portrait_Point",
                                [UIImage imageNamed:@"page16GIPhone_kuznechik.png"],@"image3_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(180,25,32,29)),@"image3_IPhone_Landscape_Point",
                                [UIImage imageNamed:@"page16VIPad_kuznechil.png"],@"image3_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(609,231,92,61)),@"image3_IPad_Portrait_Point",
                                [UIImage imageNamed:@"page16GIPad_kuznechik.png"],@"image3_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(340,151,92,61)),@"image3_IPad_Landscape_Point",
                                @"Kuznechik",@"image3_voiceName",

                                
                                [UIImage imageNamed:@"page16VIPhone_soroka.png"],@"image4_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(201,0,113,91)),@"image4_IPhone_Portrait_Point",
                                [UIImage imageNamed:@"page16GIPhone_soroka.png"],@"image4_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(296,6,118,101)),@"image4_IPhone_Landscape_Point",
                                [UIImage imageNamed:@"page16VIPad_soroka.png"],@"image4_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(463,0,251,207)),@"image4_IPad_Portrait_Point",
                                [UIImage imageNamed:@"page16GIPad_soroka.png"],@"image4_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(639,13,251,207)),@"image4_IPad_Landscape_Point",
                                @"Soroka",@"image4_voiceName",

                                
                                [UIImage imageNamed:@"page16VIPhone_ezh.png"],@"image5_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(74,159,101,118)),@"image5_IPhone_Portrait_Point",
                                [UIImage imageNamed:@"page16GIPhone_ezh.png"],@"image5_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(158,93,92,113)),@"image5_IPhone_Landscape_Point",
                                [UIImage imageNamed:@"page16VIPad_ezh.png"],@"image5_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(180,392,211,266)),@"image5_IPad_Portrait_Point",
                                [UIImage imageNamed:@"page16GIPad_ezh.png"],@"image5_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(301,261,211,266)),@"image5_IPad_Landscape_Point",
                                @"Ezh",@"image5_voiceName",

                                
                                [UIImage imageNamed:@"page16VIPhone_zaychik.png"],@"image6_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(176,103,117,138)),@"image6_IPhone_Portrait_Point",
                                [UIImage imageNamed:@"page16GIPhone_zaychik.png"],@"image6_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(283,74,115,132)),@"image6_IPhone_Landscape_Point",
                                [UIImage imageNamed:@"page16VIPad_zaychik.png"],@"image6_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(419,274,251,292)),@"image6_IPad_Portrait_Point",
                                [UIImage imageNamed:@"page16GIPad_zaychik.png"],@"image6_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(572,228,251,292)),@"image6_IPad_Landscape_Point",
                                @"Zayec",@"image6_voiceName",

                                
                                [UIImage imageNamed:@"page16VIPhone_zhuk.png"],@"image7_IPhone_Portrait",
                                NSStringFromCGRect(CGRectMake(173,235,41,35)),@"image7_IPhone_Portrait_Point",
                                [UIImage imageNamed:@"page16GIPhone_zhuk.png"],@"image7_IPhone_Landscape",
                                NSStringFromCGRect(CGRectMake(233,187,42,32)),@"image7_IPhone_Landscape_Point",
                                [UIImage imageNamed:@"page16VIPad_zhuk.png"],@"image7_IPad_Portrait",
                                NSStringFromCGRect(CGRectMake(399,574,84,56)),@"image7_IPad_Portrait_Point",
                                [UIImage imageNamed:@"page16GIPad_zhuk.png"],@"image7_IPad_Landscape",
                                NSStringFromCGRect(CGRectMake(492,425,84,56)),@"image7_IPad_Landscape_Point",
                                @"Zhuk",@"image7_voiceName",

                                
                                
                                @"16",@"page", nil];
        
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
