//
//  CCBSpriteKitAnimationManager.m
//  SB+KoboldKit
//
//  Created by Steffen Itterheim on 19/02/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCBSpriteKitAnimationManager.h"
#import "CCBKeyframe.h"
#import "CCBReader_Private.h"

@implementation CCBSpriteKitAnimationManager

-(CCActionInterval*) actionFromKeyframe0:(CCBKeyframe*)kf0 andKeyframe1:(CCBKeyframe*)kf1 propertyName:(NSString*)name node:(CCNode*)node
{
    float duration = kf1.time - kf0.time;
	SKAction* action = nil;
    
    if ([name isEqualToString:@"rotation"] || [name isEqualToString:@"rotationX"] || [name isEqualToString:@"rotationY"])
    {
		action = [SKAction rotateToAngle:CC_DEGREES_TO_RADIANS([kf1.value floatValue] * -1.0) duration:duration];
    }
	/*
    else if ([name isEqualToString:@"opacity"])
    {
        return [CCActionFadeTo actionWithDuration:duration opacity:[kf1.value intValue]];
    }
    else if ([name isEqualToString:@"color"])
    {
        CCColor* color = kf1.value;
        return [CCActionTintTo actionWithDuration:duration color:color];
    }
    else if ([name isEqualToString:@"visible"])
    {
        if ([kf1.value boolValue])
        {
            return [CCActionSequence actionOne:[CCActionDelay actionWithDuration:duration] two:[CCActionShow action]];
        }
        else
        {
            return [CCActionSequence actionOne:[CCActionDelay actionWithDuration:duration] two:[CCActionHide action]];
        }
    }
    else if ([name isEqualToString:@"spriteFrame"])
    {
        return [CCActionSequence actionOne:[CCActionDelay actionWithDuration:duration] two:[CCBSetSpriteFrame actionWithSpriteFrame:kf1.value]];
    }
    else if ([name isEqualToString:@"position"])
    {
        // Get position type
        //int type = [[[self baseValueForNode:node propertyName:name] objectAtIndex:2] intValue];
        
        id value = kf1.value;
        
        // Get relative position
        float x = [[value objectAtIndex:0] floatValue];
        float y = [[value objectAtIndex:1] floatValue];
        
        //CGSize containerSize = [self containerSize:node.parent];
        
        //CGPoint absPos = [node absolutePositionFromRelative:ccp(x,y) type:type parentSize:containerSize propertyName:name];
        
        return [CCActionMoveTo actionWithDuration:duration position:ccp(x,y)];
    }
    else if ([name isEqualToString:@"scale"])
    {
        // Get position type
        //int type = [[[self baseValueForNode:node propertyName:name] objectAtIndex:2] intValue];
        
        id value = kf1.value;
        
        // Get relative scale
        float x = [[value objectAtIndex:0] floatValue];
        float y = [[value objectAtIndex:1] floatValue];
        
        return [CCActionScaleTo actionWithDuration:duration scaleX:x scaleY:y];
    }
    else if ([name isEqualToString:@"skew"])
    {
        id value = kf1.value;
        
        float x = [[value objectAtIndex:0] floatValue];
        float y = [[value objectAtIndex:1] floatValue];
        
        return [CCActionSkewTo actionWithDuration:duration skewX:x skewY:y];
    }
	*/
	else
	{
		[NSException raise:NSInvalidArgumentException format:@"CCBReader: Failed to create action for property: %@ on node: %@", name, node];
	}

    return (CCActionInterval*)action;
}

-(CCActionInterval*) easeAction:(CCActionInterval*)action easingType:(int)easingType easingOpt:(float)easingOpt
{
	SKAction* skAction = (SKAction*)action;
	NSAssert2([skAction isKindOfClass:[SKAction class]], @"object %@ (%@) is not a SKAction", action, NSStringFromClass([action class]));
	
	switch (easingType)
	{
		case kCCBKeyframeEasingLinear:
		case kCCBKeyframeEasingInstant:
			skAction.timingMode = SKActionTimingLinear;
			break;
			
		case kCCBKeyframeEasingCubicIn:
		case kCCBKeyframeEasingBackIn:
		case kCCBKeyframeEasingBounceIn:
		case kCCBKeyframeEasingElasticIn:
			skAction.timingMode = SKActionTimingEaseIn;
			break;
		case kCCBKeyframeEasingCubicOut:
		case kCCBKeyframeEasingBackOut:
		case kCCBKeyframeEasingBounceOut:
		case kCCBKeyframeEasingElasticOut:
			skAction.timingMode = SKActionTimingEaseOut;
			break;
		case kCCBKeyframeEasingCubicInOut:
		case kCCBKeyframeEasingBackInOut:
		case kCCBKeyframeEasingBounceInOut:
		case kCCBKeyframeEasingElasticInOut:
			skAction.timingMode = SKActionTimingEaseInEaseOut;
			break;
			
		default:
			NSLog(@"CCBSpriteKitAnimationManager: unkown action easing type %d", easingType);
			break;
	}
	
	return (CCActionInterval*)skAction;
}

@end

