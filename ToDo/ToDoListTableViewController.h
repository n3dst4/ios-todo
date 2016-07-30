//
//  ToDoListViewControllerTableViewController.h
//  ToDo
//
//  Created by Neil de Carteret on 27/07/2016.
//  Copyright © 2016 Neil de Carteret. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditToDoViewController.h"

@interface ToDoListTableViewController : UITableViewController <EditToDoViewControllerDelegate>

- (void) addClicked:(id)sender;

@end
