//
//  GRViewController.m
//  GitReference
//
//  Created by Michael Sacks on 4/27/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "GRViewController.h"

static CGFloat heightForLabel = 20;
static CGFloat margin = 15;
static NSString * const Command = @"command";
static NSString * const Reference = @"reference";

@interface GRViewController ()

@end

@implementation GRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    CGFloat screenWidth = CGRectGetWidth(self.view.frame);
    
    UIScrollView *scrollView1 = [UIScrollView new];
    scrollView1.frame = CGRectMake(15, 20, screenWidth - 30, 520);
    CGSize contentSize = CGSizeMake(screenWidth - 30, 650);
    scrollView1.contentSize = contentSize;
    scrollView1.backgroundColor = [UIColor redColor];
    [self.view addSubview:scrollView1];
    
    CGFloat widthMinusMargin = self.view.frame.size.width - 2 * margin;
    
    UILabel *scrollHeader = [UILabel new];
    scrollHeader.frame = CGRectMake(10, 10, screenWidth-50, 40);
    scrollHeader.backgroundColor = [UIColor greenColor];
    scrollHeader.text = @"GitReference";
    scrollHeader.textAlignment = 1;
    [scrollView1 addSubview:scrollHeader];
    
    CGFloat top = 20 + heightForLabel + margin * 2;
    
    for (NSDictionary *i in [self gitCommands]) {
        NSString *command = i[Command];
        NSString *reference = i[Reference];
        
        
        UILabel *gitCommand = [[UILabel alloc]initWithFrame:CGRectMake(margin, top, widthMinusMargin, heightForLabel)];
        gitCommand.text = command;
        gitCommand.font = [UIFont systemFontOfSize:17];
        [scrollView1 addSubview:gitCommand];
        
        top += (heightForLabel + margin);
        
        CGFloat heightForReference = [self heightOfReferenceString:reference];
        
        UILabel *gitReference = [[UILabel alloc]initWithFrame:CGRectMake(margin, top, widthMinusMargin, heightForReference)];
        gitReference.numberOfLines = 0;
        gitReference.text = reference;
        gitReference.font = [UIFont systemFontOfSize:15];
        [scrollView1 addSubview:gitReference];
        
        top += (heightForReference + margin * 2);
        
    }
}


- (NSArray *)gitCommands {
    
    return @[@{Command: @"git status", Reference: @": shows changed files"},
             @{Command: @"git diff", Reference: @": shows actual changes"},
             @{Command: @"git add .", Reference: @": adds changed files to the commit"},
             @{Command: @"git commit -m \"notes\"", Reference: @": commits the changes"},
             @{Command: @"git push origin _branch_", Reference: @": pushes commits to branch named _branch_"},
             @{Command: @"git log", Reference: @": displays progress log"},
             @{Command: @"git comment --amend", Reference: @": re-enter last commit message"}
             ];
    
}

- (CGFloat)heightOfReferenceString:(NSString *)reference {
    
    CGRect bounding = [reference boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin, 0)
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}
                                              context:nil];
    
    return bounding.size.height;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
