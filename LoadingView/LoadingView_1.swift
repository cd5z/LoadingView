//
//  LoadingView_1.swift
//  LoadingView
//
//  Created by LiChendi on 16/3/11.
//  Copyright © 2016年 LiChendi. All rights reserved.
//

import UIKit

class LoadingView_1: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let font = CTFontCreateWithName("SnellRoundhand", 50, nil)
        let attrStr = NSAttributedString(string: "loading", attributes: [kCTFontAttributeName as String: font])
        let line = CTLineCreateWithAttributedString(attrStr)
        
        let linesNS: NSArray = CTLineGetGlyphRuns(line)
        let linesAO: [AnyObject] = linesNS as [AnyObject]
        let lines: [CTRunRef] = linesAO as! [CTRunRef]
        
        let letters = CGPathCreateMutable()
        
        for runIndex in 0..<CFArrayGetCount(lines) {
            let run: CTRunRef = lines[runIndex]
            for runGlyphIndex in 0..<CTRunGetGlyphCount(run) {
                let thisGlyphRange = CFRangeMake(runGlyphIndex, 1)
                var glyph: CGGlyph = CGGlyph()
                var position: CGPoint = CGPoint()
                CTRunGetGlyphs(run, thisGlyphRange, &glyph)
                CTRunGetPositions(run, thisGlyphRange, &position)
                
                let letter = CTFontCreatePathForGlyph(font, glyph, nil)
                var t = CGAffineTransformMakeTranslation(position.x, position.y)
                
                CGPathAddPath(letters, &t, letter)
            }
        }
        
        
        let path = UIBezierPath()
        path.moveToPoint(CGPoint.zero)
        path.appendPath(UIBezierPath(CGPath: letters))
        
        let pathLayer = CAShapeLayer()
        pathLayer.frame = CGRect(origin: CGPoint.zero, size: frame.size)
        pathLayer.bounds = CGPathGetBoundingBox(path.CGPath)
        pathLayer.geometryFlipped = true
        pathLayer.path = path.CGPath
        pathLayer.strokeColor = UIColor(red: 234.0/255, green: 84.0/255, blue: 87.0/255, alpha: 1).CGColor
        
        pathLayer.fillColor = nil
        pathLayer.lineWidth = 3.0
        pathLayer.lineJoin = kCALineJoinBevel
        
        self.layer.addSublayer(pathLayer)
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.duration = 5
        animation.repeatCount = MAXFLOAT
        
        pathLayer.addAnimation(animation, forKey: "storkeEnd")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
