//
//  MainViewController.m
//  Week2HW
//
//  Created by Yaron Sole on 6/15/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "MainViewController.h"
#import "FeedViewController.h"

@interface MainViewController ()
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (strong, nonatomic) IBOutlet UIButton *logInButton;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *loadingView;
@property (nonatomic, assign) BOOL loading;
@property (strong, nonatomic) IBOutlet UITextField *passwordBox;
@property (strong, nonatomic) IBOutlet UITextField *userBox;
@property (strong, nonatomic) IBOutlet UILabel *UserLabel;
@property (strong, nonatomic) IBOutlet UILabel *PassLabel;

- (IBAction)OnTap:(id)sender;
- (IBAction)touchUpInside:(id)sender;
- (IBAction)userEditingChanged:(id)sender;
- (IBAction)passEditingChanged:(id)sender;
- (IBAction)userTouchUpInside:(id)sender;

- (void)checkResponse;



@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.logInButton.enabled = NO;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)OnTap:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)touchUpInside:(id)sender {
    [self.spinner startAnimating];
    [self performSelector:@selector(checkResponse) withObject:nil afterDelay:2];
    self.logInButton.selected = !self.logInButton.selected;
    
}

- (void)checkResponse {
    [self.spinner stopAnimating];
    if ([self.passwordBox.text isEqualToString:@"password"]) {
        UIViewController *feedViewController = [[FeedViewController alloc] init];
        feedViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:feedViewController animated:YES completion:nil];
    } else {
        
        UIAlertView *errorView = [[UIAlertView alloc] initWithTitle:@"Password Incorrect" message:@"The password you entered is incorrect. Please try again." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [errorView show];
        self.logInButton.selected = !self.logInButton.selected;
        
    }
}

- (IBAction)userEditingChanged:(id)sender {
    if ([self.userBox.text isEqualToString:@""] && [self.passwordBox.text isEqualToString:@""]) {
        self.logInButton.enabled = NO;
        self.UserLabel.text = [NSString stringWithFormat:@"Email or phone number"];
        
    } else if ([self.userBox.text isEqualToString:@""]) {
        self.UserLabel.text = [NSString stringWithFormat:@"Email or phone number"];
    } else {
        self.UserLabel.text = [NSString stringWithFormat:@""];
        self.logInButton.enabled = YES;
    }
    
}

- (IBAction)passEditingChanged:(id)sender {
    if ([self.userBox.text isEqualToString:@""] && [self.passwordBox.text isEqualToString:@""]) {
        self.logInButton.enabled = NO;
        self.PassLabel.text = [NSString stringWithFormat:@"Password"];
    } else if ([self.passwordBox.text isEqualToString:@""]) {
        self.PassLabel.text = [NSString stringWithFormat:@"Password"];
    } else {
        self.PassLabel.text = [NSString stringWithFormat:@""];
        self.logInButton.enabled = YES;
    }
}

- (IBAction)userTouchUpInside:(id)sender {
}




@end








