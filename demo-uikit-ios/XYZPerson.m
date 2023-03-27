//
//  XYZPerson.m
//  demo-uikit-ios
//
//  Created by DuocVo on 3/24/23.
//

#import <Foundation/Foundation.h>
#import "XYZPerson.h"
#import "XYZShoutingPerson.h"

@implementation XYZPerson

- (void)sayHello {
    
    [self print:@"hellooo worlddd!!!!"];
    
    int magicNumber = [self magicNumber];
    NSLog(@"magicNumber: %d", magicNumber);
    
    NSString *testString = @"Hello, world!";
    NSString *revisedString = [testString uppercaseString];
    [self print:revisedString];
    
    XYZShoutingPerson *xyzShoutingPerson = [XYZShoutingPerson new];
    [xyzShoutingPerson print:@"Hello shouting person!"];
    self.firstName = @"Johnny";
    [self print:self.firstName];
}

- (void)print:(NSString *)text {
    NSLog(@"%@", text);
}

- (int)magicNumber {
    return 42;
}

@end
