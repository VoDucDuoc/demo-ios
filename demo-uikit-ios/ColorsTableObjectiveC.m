//
//  ViewController.m
//  demo-uikit-ios
//
//  Created by DuocVo on 3/24/23.
//

#import "ColorsTableObjectiveC.h"
#import "ColorsDetailObjectiveC.h"

@implementation ColorsTableObjectiveC

const NSString *COLORS_CELL = @"ColorCell";
const NSString *TO_DETAIL = @"ToColorsDetail";
@synthesize myTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addRandomColors];
    
    myTableView.dataSource = self;
    myTableView.delegate = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return colors.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: COLORS_CELL];
       if (!cell) {
           cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:COLORS_CELL];
       }
       UIColor *color = colors[[indexPath row]];
       cell.backgroundColor = color;
  
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        UIColor *color = colors[[indexPath row]];
        [self performSegueWithIdentifier:TO_DETAIL sender:color];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ToColorsDetail"])
    {
        ColorsDetailObjectiveC *dest = segue.destinationViewController;
        dest.color = sender;
    }
}

- (UIColor *)randomColor {
    CGFloat randomRed = drand48();
    CGFloat randomGreen = drand48();
    CGFloat randomBlue = drand48();
    UIColor *randomColor = [UIColor colorWithRed:randomRed green:randomGreen blue:randomBlue alpha:1];
    return randomColor;
}

- (void)addRandomColors{
    NSMutableArray<UIColor *> *initColors = [NSMutableArray<UIColor *> arrayWithArray: @[]];
    for (NSInteger i = 0; i <= 20; i++) {
        UIColor *randomColor = [self randomColor];
        NSLog(@"randomColor: %@",  randomColor);
        [initColors addObject:randomColor];
    }
    colors = initColors;
}

@end

