//
//  EJMWineViewController.h
//  Baccus
//
//  Created by Eduardo on 8/3/18.
//  Copyright © 2018 Eduardo Jordan Muñoz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EJMWineModel.h"
#import "EJMWineryTableViewController.h"

@interface EJMWineViewController : UIViewController <UISplitViewControllerDelegate,WineryTableViewControllerDelegate>



@property (weak,nonatomic)IBOutlet UILabel *nameLabel;
@property (weak,nonatomic)IBOutlet UILabel *wineryNameLabel;
@property (weak,nonatomic)IBOutlet UILabel *typeLabel;
@property (weak,nonatomic)IBOutlet UILabel *originLabel;
@property (weak,nonatomic)IBOutlet UILabel *grapesLabel;
@property (weak,nonatomic)IBOutlet UILabel *notesLabel;
@property (weak,nonatomic)IBOutlet UIImageView *photoView;

@property (strong,nonatomic)IBOutletCollection(UIImageView) NSArray *ratingViews;


@property (strong,nonatomic) EJMWineModel *model;

-(id) initWithModel: (EJMWineModel *) aModel;

-(IBAction)displayWeb:(id)sender;



@end
