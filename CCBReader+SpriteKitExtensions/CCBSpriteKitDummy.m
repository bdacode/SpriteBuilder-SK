/*
 * SpriteBuilder: http://www.spritebuilder.org
 *
 * Copyright (c) 2014 Apportable Inc.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#import "CCBSpriteKitDummy.h"
#import "CCBSpriteKitMacros.h"

@implementation CCBSpriteKitDummy

#pragma mark ObjectAL

+(instancetype) sharedInstance
{
	static CCBSpriteKitDummy* sharedSimpleAudioEngine = nil;
	if (sharedSimpleAudioEngine == nil)
	{
		sharedSimpleAudioEngine = [[CCBSpriteKitDummy alloc] init];
	}
	return sharedSimpleAudioEngine;
}

-(void) playEffect:(NSString*)soundFile volume:(CGFloat)gain pitch:(CGFloat)pitch pan:(CGFloat)pan loop:(BOOL)loop
{
	NOTIMPLEMENTED();
}

@end


#pragma mark Actions

@implementation CCBSpriteKitDummyAction

+(instancetype) action
{
	NOTIMPLEMENTED();
	return nil;
}

+(instancetype) actionWithAction:(CCBSpriteKitDummyAction*)action
{
	NOTIMPLEMENTED();
	return nil;
}

+(instancetype) actionWithAction:(CCBSpriteKitDummyAction*)action rate:(CGFloat)rate
{
	NOTIMPLEMENTED();
	return nil;
}

+(instancetype) actionWithAction:(CCBSpriteKitDummyAction*)action period:(CGFloat)period
{
	NOTIMPLEMENTED();
	return nil;
}

+(instancetype) actionWithDuration:(CCTime)duration
{
	NOTIMPLEMENTED();
	return nil;
}

+(instancetype) actionWithDuration:(CCTime)duration opacity:(uint8_t)opacity
{
	NOTIMPLEMENTED();
	return nil;
}

+(instancetype) actionWithDuration:(CCTime)duration color:(CCColor*)color
{
	NOTIMPLEMENTED();
	return nil;
}

+(instancetype) actionWithDuration:(double)duration position:(CGPoint)position
{
	NOTIMPLEMENTED();
	return nil;
}

+(instancetype) actionWithDuration:(double)duration scaleX:(CGFloat)scaleX scaleY:(CGFloat)scaleY
{
	NOTIMPLEMENTED();
	return nil;
}

+(instancetype) actionWithDuration:(double)duration skewX:(CGFloat)skewX skewY:(CGFloat)skewY
{
	NOTIMPLEMENTED();
	return nil;
}

+(instancetype) actionWithTarget:(id)target selector:(SEL)selector
{
	NOTIMPLEMENTED();
	return nil;
}

-(instancetype) initWithDuration:(double)duration
{
	NOTIMPLEMENTED();
	return nil;
}

-(void) startWithTarget:(id)target
{
	NOTIMPLEMENTED();
}

@end


@implementation CCPhysicsJoint
+(instancetype)	connectedPivotJointWithBodyA:(id)bodyA bodyB:(id)bodyB anchorA:(CGPoint)anchorA
{
	return nil;
}
+(instancetype) connectedSpringJointWithBodyA:(id)bodyA bodyB:(id)bodyB anchorA:(CGPoint)anchorA anchorB:(CGPoint)anchorB restLength:(CGFloat)restLength stiffness:(CGFloat)stiffness damping:(CGFloat)damping
{
	return nil;
}
+(instancetype) connectedDistanceJointWithBodyA:(id)bodyA bodyB:(id)bodyB anchorA:(CGPoint)anchorA anchorB:(CGPoint)anchorB
{
	return nil;
}
+(instancetype) connectedDistanceJointWithBodyA:(id)bodyA bodyB:(id)bodyB anchorA:(CGPoint)anchorA anchorB:(CGPoint)anchorB minDistance:(CGFloat)minDistance maxDistance:(CGFloat)maxDistance
{
	return nil;
}
@end

@implementation CCPhysicsShape
+(instancetype) polygonShapeWithPoints:(CGPoint*)polygons count:(NSUInteger)numPoints cornerRadius:(CGFloat)cornerRadius
{
	return nil;
}
@end

@implementation CCPhysicsBody
+(instancetype) bodyWithShapes:(NSArray*)shapes
{
	return nil;
}
+(instancetype) bodyWithCircleOfRadius:(CGFloat)cornerRadius andCenter:(CGPoint)point
{
	return nil;
}
@end