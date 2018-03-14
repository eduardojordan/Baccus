//
//  EJMWineViewController.m
//  Baccus
//
//  Created by Eduardo on 8/3/18.
//  Copyright © 2018 Eduardo Jordan Muñoz. All rights reserved.
//

#import "EJMWineViewController.h"
#import  "EJMWebViewController.h"
//#import "EJMWineryTableViewController.h"

@implementation EJMWineViewController

-(id) initWithModel: (EJMWineModel *) aModel{
    
    if (self = [super initWithNibName:nil
                              bundle:nil]){
        
        _model = aModel;
         self.title = aModel.name;
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];{
    if (self.splitViewController.displayMode == UISplitViewControllerDisplayModePrimaryHidden) {
        self.navigationItem.rightBarButtonItem = self.splitViewController.displayModeButtonItem;}
    
}
    // Do any additional setup after loading the view from its nib.
}


// Sincroniza modelo y vista
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self syncModelWithView];
    
    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithRed:0.5
                                                                        green:0
                                                                         blue:0.13
                                                                        alpha:1];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

# pragma mark - Actions

-(IBAction)displayWeb:(id)sender{
   // NSLog (@"Go to %@" ,self.model.wineCompanyWeb );
    
    //Crear un webVC
    EJMWebViewController  *webVC = [[EJMWebViewController alloc]initWithModel:self.model];
    
    //Hacemos un push
    [self.navigationController pushViewController:webVC
                                         animated:YES];
    
}

# pragma mark - Utils

-(void) syncModelWithView{
    
    self.nameLabel.text = self.model.name;
    self.typeLabel.text = self.model.type;
    self.originLabel.text = self.model.origin;
    self.notesLabel.text = self.model.notes;
    self.wineryNameLabel.text = self.model.wineCompanyName;
    self.photoView.image = self.model.photo;
    self.grapesLabel.text = [self arrayToString: self.model.grapes];
    
    [self displayRating:self.model.rating];
    [self.notesLabel setNumberOfLines:0];
    
    
}
-(void) clearRatings{
    for (UIImageView *imgView in self.ratingViews){
        imgView.image = nil;
    }
}
-(void) displayRating: (int) aRating {
    
    [self clearRatings];
    UIImage *glass = [UIImage imageNamed: @"splitView_score_glass"];
    
    for (int i = 0; i < aRating; i ++){
        [[self.ratingViews objectAtIndex:i] setImage:glass];
    }
}
-(NSString *) arrayToString: (NSArray *) anArray{
    NSString * repr = nil;
    
    if ([anArray count] == 1){
        repr = [@"100%" stringByAppendingString:[anArray lastObject]];
        
    }else{
        repr= [[anArray componentsJoinedByString:@", "]stringByAppendingString:@"."];
    }
    return  repr;
}

#pragma mark -- UISplitViewControllerDelegate
- (void) splitViewController:(UISplitViewController *)svc
     willChangeToDisplayMode:(UISplitViewControllerDisplayMode)displayMode{
    if (displayMode == UISplitViewControllerDisplayModePrimaryHidden){
        self.navigationItem.rightBarButtonItem = svc.displayModeButtonItem;
    }
}


/*
-(void) splitViewController:(UISplitViewController *)svc
    willChangeToDisplayMode:(UISplitViewControllerDisplayMode)displayMode
 {
    if (self.splitViewController.displayMode == UISplitViewControllerDisplayModePrimaryHidden) {
        
        self.navigationItem.rightBarButtonItem = self.splitViewController.displayModeButtonItem;
    }else{
        if (displayMode == UISplitViewControllerDisplayModeAllVisible){
            self.navigationItem.rightBarButtonItem = nil;
        }
    }
 }
*/
#pragma mark - Winery

-(void) wineryTableViewController:(EJMWineryTableViewController *)wineryVC didSelecteWine: (EJMWineModel *)aWine{
    
    self.model = aWine;
    self.title = aWine.name;
  [self syncModelWithView];

 
     }
  

@end
     

     
