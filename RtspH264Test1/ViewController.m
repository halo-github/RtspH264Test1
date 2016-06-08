//
//  ViewController.m
//  RtspH264Test1
//
//  Created by Fenix on 16/5/3.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import "ViewController.h"
#import "NetStream.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NetStream *stream = [[NetStream alloc] initStreamWithHost:@"224.1.2.3" Port:8888];
    NSLog(@"ss");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
