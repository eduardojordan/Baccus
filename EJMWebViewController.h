//
//  EJMWebViewController.h
//  Baccus
//
//  Created by Eduardo on 9/3/18.
//  Copyright © 2018 Eduardo Jordan Muñoz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EJMWineModel.h"


@interface EJMWebViewController : UIViewController<UIWebViewDelegate>


@property (strong, nonatomic) EJMWineModel *model;
@property (weak, nonatomic) IBOutlet UIWebView *browser;
@property (weak,nonatomic) IBOutlet UIActivityIndicatorView *activityView;

-(id)initWithModel : (EJMWineModel * ) aModel;








@end
