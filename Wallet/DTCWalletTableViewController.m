//
//  DTCWalletTableViewController.m
//  Wallet
//
//  Created by David de Tena on 07/06/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import "DTCWalletTableViewController.h"
#import "DTCWallet.h"

@interface DTCWalletTableViewController ()
@property (nonatomic,strong) DTCWallet *model;
@end

@implementation DTCWalletTableViewController

#pragma mark - Init
- (id) initWithModel:(DTCWallet *) wallet{
    if(self = [super initWithStyle:UITableViewStylePlain]){
        _model = wallet;
    }
    return self;
}

#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


#pragma mark - Memory
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        // Euros section
        return [self.model countEuros] + 1;
    }
    else if (section == 1) {
        // Dollars section
        return [self.model countDollars] + 1;
    }
    else {
        // Total section
        return 1;
    }
}

@end
