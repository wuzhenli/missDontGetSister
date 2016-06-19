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

@property (weak, nonatomic) IBOutlet UITextField *nameField;


@property (weak, nonatomic) IBOutlet UITextField *pwdField;
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
}

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

















