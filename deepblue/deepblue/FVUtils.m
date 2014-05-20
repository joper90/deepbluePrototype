//
//  FVUtils.m
//  deepblue
//
//  Created by joe90 on 19/05/2014.
//  Copyright (c) 2014 FunkVoodoo. All rights reserved.
//

#import "FVUtils.h"

@implementation FVUtils
@synthesize screenHeight, screenSize, screenWidth, isHDmode, screenCenter;

static FVUtils* utils = nil;

//Singleton init
+(FVUtils *) instance
{
    CCLOG(@"[FVUtils] getInstance()");
    if (utils == nil)
    {
        utils = [[FVUtils alloc]init];
    }
    return utils;
   
}

-(id)init {
    CCLOG(@"[FVUtils] init()");
    self = [super init];
    if (self) {
        screenSize = [[CCDirector sharedDirector] viewSize];
        screenWidth = screenSize.width;
        screenHeight = screenSize.height;
        screenCenter = ccp (screenWidth /2 , screenHeight / 2);
        
        CCLOG(@"[FVUtils] - setup with screen width: %.0f and height: %.0f", screenWidth, screenHeight);
        
        isHDmode = NO;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            isHDmode = YES;
        }
    }
    return self;
}

//------------------------------------------------------
#pragma mark - Static methods.
//------------------------------------------------------

+(CGPoint) getCenter
{
    return [FVUtils instance].screenCenter;
}

+(float) getX
{
    return [FVUtils instance].screenWidth;
}

+(float) getY
{
    return [FVUtils instance].screenHeight;
}

+(BOOL) isHD
{
    return [FVUtils instance].isHDmode;
}


//------------------------------------------------------
#pragma mark - Loggin message
//------------------------------------------------------

+(void) FVLOG:(id)classInfo withMessage:(NSString *)info
{
    Class classNameInfo = [classInfo class];
    NSString *className = NSStringFromClass(classNameInfo);
    CCLOG(@"--> [%@] - %@", className, info);
}

@end
