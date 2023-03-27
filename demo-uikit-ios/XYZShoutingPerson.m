//
//  XYZShoutingPerson.m
//  demo-uikit-ios
//
//  Created by DuocVo on 3/24/23.
//

#import <Foundation/Foundation.h>
#import "XYZShoutingPerson.h"
@implementation XYZShoutingPerson

-(void)print:(NSString *)text {
//    NSLog(@"zzzz: %@", text);
    [super print:text]; //super will call method print on XYZPerson
}

@end
