//
//  JLLoginViewController.m
//  百思不得姐
//
//  Created by kfz on 16/6/19.
//  Copyright © 2016年 kongfz. All rights reserved.
//

#import "JLLoginViewController.h"

@interface JLLoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *regiserButton;

@property (weak, nonatomic) IBOutlet UITextField *nameField;


@property (weak, nonatomic) IBOutlet UITextField *pwdField;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *registerCenterX;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginCenterX;

@end

@implementation JLLoginViewController

- (instancetype)initWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundle {
    NSString *nName = NSStringFromClass([self class]);
    if ( self = [super initWithNibName:nName bundle:nibBundle]) {
        ;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
}
- (void)setUp {
    self.loginButton.layer.cornerRadius = 5;
    self.loginButton.clipsToBounds = YES;
    self.regiserButton.layer.cornerRadius = 5;
    self.regiserButton.clipsToBounds = YES;
    //

}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)loginOrRegister:(UIButton *)sender {
    NSString *title = sender.currentTitle;
    CGFloat loginCenterX = 0.;
    CGFloat registerCenterX = 0.;
    if ( [title isEqualToString:@"注册"] ) {
        [sender setTitle:@"登录" forState:UIControlStateNormal];
        loginCenterX = -SC_Width;
        registerCenterX = 0;
    }else {
        [sender setTitle:@"注册" forState:UIControlStateNormal];
        loginCenterX = 0;
        registerCenterX = SC_Width;
    }
    self.loginCenterX.constant = loginCenterX;
    self.registerCenterX.constant = registerCenterX;
    [UIView animateWithDuration:0.25 animations:^{
            [self.view layoutIfNeeded];
    }];
    
}

@end

















