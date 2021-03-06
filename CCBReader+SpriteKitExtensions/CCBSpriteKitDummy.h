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

#import <Foundation/Foundation.h>
#import "CCBSpriteKitCompatibility.h"
#import "CCBCocosTypes.h"

@class CCBSpriteKitDummyAction;
@class CCColor;

@interface CCBSpriteKitDummy : NSObject

+(instancetype) sharedInstance;
-(void) playEffect:(NSString*)soundFile volume:(CGFloat)gain pitch:(CGFloat)pitch pan:(CGFloat)pan loop:(BOOL)loop;

@end

@interface CCBSpriteKitDummyAction : SKAction
{
	@protected
	id _target;
	id _originalTarget;
	double _elapsed;
	double _firstTick;
}

+(instancetype) action;
+(instancetype) actionWithAction:(CCBSpriteKitDummyAction*)action;
+(instancetype) actionWithAction:(CCBSpriteKitDummyAction*)action rate:(CGFloat)rate;
+(instancetype) actionWithAction:(CCBSpriteKitDummyAction*)action period:(CGFloat)period;
+(instancetype) actionWithDuration:(double)duration;
+(instancetype) actionWithDuration:(double)duration opacity:(uint8_t)opacity;
+(instancetype) actionWithDuration:(double)duration color:(CCColor*)color;
+(instancetype) actionWithDuration:(double)duration position:(CGPoint)position;
+(instancetype) actionWithDuration:(double)duration scaleX:(CGFloat)scaleX scaleY:(CGFloat)scaleY;
+(instancetype) actionWithDuration:(double)duration skewX:(CGFloat)skewX skewY:(CGFloat)skewY;
+(instancetype) actionWithTarget:(id)target selector:(SEL)selector;
-(instancetype) initWithDuration:(double)duration;
-(void) startWithTarget:(id)target;

@property int tag;
@property id target;
@property id originalTarget;
@property id inner;
@property CGFloat rotationalSkewX;
@property CGFloat rotationalSkewY;

@end

@interface CCPhysicsJoint : NSObject
+(instancetype) connectedPivotJointWithBodyA:(id)bodyA bodyB:(id)bodyB anchorA:(CGPoint)anchorA;
+(instancetype) connectedSpringJointWithBodyA:(id)bodyA bodyB:(id)bodyB anchorA:(CGPoint)anchorA anchorB:(CGPoint)anchorB restLength:(CGFloat)restLength stiffness:(CGFloat)stiffness damping:(CGFloat)damping;
+(instancetype) connectedDistanceJointWithBodyA:(id)bodyA bodyB:(id)bodyB anchorA:(CGPoint)anchorA anchorB:(CGPoint)anchorB;
+(instancetype) connectedDistanceJointWithBodyA:(id)bodyA bodyB:(id)bodyB anchorA:(CGPoint)anchorA anchorB:(CGPoint)anchorB minDistance:(CGFloat)minDistance maxDistance:(CGFloat)maxDistance;
@end

@interface CCPhysicsShape : NSObject
+(instancetype) polygonShapeWithPoints:(CGPoint*)polygons count:(NSUInteger)numPoints cornerRadius:(CGFloat)cornerRadius;
@end

@interface CCPhysicsBody : SKPhysicsBody
+(instancetype) bodyWithShapes:(NSArray*)shapes;
+(instancetype) bodyWithCircleOfRadius:(CGFloat)cornerRadius andCenter:(CGPoint)point;
@property CCPhysicsBodyType type;
@end
