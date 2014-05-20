//
//  FVLayer.m
//  deepblue
//
//  Created by joe90 on 19/05/2014.
//  Copyright (c) 2014 FunkVoodoo. All rights reserved.
//

#import "FVProtoBGLayer.h"

@implementation FVProtoBGLayer


-(id) init
{
    [FVUtils FVLOG:self withMessage:@"-->[FVProtoBGLayer] init()"];
    
	if( (self=[super init]))
    {
        //Make a fullsize node.
        self.contentSize = CGSizeMake(1, 1);
       
        //Set the background
        CCNodeColor *background = [CCNodeColor nodeWithColor:[CCColor blueColor]];
        [self addChild:background];
        
        // Display proto information.
        CCLabelTTF *label = [CCLabelTTF labelWithString:@"Deepblue prototype.. (back layer)" fontName:@"ZXSpectrum" fontSize:20.0f];
        label.positionType = CCPositionTypeNormalized;
        label.color = [CCColor redColor];
    
        label.position = [FVUtils instance].screenCenter;
        [self addChild:label];
    }
    return self;
}

@end
