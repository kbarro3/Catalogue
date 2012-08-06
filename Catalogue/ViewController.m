//
//  ViewController.m
//  Catalogue
//
//  Created by iOS Camp on 8/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "Book.h"
#import "CD.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize itemsTableView;
@synthesize items = _items;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.items = [NSMutableArray array];
    
    [self.items addObject:[Book bookWithTitle:@"Objective-C" author:@"Kenny Barron" price:1.99 identificationNumber:100]];
    [self.items addObject:[Book bookWithTitle:@"Objective-D" author:@"Joel" price:2.33 identificationNumber:132]];
    
    
}

- (void)viewDidUnload
{
    [self setItemsTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

//Required methods for UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemCell"];
    
    Book *bookInstance = [self.items objectAtIndex:indexPath.row];
    
    cell.textLabel.text = bookInstance.title;
    
    return cell;
}
@end
