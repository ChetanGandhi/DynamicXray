//
//  DXRDynamicsXRayView.h
//  DynamicsXRay
//
//  Created by Chris Miles on 4/08/13.
//  Copyright (c) 2013 Chris Miles. All rights reserved.
//

@import UIKit;

@interface DXRDynamicsXRayView : UIView

- (void)drawAttachmentFromAnchor:(CGPoint)anchorPoint toPoint:(CGPoint)attachmentPoint length:(CGFloat)length isSpring:(BOOL)isSpring;

- (void)drawBoundsCollisionBoundaryWithRect:(CGRect)boundaryRect;

- (void)drawGravityBehaviorWithMagnitude:(CGFloat)magnitude angle:(CGFloat)angle;

- (void)drawDynamicItems:(NSSet *)dynamicItems withReferenceView:(UIView *)referenceView;

- (CGPoint)convertPoint:(CGPoint)point fromReferenceView:(UIView *)referenceView;

@property (assign, nonatomic) UIOffset drawOffset;

@property (assign, nonatomic) BOOL allowsAntialiasing;

@end