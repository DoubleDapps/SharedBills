//
//  NewTransViewController.h
//  SharedBills
//
//  Created by Doug Friedman on 8/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatePickerController.h"


@interface NewTransViewController : UITableViewController <UITextFieldDelegate, DatePickerControllerDelegate> {
        
    NSMutableString *storedValue;
    
    }

@property (nonatomic, retain) NSMutableString *storedValue;

-(NSString*) formatCurrencyValue:(double)value;

@end
