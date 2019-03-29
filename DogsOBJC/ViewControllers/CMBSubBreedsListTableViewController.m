//
//  CMBSubBreedsListTableViewController.m
//  DogsOBJC
//
//  Created by Carson Buckley on 3/27/19.
//  Copyright © 2019 Launch. All rights reserved.
//

#import "CMBSubBreedsListTableViewController.h"
#import "CMBBreed.h"
#import "CMBSubBreed.h"
#import "CMBImagesCollectionViewController.h"

@interface CMBSubBreedsListTableViewController ()

@end

@implementation CMBSubBreedsListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [self.breed.name capitalizedString];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.breed.subBreeds count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"subBreedCell" forIndexPath:indexPath];
    cell.textLabel.text = [[self.breed.subBreeds[indexPath.row] name] capitalizedString];
    return cell;
}

//Landing pad setValue
//run this when the breed property is set
- (void)setBreed:(CMBBreed *)breed
{
    if(breed != _breed){
        _breed = breed;
        [self.tableView reloadData];
    }
}

//when a row is selected, the view will perform a the specified segue
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"fromSubBreedsToImages" sender:self];
}

//when a segue is about to happen this code will run
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CMBSubBreed * subBreed = self.breed.subBreeds[[[[self tableView] indexPathForSelectedRow] row]];
    if([segue.identifier  isEqualToString: @"fromSubBreedsToImages"])
    {
        //send breed and subBreed to landing pads on collection view
        CMBImagesCollectionViewController *destinationVC = segue.destinationViewController;
        destinationVC.subBreed = subBreed;
        destinationVC.breed = self.breed;
        
    }
}

@end
