//
//  EJMWebViewController.m
//  Baccus
//
//  Created by Eduardo on 9/3/18.
//  Copyright © 2018 Eduardo Jordan Muñoz. All rights reserved.
//

#import "EJMWebViewController.h"
#import "EJMWineViewController.h"
#import "EJMWineModel.h"
#import "EJMWineryTableViewController.h"

@interface EJMWebViewController ()

@end

@implementation EJMWebViewController


-(id) initWithModel : (EJMWineModel * ) aModel{
    if (self = [super initWithNibName:nil
                               bundle:nil]){
        _model = aModel;
    self.title = @"Web";
}
    return self;
}
    
- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self displayURL : self.model.wineCompanyWeb];
    

//Alta de la notificación
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self
           selector:@selector(wineDidChange:)
               name:NEW_WINE_NOTIFICATION_NAME
             object:nil];
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
//Baja de lanotificación cuando desaparece la vista que es en view will Disappear
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
// Esta es la notificacion en si

- (void) wineDidChange: (NSNotification *) notification{
    NSDictionary *dict = [notification userInfo];
    EJMWineModel *newWine = [dict objectForKey:WINE_KEY];
    
    // Actualizar el modelo
    self.model = newWine;
    [self displayURL:self.model.wineCompanyWeb];
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - Utils

-(void) webViewDidFinishLoad:(UIWebView *)webView{
    
    [self.activityView stopAnimating];
    [self.activityView setHidden:YES];
}

-(void) displayURL:(NSURL *)aURL{
        
        self.browser.delegate = self;
        self.activityView.hidden = NO;
        [self.activityView startAnimating];
        [self.browser loadRequest:[NSURLRequest requestWithURL: aURL]];
       
    }

    @end
      
