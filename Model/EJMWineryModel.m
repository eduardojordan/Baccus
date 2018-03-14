//
//  EJMWineryModel.m
//  Baccus
//
//  Created by Eduardo on 10/3/18.
//  Copyright © 2018 Eduardo Jordan Muñoz. All rights reserved.
//

#import "EJMWineryModel.h"

//@implementation EJMWineryModel

@interface EJMWineryModel ()

@property (strong ,nonatomic) NSMutableArray *redWines;
@property (strong,nonatomic) NSMutableArray *whiteWines;
@property (strong,nonatomic) NSMutableArray *otherWines;



@end

@implementation EJMWineryModel



#pragma mark - properties
- (NSUInteger) redWineCount{
        return (NSUInteger)[self.redWines count];
    }
    
 - (NSUInteger) whiteWineCount {
        return (NSUInteger)[self.whiteWines count];
    }
    
- (NSUInteger) otherWineCount {
        return (NSUInteger)[self.otherWines count];
    }

#pragma mark - init


- (id) init{
    if (self = [super init]){
        NSURL *url = [NSURL URLWithString:@"http://static.keepcoding.io/baccus/wines.json"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        NSError *error;
        
        if (data != nil){
            NSArray *JSONObjects = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:kNilOptions
                                                                     error:&error];
            if (JSONObjects != nil){
                for (NSDictionary *dict in JSONObjects){
                    EJMWineModel *wine = [[EJMWineModel alloc] initWithDictionary:dict];
                    
                    if ([wine.type isEqualToString:RED_WINE_KEY]){
                        if (!self.redWines){self.redWines = [NSMutableArray arrayWithObject:wine];}
                        else {[self.redWines addObject: wine];}
                    }
                    else if ([wine.type isEqualToString:WHITE_WINE_KEY]){
                        if (!self.whiteWines){ self.whiteWines = [NSMutableArray arrayWithObject:wine];}
                        else { [self.whiteWines addObject:wine];}
                    }
                    else {
                        if (!self.otherWines){self.otherWines = [NSMutableArray arrayWithObject:wine];}
                        else {[self.otherWines addObject:wine];}
                    }
                }
            }
            else{NSLog(@"Error al parsear JSON: %@", error.localizedDescription);}
        }
        else{NSLog(@"Error al descargar datos del servidor: %@", error.localizedDescription);}
    }
    return self;
}

    
    
    
-(EJMWineModel * ) redWineAtIndex: (NSUInteger) index{
    
        return [self.redWines objectAtIndex:index];
    }
    
-(EJMWineModel * ) whiteWineAtIndex: (NSUInteger) index{
         return [self.whiteWines objectAtIndex:index];
    }
    
-(EJMWineModel * ) otherWineAtIndex: (NSUInteger) index{
         return [self.otherWines objectAtIndex:index];
        
    }
    

@end

