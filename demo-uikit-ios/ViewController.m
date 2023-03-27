//
//  ViewController.m
//  demo-uikit-ios
//
//  Created by DuocVo on 3/24/23.
//

#import "ViewController.h"
#import "XYZPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    XYZPerson *xyzPerson = [XYZPerson new];
    [xyzPerson sayHello];
}

- (IBAction)tapped:(UIButton *)sender
{
    NSLog(@"helllo");
    [self performSegueWithIdentifier:@"ToColorsDetail" sender:nil];
}




@end
