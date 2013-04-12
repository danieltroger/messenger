//
//  ViewController.h
//  messenger
//
//  Created by Second Admin on 2013-02-18.
//  Copyright (c) 2013 dt. All rights reserved.
//

#import <UIKit/UIKit.h>
//NSString *phpScript;
//NSURL *phpURL;
//NSString *content;
@interface ViewController : UIViewController
{
    IBOutlet UITextField *from;
    IBOutlet UITextField *sub;
    IBOutlet UITextField *to;
    IBOutlet UILabel *extras;
    IBOutlet UITextView *message;
    IBOutlet UIButton *sendbut;
    IBOutlet UIButton *hidebut;
}
 -(IBAction) send;
 -(IBAction) hide;

@end
