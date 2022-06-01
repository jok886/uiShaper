//
//  ViewController.m
//  UIShapLayer画图
//
//  Created by 刘忠华 on 2022/1/28.
//

#import "ViewController.h"
#import "DashboardView.h"

#import "CircleIndicatorView.h"
#import "WMGaugeView.h"

//#import "UIView+Extension.h"
///转换成角度
#define RADIANS_TO_DEGREES(x) ((x)/M_PI*180.0)
#define DEGREES_TO_RADIANS(x) ((x)/180.0*M_PI)
@interface ViewController ()
 /**仪表盘view*/
@property (nonatomic, strong) DashboardView *dashboardView;
/**电量**/
@property (nonatomic, assign) NSInteger batteryValue;

@property (nonatomic,assign) CGFloat lastRotation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
  /*  self.dashboardView.touchEndBlock = ^(NSInteger indicatorValue){
        NSLog(@"触摸结束，%ld", indicatorValue);
    };
    [self.view addSubview:self.dashboardView];
    
    self.batteryValue = 50;
    [self updateBatteryValue];*/
    

    
    CGFloat baseViewWidth = 300;
    CGFloat baseViewHeight = 300;
    CGFloat baseViewX = (self.view.frame.size.width - baseViewWidth)/2;
    CGFloat baseViewY = 100;
    CircleIndicatorView * ccView = [[CircleIndicatorView alloc] initWithFrame:CGRectMake(baseViewX, baseViewY, baseViewWidth, baseViewHeight)];
    
    ccView.minValue = 0;
    ccView.maxValue = 180;
    ccView.innerAnnulusValueToShowArray = @[@0, @30,@60, @90,@120, @150,@180];
    ccView.indicatorValue = 0;
    
    ccView.touchEndBlock = ^(NSInteger indicatorValue){
        NSLog(@"触摸结束，%ld", indicatorValue);
    };
    [self.view addSubview:ccView];
    
  /*  WMGaugeView *_runningSpeedGaugeView =  [[WMGaugeView alloc]initWithFrame:CGRectMake(20, 100, 300, 300)];
    [self.view addSubview:_runningSpeedGaugeView];
    _runningSpeedGaugeView.userInteractionEnabled = YES;
    _runningSpeedGaugeView.minValue = 0.0;
    _runningSpeedGaugeView.maxValue = 160.0;
    _runningSpeedGaugeView.scaleDivisions = 8.0;
    _runningSpeedGaugeView.scaleSubdivisions = 5.0;
    _runningSpeedGaugeView.scaleStartAngle = 75.0;
    _runningSpeedGaugeView.scaleEndAngle = 285.0;
    _runningSpeedGaugeView.rangeValues = @[@30, @60, @90, @120, @160.0];
    _runningSpeedGaugeView.rangeColors = @[RGB2(255, 255, 255), RGB2(232, 111, 33), RGB2(232, 231, 33), RGB2(27, 202, 33), RGB2(231, 32, 43)];
    */
    
    
    
    
    
    
    
    
    
}

// 旋转
-(void)rotate:(UIRotationGestureRecognizer *)sender

{
   if([(UIRotationGestureRecognizer*)sender state] == UIGestureRecognizerStateEnded)
   {
       _lastRotation = 0.0;
       return;
    }

    CGFloat rotation = 0.0 - (_lastRotation - [(UIRotationGestureRecognizer*)sender rotation]);
    NSLog(@"%f",rotation);
    
    
    //CGAffineTransform currentTransform = photoImage.transform;
    //CGAffineTransform newTransform = CGAffineTransformRotate(currentTransform,rotation);

   //  [photoImage setTransform:newTransform];
    _lastRotation = [(UIRotationGestureRecognizer*)sender rotation];
   // [self showOverlayWithFrame:photoImage.frame];
    
    
}



- (void)singleTap:(UITapGestureRecognizer *)recognizer {
    
    double dx,dy;
    CGPoint location = [recognizer locationInView:self.view];
   // turret.transform=CGAffineTransformIdentity;
   // bullet.transform=CGAffineTransformIdentity;
   // bullet.center=turret.center;
    if (location.x < 160)
    {
     //   dx=turret.center.x-location.x;
     //   dy=turret.center.y-location.y;
        //if user touched greater than 180
    }
    else if (location.x > 160)
    {
       // dx=location.x-turret.center.x;
       // dy=location.y-turret.center.y;
        //if user touched less than 180
    }
    
    
    
    
    
}
-(void)updateBatteryValue{
    CGFloat angle = ((CGFloat)self.batteryValue/100 - 0.5) * DEGREES_TO_RADIANS(270);
    //指针转动角度
    self.dashboardView.pointerView.transform = CGAffineTransformMakeRotation(angle);
    self.dashboardView.infoLabel.text = [NSString stringWithFormat:@"%ld%%",self.batteryValue];
    self.dashboardView.currentScore = self.batteryValue;
}

- (DashboardView *)dashboardView {
    if (!_dashboardView) {
        CGFloat baseViewWidth = 220;
        CGFloat baseViewHeight = baseViewWidth;
        CGFloat baseViewX = (self.view.frame.size.width - baseViewWidth)/2;
        CGFloat baseViewY = 100;
        _dashboardView = [[DashboardView alloc] initWithFrame:CGRectMake(baseViewX, baseViewY, baseViewWidth, baseViewHeight)];
        _dashboardView.backgroundColor = [UIColor blackColor];
    }
    return _dashboardView;
}

@end
