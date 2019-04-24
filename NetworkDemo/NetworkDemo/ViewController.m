//
//  ViewController.m
//  NetworkDemo
//
//  Created by JETS Mobile Lab-12 on 4/22/19.
//  Copyright © 2019 ITI. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)sync:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)async:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController{
    NSMutableData *dataReceived;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    dataReceived = [NSMutableData new];
}


- (IBAction)sync:(UIButton *)sender {
    NSURL *url =[NSURL URLWithString:@"https://www.google.com/"];
    NSString *str =[[NSString alloc] initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    
    
}

- (IBAction)async:(UIButton *)sender {
    NSURL *url =[NSURL URLWithString:@"https://www.google.com/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
    [_webView loadRequest:request];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
//    NSString *str =[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    [dataReceived appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSString *str =[[NSString alloc] initWithData:dataReceived encoding:NSUTF8StringEncoding];
    
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    
}
@end
