//
//  ColorsTableObjectiveC.h
//  demo-uikit-ios
//
//  Created by DuocVo on 3/28/23.
//

#import <UIKit/UIKit.h>

@interface ColorsTableObjectiveC :UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray<UIColor *> *colors;
}
@property (nonatomic, strong) IBOutlet UITableView *myTableView;
@end

