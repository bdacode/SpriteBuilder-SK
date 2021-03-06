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


#import "CCBSpriteKitReader.h"
#import "NSValue+CCBReader.h"
#import "CCBSpriteKitAnimationManager.h"
#import "SKNode+CCBReader.h"

static CGSize CCBSpriteKitReaderSceneSize;

@interface CCBReader (PrivateMethods)
-(CCNode*) nodeGraphFromFile:(NSString*) file owner:(id)o parentSize:(CGSize)parentSize;
@end

@implementation CCBSpriteKitReader

+(CGSize) internal_getSceneSize
{
	return CCBSpriteKitReaderSceneSize;
}

-(id) init
{
	self = [super init];
	if (self)
	{
		[CCBReader configureCCFileUtils];
		
		// replace action manager with sprite-kit animation manager instance
		self.animationManager = [[CCBSpriteKitAnimationManager alloc] init];
		// Setup resolution scale and default container size
		animationManager.rootContainerSize = [CCDirector sharedDirector].designSize;
	}
	return self;
}

-(CCNode*) nodeFromClassName:(NSString *)nodeClassName
{
	CCNode* node = nil;
	Class nodeClass = NSClassFromString(nodeClassName);
	NSAssert1([nodeClass isSubclassOfClass:[SKScene class]] == NO, @"class %@ is a subclass of SKScene, it should be a SKNode subclass", nodeClassName);
	
	if (nodeClass)
	{
		node = [nodeClass node];
	}

	if (node == nil)
	{
		// process fallbacks
		if ([nodeClassName isEqualToString:@"SKColorSpriteNode"] ||
			[nodeClassName isEqualToString:@"CCNodeColor"] ||
			[nodeClassName isEqualToString:@"CCNodeGradient"])
		{
			node = (CCNode*)[SKSpriteNode spriteNodeWithColor:[SKColor magentaColor] size:CGSizeMake(128, 128)];
		}
		else if ([nodeClassName isEqualToString:@"CCNode"])
		{
			node = [SKNode node];
		}
		else if ([nodeClassName isEqualToString:@"CCSprite"])
		{
			node = (CCNode*)[SKSpriteNode node];
		}
		else if ([nodeClassName isEqualToString:@"CCLabelTTF"])
		{
			node = (CCNode*)[SKLabelNode node];
		}
		else if ([nodeClassName isEqualToString:@"CCParticleSystem"])
		{
			node = (CCNode*)[SKEmitterNode node];
		}

		NSAssert1(node, @"CCBReader: class named '%@' does not exist", nodeClassName);
	}

#if DEBUG
	NSLog(@" ");
	if ([node class] != NSClassFromString(nodeClassName))
	{
		NSLog(@"~~~~~~~~~~~~~~~~~~ %@ aka %@ (%@) - %p ~~~~~~~~~~~~~~~~~~", nodeClassName, NSStringFromClass([node class]), NSStringFromClass([node superclass]), node);
	}
	else
	{
		NSLog(@"~~~~~~~~~~~~~~~~~~ %@ (%@) - %p ~~~~~~~~~~~~~~~~~~", nodeClassName, NSStringFromClass([node superclass]), node);
	}
#endif

	return node;
}

-(void) setSceneSize:(CGSize)sceneSize
{
	CCBSpriteKitReaderSceneSize = sceneSize;
	animationManager.rootContainerSize = [CCDirector sharedDirector].designSize;
}

-(CGSize) sceneSize
{
	NSAssert(CGSizeEqualToSize(CCBSpriteKitReaderSceneSize, CGSizeZero) == NO, @"CCBSpriteKitReader: scene size must be assigned before loading a CCBi");
	return CCBSpriteKitReaderSceneSize;
}

-(CCScene*) createScene
{
	NSAssert(CGSizeEqualToSize(CCBSpriteKitReaderSceneSize, CGSizeZero) == NO,
			 @"CCBReader scene size not set! Use: [CCBReader setSceneSize:kkView.bounds.size]; to set scene size before loading the first scene.");
	
	return [SKScene sceneWithSize:CCBSpriteKitReaderSceneSize];
}

#pragma mark CCReader Load overrides

-(void) readerDidLoadNode:(CCNode*)node
{
	[node postProcessAfterLoadFromCCB];
	
	for (CCNode* childNode in node.children)
	{
		[self readerDidLoadNode:childNode];
	}
}

-(CCNode*) nodeGraphFromFile:(NSString*) file owner:(id)o parentSize:(CGSize)parentSize
{
	CCNode* node = [super nodeGraphFromFile:file owner:o parentSize:parentSize];
	[self readerDidLoadNode:node];
	return node;
}

#pragma mark Property Overrides

-(void) readerDidSetSpriteFrame:(CCSpriteFrame*)spriteFrame node:(CCNode*)node
{
	[node setValue:[NSValue valueWithSize:spriteFrame.size] forKey:@"size"];
}

@end
