//
//  ToDoListViewControllerTableViewController.m
//  ToDo
//
//  Created by Neil de Carteret on 27/07/2016.
//  Copyright © 2016 Neil de Carteret. All rights reserved.
//

#import "ToDoListTableViewController.h"
#import "ToDoModel.h"
#import "EditToDoViewController.h"

@interface ToDoListTableViewController ()

@property (strong, nonatomic) NSString *cellIdentifier;

@property (strong, atomic) NSArray *todos;

@property BOOL isEditMode;

@property NSUInteger editingIndex;

@end

@implementation ToDoListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.cellIdentifier = @"cellywelly";
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:self.cellIdentifier];
    self.navigationItem.title = @"To Do";
    self.todos = @[
                   [[ToDoModel alloc] initWithTitle:@"First things first" complete:NO],
                   [[ToDoModel alloc] initWithTitle:@"And another thing" complete:NO],
                   [[ToDoModel alloc] initWithTitle:@"And finally" complete:NO],
                   ];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                  target:self
                                  action:@selector(addClicked:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.navigationController.view.backgroundColor = [UIColor whiteColor];
    
    self.isEditMode = NO;
}

- (void) addClicked:(id)sender; {
    EditToDoViewController * editor = [[EditToDoViewController alloc]
                                       initWithNibName:@"EditToDoViewController"
                                       bundle:[NSBundle mainBundle]];
    editor.delegate = self;
    editor.todo = [[ToDoModel alloc] initWithTitle:@"" complete:NO];
    //[self presentViewController:editor animated:YES completion:nil];
    [self.navigationController pushViewController:editor animated:YES];
    
}

- (void) saveToDo:(ToDoModel *)todo;
{
    if (self.isEditMode) {
        NSMutableArray *mut = [NSMutableArray arrayWithArray:self.todos];
        [mut replaceObjectAtIndex:self.editingIndex withObject:todo];
        self.todos = [mut copy];
    }
    else {
        self.todos = [self.todos arrayByAddingObject:todo];
    }
    self.isEditMode = NO;
    [self.navigationController popViewControllerAnimated:YES];
    [self.tableView reloadData];
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EditToDoViewController * editor = [[EditToDoViewController alloc]
                                       initWithNibName:@"EditToDoViewController"
                                       bundle:[NSBundle mainBundle]];
    editor.delegate = self;
    editor.todo = [self.todos[indexPath.row] copy];
    self.isEditMode = YES;
    self.editingIndex = indexPath.row;
    //[self presentViewController:editor animated:YES completion:nil];
    [self.navigationController pushViewController:editor animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.todos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    ToDoModel *todo = self.todos[indexPath.row];
    cell.textLabel.text = todo.complete? [NSString stringWithFormat:@"COMPLETE: %@", todo.title] : todo.title;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
