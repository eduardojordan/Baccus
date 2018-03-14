//
//  EJMWineModel.h
//  Baccus
//
//  Created by Eduardo on 8/3/18.
//  Copyright © 2018 Eduardo Jordan Muñoz. All rights reserved.
//

#import <Foundation/Foundation.h>
// #import <UIKit/UIKit.h>
@import UIKit;

#define NO_RATING -1

@interface EJMWineModel : NSObject

@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) UIImage *photo;
@property (strong, nonatomic) NSURL *photoURL;
@property (strong, nonatomic) NSURL *wineCompanyWeb;
@property (strong,nonatomic)  NSString *notes;
@property (strong,nonatomic)  NSString *origin;
@property (nonatomic)  int rating; // de 0 a 5
@property (strong,nonatomic)  NSArray *grapes;
@property (strong,nonatomic)  NSString *name;
@property (strong,nonatomic)  NSString *wineCompanyName;


// Metodos de Clase
+(id) wineWithName: (NSString *) aName
   wineCompanyName: (NSString *) aWineCompanyName
              type: (NSString *) aType
           origin : (NSString *) anOrigin
            grapes: (NSArray *) arrayOfGrapes
    wineCompanyWeb: (NSURL *) aURL
             notes: (NSString *) aNotes
            rating: (int) aRating
            //photo : (UIImage *) aPhoto;
        photoURL:(NSURL *) aPhotoURL;

+(id) wineWithName: (NSString *) aName
   wineCompanyName: (NSString *) aWineCompanyName
              type: (NSString *) aType
           origin : (NSString *) anOrigin;


// Inicializador Designado

-(id) initWithName: (NSString *) aName
   wineCompanyName: (NSString *) aWineCompanyName
              type: (NSString *) aType
           origin : (NSString *) anOrigin
            grapes: (NSArray *) arrayOfGrapes
    wineCompanyWeb: (NSURL *) aURL
             notes: (NSString *) aNotes
            rating: (int) aRating
           // photo : (UIImage *) aPhoto;
          photoURL:(NSURL *) aPhotoURL;



-(id) initWithName: (NSString *) aName
   wineCompanyName: (NSString *) aWineCompanyName
              type: (NSString *) aType
           origin : (NSString *) anOrigin;

// INicializasor a partir de un diccionario JSON
-(id) initWithDictionary: (NSDictionary *) aDict;



@end
