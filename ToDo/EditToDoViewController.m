//
//  EditToDoViewController.m
//  ToDo
//
//  Created by Neil de Carteret on 28/07/2016.
//  Copyright © 2016 Neil de Carteret. All rights reserved.
//

#import "EditToDoViewController.h"
#import "ToDoModel.h"

@interface EditToDoViewController ()

@property IBOutlet UITextField *textField;
@property IBOutlet UISwitch *completeSwitch;

@end

@implementation EditToDoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationItem.title = @"Edit";
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Save"
                                   style:UIBarButtonItemStylePlain
                                   target:self
                                   action:@selector(saveClicked:)];
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]
                                     initWithTitle:@"Cancel"
                                     style:UIBarButtonItemStylePlain
                                     target:self
                                     action:@selector(cancelClicked:)];
    self.navigationItem.leftBarButtonItem = cancelButton;
    self.navigationItem.rightBarButtonItem = saveButton;
    self.textField.delegate = self;
    self.textField.text = self.todo.title;
    [self.textField becomeFirstResponder];
    [self.completeSwitch setOn:self.todo.complete animated:NO];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelClicked:(id)sender;
{
    //[self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)saveClicked:(id)sender;
{
    self.todo.title = self.textField.text;
    self.todo.complete = [self.completeSwitch isOn];
    [self.delegate saveToDo:self.todo];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self saveClicked:textField];
    return NO;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
