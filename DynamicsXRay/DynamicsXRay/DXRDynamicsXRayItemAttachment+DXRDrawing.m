//
//  DXRDynamicsXRayItemAttachment+DXRDrawing.m
//  DynamicsXRay
//
//  Created by Chris Miles on 2/10/13.
//  Copyright (c) 2013 Chris Miles. All rights reserved.
//

#import "DXRDynamicsXRayItemAttachment+DXRDrawing.h"
#import "DXRDynamicsXRayUtil.h"


@implementation DXRDynamicsXRayItemAttachment (DXRDrawing)

- (void)drawInContext:(CGContextRef)context
{
    CGFloat anchorCircleRadius = 2.0f;
    CGContextAddEllipseInRect(context, CGRectMake(self.anchorPoint.x - anchorCircleRadius, self.anchorPoint.y - anchorCircleRadius, anchorCircleRadius*2.0f, anchorCircleRadius*2.0f));
    CGContextDrawPath(context, kCGPathFill);
    
    CGContextAddEllipseInRect(context, CGRectMake(self.attachmentPoint.x - anchorCircleRadius, self.attachmentPoint.y - anchorCircleRadius, anchorCircleRadius*2.0f, anchorCircleRadius*2.0f));
    CGContextDrawPath(context, kCGPathStroke);
    
    CGContextMoveToPoint(context, self.anchorPoint.x, self.anchorPoint.y);
    
    CGContextSaveGState(context);
    
    if (self.isSpring) {
        // Spring attachments are drawn as dashed lines
        CGFloat lineLength = DXRCGPointDistance(self.anchorPoint, self.attachmentPoint);
        CGFloat itemLength = (self.length > 0 ? self.length : 1.0f);
        CGFloat lineDiff = lineLength / itemLength;
        CGFloat dashSize = fmaxf(0.5f, 3.0f * lineDiff);
        const CGFloat dashPattern[2] = {dashSize, dashSize};
        CGContextSetLineDash(context, 3, dashPattern, 2);
    }
    
    CGContextAddLineToPoint(context, self.attachmentPoint.x, self.attachmentPoint.y);
    CGContextStrokePath(context);
    
    CGContextRestoreGState(context);
}

@end
