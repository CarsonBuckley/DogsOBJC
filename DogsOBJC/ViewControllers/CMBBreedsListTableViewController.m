//
//  CMBBreedsListTableViewController.m
//  DogsOBJC
//
//  Created by Carson Buckley on 3/27/19.
//  Copyright © 2019 Launch. All rights reserved.
//

#import "CMBBreedsListTableViewController.h"
#import "CMBBreed.h"
#import "CMBBreedNetworkClient.h"
#import "CMBSubBreedsListTableViewController.h"
#import "CMBImagesCollectionViewController.h"

@interface CMBBreedsListTableViewController ()
@property (nonatomic, copy) NSArray *breeds;

@end

@implementation CMBBreedsListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //fetch breeds on first load
    [[CMBBreedNetworkClient sharedController] fetchAllBreeds:^(NSArray *breeds) {
        self.breeds = breeds;
        dispatch_async(dispatch_get_main_queue(), ^{
            [[self tableView] reloadData];
        });
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.breeds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"breedCell" forIndexPath:indexPath];
    cell.textLabel.text = [[self.breeds[indexPath.row] name] capitalizedString];;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //When row is selected determine if the selected Breed has Sub-Breeds
    CMBBreed * breed = self.breeds[[[[self tableView] indexPathForSelectedRow] row]];
    if( [breed.subBreeds count] > 0){
        //if there are subBreeds go to the SubBreedTableViewController
        [self performSegueWithIdentifier:@"toSubBreedVC" sender:self];
    } else {
        //if not, go to the ImageCollectionView
        [self performSegueWithIdentifier:@"toCollectionVC" sender:self];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CMBBreed * breed = self.breeds[[[[self tableView] indexPathForSelectedRow] row]];
    //When the segue is about to be performed, determine if the selected Breed has Sub-Breeds
    if([segue.identifier  isEqualToString: @"toSubBreedVC"])
    {
        //If it's to the SubBreedTableViewController. Send the breed to that landing pad.
        CMBSubBreedsListTableViewController *destinationVC = segue.destinationViewController;
        destinationVC.breed = breed;
        
    }else if([segue.identifier  isEqualToString: @"toCollectionVC"]){
        //If it's to the ImageCollectionView send the breed to that landing pad.
        CMBImagesCollectionViewController *destinationVC = segue.destinationViewController;
        destinationVC.breed = breed;
    }
}

@end
