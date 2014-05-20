//
//  FVUtils.h
//  deepblue
//
//  Created by joe90 on 19/05/2014.
//  Copyright (c) 2014 FunkVoodoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "cocos2d-ui.h"

@interface FVUtils : NSObject

@property float screenWidth;
@property float screenHeight;
@property bool isHDmode;
@property (readonly) CGSize screenSize;
@property (readonly) CGPoint screenCenter;


//Singleton creator.
+(FVUtils*) instance;


+(CGPoint) getCenter;
+(float) getX;
+(float) getY;
+(BOOL) isHD;

+(void) FVLOG:(id)classInfo withMessage:(NSString*) info;

@end
