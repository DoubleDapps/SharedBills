//
//  DatePickerController.h
//  SharedBills
//
//  Created by Donny Amfahr on 9/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DatePickerController;
@protocol DatePickerControllerDelegate
- (void) datePickerController:(DatePickerController *)controller didPickDate:(NSDate *)date;
@end

@interface DatePickerController : UIViewController {
    UIDatePicker *datePicker;
    NSObject <DatePickerControllerDelegate> *delegate;
}

@property (nonatomic, retain) UIDatePicker *datePicker;
@property (nonatomic, assign) NSObject <DatePickerControllerDelegate> *delegate;
@end