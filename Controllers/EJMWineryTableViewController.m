//
//  EJMWineryTableViewController.m
//  Baccus
//
//  Created by Eduardo on 10/3/18.
//  Copyright © 2018 Eduardo Jordan Muñoz. All rights reserved.
//

#import "EJMWineryTableViewController.h"
#import "EJMWineViewController.h"


@interface EJMWineryTableViewController ()

@end

@implementation EJMWineryTableViewController


-(id) initWithModel: (EJMWineryModel * ) aModel
              style: (UITableViewStyle) aStyle{
    
    if (self = [super initWithStyle:aStyle]){
        _model = aModel;
        self.title = @"Baccus";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithRed:0.5
                                                                              green:0
                                                                               blue:0.13
                                                                              alpha:1];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 3;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == RED_WINE_SECTION){
        return @"Red wines";
    } else if (section == WHITE_WINE_SECTION){
        return @"White wines";
    } else{
        return @"Other wines";
    }
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    //return the number of rows
    if (section == RED_WINE_SECTION){
        return self.model.redWineCount;
    } else if (section == WHITE_WINE_SECTION){
        return self.model.whiteWineCount;
    } else{
        return self.model.otherWineCount;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   static NSString *CellIdentifier = @"Cell";
    
    //PRUEBA DE INDEXPATH
    //EJMWineModel *wine = [self wineForIndexPath:indexPath];
   
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier ];
    
    if (cell == nil){
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                  reuseIdentifier: CellIdentifier];
}
    //Sincronizar celda Vista y modelo
    
    EJMWineModel *wine = nil;
    if (indexPath.section == RED_WINE_SECTION){
        wine = [self.model redWineAtIndex:(int)indexPath.row];
        
    }else if (indexPath.section == WHITE_WINE_SECTION){
        wine= [self.model whiteWineAtIndex:(int)indexPath.row];
    }else{
        wine = [self.model otherWineAtIndex:(int)indexPath.row];
    }

    cell.imageView.image = wine.photo;
    cell.textLabel.text = wine.name;
    cell.detailTextLabel.text = wine.wineCompanyName;
    
    return cell;
}



#pragma mark - TAble view Delegate

-(void)  tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //Suponiendo que estamos en un navigation controller
    
   
// Averiguamos de que vino se trata
    
   
   EJMWineModel *wine = nil;
    if (indexPath.section == RED_WINE_SECTION){
        wine = [self.model redWineAtIndex: (int)indexPath.row];
    }else if (indexPath.section == WHITE_WINE_SECTION){
        wine = [self.model whiteWineAtIndex:(int)indexPath.row];
    }else{
        wine = [self.model otherWineAtIndex:(int)indexPath.row];
    }
    
   [self.delegate wineryTableViewController:self didSelecteWine:wine];
    
//Notificacion
    
        NSNotification *n = [NSNotification notificationWithName:NEW_WINE_NOTIFICATION_NAME
                                                          object:self
                                                        userInfo: @{WINE_KEY: wine}];
        [[NSNotificationCenter defaultCenter] postNotification:n];
        
     }
    
@end
    
