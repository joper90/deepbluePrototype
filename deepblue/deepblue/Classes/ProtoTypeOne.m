//
//  IntroScene.m
//  deepblue
//
//  Created by joe90 on 19/05/2014.
//  Copyright FunkVoodoo 2014. All rights reserved.
//
// -----------------------------------------------------------------------

// Import the interfaces
#import "ProtoTypeOne.h"
#import "FVProtoBGLayer.h"
#import "GCCShapeCache.h"

// -----------------------------------------------------------------------
#pragma mark - IntroScene
// -----------------------------------------------------------------------

@implementation ProtoTypeOne
{
    CCPhysicsNode *_physicsWorld;
    CCSprite *_diver;
    CCLabelTTF *_countLabel;
    CCLabelTTF *_statusLabel;
    BOOL       _applyDiverUpdate;
}

// -----------------------------------------------------------------------
#pragma mark - Create & Destroy
// -----------------------------------------------------------------------

+ (ProtoTypeOne *)scene
{
	return [[self alloc] init];
}

// -----------------------------------------------------------------------

- (id)init
{
    [FVUtils FVLOG:self withMessage:@"Test messsage .... "];
    
    // Apple recommend assigning self with supers return value
    self = [super init];
    if (!self) return(nil);
    
    // Enable touch handling on scene node
    self.userInteractionEnabled = YES;
    
    //Test add the layer.
    id bgProtoLayer = [[FVProtoBGLayer alloc]init];
    [self addChild:bgProtoLayer z:-1 name:@"bgLayer"];
    
    //Load the Physics info in
    [[GCCShapeCache sharedShapeCache] addShapesWithFile:@"allUnits.plist"];
    // Setup physics world
    _physicsWorld = [CCPhysicsNode node];
    _physicsWorld.gravity = ccp(0,-3);
    _physicsWorld.debugDraw = YES;
    [self addChild:_physicsWorld];
    
    //Add the background sprite
    CCSprite *bg = [CCSprite spriteWithImageNamed:@"singleBackground.png"];
    

    
    [[GCCShapeCache sharedShapeCache] setBodyWithName:@"singleBackground" onNode:bg];
    [_physicsWorld addChild:bg];

    
    //Add the diver sprite
    _diver = [CCSprite spriteWithImageNamed:@"diver.png"];
    _diver.position = [FVUtils getCenter];
    [[GCCShapeCache sharedShapeCache] setBodyWithName:@"diver" onNode:_diver];
    [_physicsWorld addChild:_diver];
    
    
    //Add the live logging:
    _countLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Velocity : %f / %f",[self getDiverLocation].x, [self getDiverLocation].y ]fontName:@"Verdana-Bold" fontSize:18.0f];
    _countLabel.color = [CCColor yellowColor];
    _countLabel.position = ccp(100,750); // Middle of screen
    [self addChild:_countLabel];
    
    
    _applyDiverUpdate  = NO;
    
    // done
	return self;
}


// -----------------------------------------------------------------------
#pragma mark - Enter & Exit
// -----------------------------------------------------------------------

- (void)onEnter
{
    // always call super onEnter first
    [super onEnter];
    
    // In pre-v3, touch enable and scheduleUpdate was called here
    // In v3, touch is enabled by setting userInterActionEnabled for the individual nodes
    // Per frame update is automatically enabled, if update is overridden
    
}

// -----------------------------------------------------------------------

- (void)onExit
{
    // always call super onExit last
    [super onExit];
}


// -----------------------------------------------------------------------
#pragma mark - Button Callbacks
// -----------------------------------------------------------------------

- (void)onSpinningClicked:(id)sender
{
    // start spinning scene with transition
   // [[CCDirector sharedDirector] replaceScene:[HelloWorldScene scene]
    //                           withTransition:[CCTransition transitionPushWithDirection:CCTransitionDirectionLeft duration:1.0f]];
    

    
    
}

// -----------------------------------------------------------------------
#pragma mark - Touch Handler and update code
// -----------------------------------------------------------------------

-(void) touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    //CGPoint touchLoc = [touch locationInNode:self];
    [self schedule:@selector(updateDiver:) interval:.5f];
}

-(void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    [self unschedule:@selector(updateDiver:)];
}


-(void)update:(CCTime)delta
{
    [_countLabel setString:[NSString stringWithFormat:@"Velocity : %f / %f",[self getDiverLocation].x, [self getDiverLocation].y ]];
    if (_diver.physicsBody.velocity.y < -10.f)
    {
        _diver.physicsBody.velocity = ccp(0,-10.f);
    }

}

-(CGPoint) getDiverLocation
{
     CGPoint ret = _diver.physicsBody.velocity;
    return ret;
}

//Local scheduler for updating..
-(void) updateDiver:(CCTime) dt
{
    [FVUtils FVLOG:self withMessage:@"Applying force."];
    
    //Create an impluse to add
    CGPoint impluse = ccp(0.f, 10.f);
    [_diver.physicsBody applyImpulse:impluse];
    CCPhysicsBody * diverPh =  _diver.physicsBody;
    CGPoint vv = diverPh.velocity;
    CCLOG(@"--> Impluse set too : %f, %f", vv.x, vv.y);

   
}

@end
