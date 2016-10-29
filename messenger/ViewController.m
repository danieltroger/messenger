//
//  ViewController.m
//  messenger
//
//  Created by Second Admin on 2013-02-18.
//  Copyright (c) 2013 dt. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController  
 -(IBAction) hide
{
    [from resignFirstResponder];
    [to resignFirstResponder];
    [message resignFirstResponder];
    [sub resignFirstResponder];
}
-(IBAction) send
{
    NSString *fromc = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,(__bridge CFStringRef) from.text, NULL,CFSTR("!*'();:@&=+$,/?%#[]"),kCFStringEncodingUTF8));
     NSString *toc = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,(__bridge CFStringRef) to.text, NULL,CFSTR("!*'();:@&=+$,/?%#[]"),kCFStringEncodingUTF8));
     NSString *msgc = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,(__bridge CFStringRef) message.text, NULL,CFSTR("!*'();:@&=+$,/?%#[]"),kCFStringEncodingUTF8));
     NSString *subc = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,(__bridge CFStringRef) sub.text, NULL,CFSTR("!*'();:@&=+$,/?%#[]"),kCFStringEncodingUTF8));
    NSString *phpScript = [NSString stringWithFormat: @"http://192.168.178.43/sendmail.php?from=%@&to=%@&msg=%@&sub=%@",fromc,toc,msgc,subc];
   /* phpScript = [phpScript stringByReplacingOccurrencesOfString:@"\n"
                                                     withString:@"%0D%0A"];*/
    
        NSLog(@"%@",phpScript);
    NSURL *phpURL = [NSURL URLWithString:phpScript];
    NSString *content = [NSString stringWithContentsOfURL:phpURL encoding:NSASCIIStringEncoding error:nil];
    UIAlertView *al = [UIAlertView alloc];
    [al initWithTitle:@"" message:@"Success!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [al show];
   /* if([content isEqualToString:@"1"])
    {
        UIAlertView *al = [UIAlertView alloc];
        [al initWithTitle:@"" message:@"Success!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [al show];
    }
    else
    {
        UIAlertView *al = [UIAlertView alloc];
        [al initWithTitle:@"" message:@"Failure" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [al show];
    }*/
    NSLog(@"%@",content);
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
