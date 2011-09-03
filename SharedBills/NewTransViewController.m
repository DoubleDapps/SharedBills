//
//  NewTransViewController.m
//  SharedBills
//
//  Created by Doug Friedman on 8/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NewTransViewController.h"

@implementation NewTransViewController

@synthesize storedValue;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    storedValue = [[NSMutableString alloc] initWithCapacity:4];
    [storedValue setString:@""];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
   if (section == 0){
        return 3;
    
   }else{
     return 3;

    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell;
    
    if (indexPath.section == 0){
        if (indexPath.row == 0) {
            
            CGRect CellFrame = CGRectMake(0, 0, 300, 44);
            CGRect textFrame = CGRectMake(10, 10, 290, 34);
            
            cell = [[[UITableViewCell alloc] initWithFrame:CellFrame] autorelease];
            
            UITextField *textView;
            textView = [[UITextField alloc] initWithFrame:textFrame];
            textView.tag = 1;
            textView.placeholder = @"Title";
            textView.delegate = self;
            textView.clearButtonMode = true;
            
            [cell.contentView addSubview:textView];
        }else if (indexPath.row == 1) {
            
            CGRect CellFrame = CGRectMake(0, 0, 300, 44);
            CGRect textFrame = CGRectMake(10, 10, 290, 34);
            
            cell = [[[UITableViewCell alloc] initWithFrame:CellFrame] autorelease];
            
            UITextField *textView;
            textView = [[UITextField alloc] initWithFrame:textFrame];
            textView.tag = 2;
            textView.placeholder = @"$0.00";
            textView.delegate = self;
            textView.clearButtonMode = true;
            textView.keyboardType = UIKeyboardTypeNumberPad;
            
            [cell.contentView addSubview:textView];
        }else{
            CGRect CellFrame = CGRectMake(0, 0, 300, 44);
            
              cell = [[[UITableViewCell alloc] initWithFrame:CellFrame] autorelease];
        
        }
        
        }else{
            CGRect CellFrame = CGRectMake(0, 0, 300, 44);
                        
              cell = [[[UITableViewCell alloc] initWithFrame:CellFrame] autorelease];
        
        }
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
    UITableViewCell *cell = (UITableViewCell *)[(UITableView *)self.view cellForRowAtIndexPath:indexPath];
    UITextField *txtFld = cell.contentView.subviews.lastObject;
    NSString *content = txtFld.text;
    
    NSLog(@"Selected %@",content);
}

#pragma mark - textview delagate
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    [theTextField resignFirstResponder];
    return TRUE;
}

- (BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([textField tag] == 2) //Amount Field
    {
        if ([string isEqualToString:@""] && range.length == 1) { 
            //backspace key pressed
            [storedValue deleteCharactersInRange:NSMakeRange(storedValue.length-1 ,1)]; 
        }
        else{
            //number key pressed
            [storedValue appendString:string];
        }
        //update label either way
        NSString *newAmount = [self formatCurrencyValue:([storedValue doubleValue]/100)];
        [textField setText:[NSString stringWithFormat:@"%@",newAmount]];
        return NO;
    }
    //Returning yes allows the entered chars to be processed
    return YES;
}

-(NSString*) formatCurrencyValue:(double)value
{
    NSNumberFormatter *numberFormatter = [[[NSNumberFormatter alloc] init]autorelease];
    [numberFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
    [numberFormatter setCurrencySymbol:@"$"];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    
    NSNumber *c = [NSNumber numberWithFloat:value];
    return [numberFormatter stringFromNumber:c];
}


@end
