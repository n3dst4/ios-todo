//
//  EditToDoViewController.h
//  ToDo
//
//  Created by Neil de Carteret on 28/07/2016.
//  Copyright © 2016 Neil de Carteret. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "ToDoModel.h"

@class ToDoModel;

@protocol EditToDoViewControllerDelegate <NSObject>

- (void) saveToDo:(ToDoModel *)todo;

@end


@interface EditToDoViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) id<EditToDoViewControllerDelegate> delegate;
@property (strong, nonatomic) ToDoModel * todo;

- (IBAction)cancelClicked:(id)sender;
- (IBAction)saveClicked:(id)sender;

@end
