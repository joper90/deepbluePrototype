//
//  IntroScene.h
//  deepblue
//
//  Created by joe90 on 19/05/2014.
//  Copyright FunkVoodoo 2014. All rights reserved.
//
// -----------------------------------------------------------------------

#import "FVCoreImports.h"

// -----------------------------------------------------------------------

/**
 *  The intro scene
 *  Note, that scenes should now be based on CCScene, and not CCLayer, as previous versions
 *  Main usage for CCLayer now, is to make colored backgrounds (rectangles)
 *
 */
@interface ProtoTypeOne : CCScene

// -----------------------------------------------------------------------

+ (ProtoTypeOne *)scene;
- (id)init;

// -----------------------------------------------------------------------
@end