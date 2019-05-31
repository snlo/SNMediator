//
//  ViewController.m
//  SNMediator
//
//  Created by snlo on 2018/5/7.
//  Copyright © 2018年 snlo. All rights reserved.
//

#import "ViewController.h"

#import "SNMediatorKit.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"SNMediator";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 14, 0, 0); //设置分割线缩颈
    self.tableView.separatorColor = [UIColor grayColor];
}

#pragma mark -- <UITableViewDelegate, UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString * identifier = NSStringFromClass([self class]);
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        [tableView registerClass:cell.class forCellReuseIdentifier:identifier];
    }
    
    switch (indexPath.row) {
        case 0: {
            cell.textLabel.text = @"OC_mediator";
        } break;
        case 1: {
            cell.textLabel.text = @"Swift_mediator";
        } break;
        default: break;
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 48;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIViewController * viewController = [UIViewController new];
    
    switch (indexPath.row) {
        case 0: {
            viewController =
            [SNMediator sn_Module:@"kTest" url:nil action:@"nativeTestViewController" params:@{} cacheTarget:NO];
        } break;
        case 1: {
            viewController =
            [SNMediator sn_Module:@"kTestSwift" url:nil action:@"nativeFetchSwiftViewController" params:@{} cacheTarget:NO];
        } break;
        default: break;
    }
    [self.navigationController pushViewController:viewController animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



@end
