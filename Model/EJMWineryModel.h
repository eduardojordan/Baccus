//
//  EJMWineryModel.h
//  Baccus
//
//  Created by Eduardo on 10/3/18.
//  Copyright © 2018 Eduardo Jordan Muñoz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EJMWineModel.h"

#define RED_WINE_KEY    @"Tinto"
#define WHITE_WINE_KEY  @"Blanco"
#define OTHER_WINE_KEY  @"Rosado"




@interface EJMWineryModel : NSObject

@property (readonly, nonatomic) NSUInteger redWineCount;
@property (readonly, nonatomic) NSUInteger whiteWineCount;
@property (readonly, nonatomic) NSUInteger otherWineCount;



- (EJMWineModel *) redWineAtIndex:   (NSUInteger) index;
- (EJMWineModel *) whiteWineAtIndex: (NSUInteger) index;
- (EJMWineModel *) otherWineAtIndex: (NSUInteger) index;



@end
