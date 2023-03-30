//
//  ColorsDetailObjectiveC.m
//  demo-uikit-ios
//
//  Created by DuocVo on 3/30/23.
//

#import "ColorsDetailObjectiveC.h"

@implementation ColorsDetailObjectiveC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = self.color ? self.color : [UIColor redColor];
}

@end
