//
//  EJMWineryTableViewController.h
//  Baccus
//
//  Created by Eduardo on 10/3/18.
//  Copyright © 2018 Eduardo Jordan Muñoz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EJMWineryModel.h"

#define NUMBER_OF_SECTIONS 3


#define RED_WINE_SECTION 0
#define WHITE_WINE_SECTION 1
#define OTHER_WINE_SECTION 2


#define NEW_WINE_NOTIFICATION_NAME @"newWine"
#define WINE_KEY @"wine"

#define SECTION_KEY @"section"
#define ROW_KEY @"row"
#define LAST_WINE_KEY @"lastWine"



@class EJMWineryTableViewController;

@protocol WineryTableViewControllerDelegate <NSObject>

-(void) wineryTableViewController: (EJMWineryTableViewController *)wineryVC
                  didSelecteWine : (EJMWineModel *) aWine;

@end

@interface EJMWineryTableViewController : UITableViewController


@property(nonatomic, strong) EJMWineryModel *model;
@property (nonatomic, weak) id<WineryTableViewControllerDelegate> delegate;

-(id) initWithModel: (EJMWineryModel * ) aModel
              style: (UITableViewStyle) aStyle;


@end




