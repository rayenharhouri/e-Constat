//
//  canvasView.swift
//  e-Constat
//
//  Created by Rayen_Mezen on 6/12/2022.
//

import UIKit

struct TouchPointAndColor {
    
    var color: UIColor?
    var width: CGFloat?
    var opacity: CGFloat?
    var ponits: [CGPoint]?
    
    init(color: UIColor, ponits: [CGPoint]) {
        self.color = color
        self.ponits = ponits
    }
    
}

class CanvasView: UIView
{
    var lines = [TouchPointAndColor]()
    var strokeWidth: CGFloat = 1.0
    var strokeColor: UIColor = .black
    var strokeOpacity: CGFloat = 1.0
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        lines.forEach {(line) in
            for (i,p) in (line.ponits?.enumerated())!{
                
                if i == 0 {
                    context.move(to: p)
                }else{
                    context.addLine(to: p)
                }
                context.setStrokeColor(line.color?.withAlphaComponent(line.opacity ?? 1.0).cgColor ?? UIColor.black.cgColor)
                context.setLineWidth(line.width ?? 2.0)
                
              
            }
            context.setLineCap(.round)
            context.strokePath()
        }
            
    }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            lines.append(TouchPointAndColor(color: UIColor(), ponits: [CGPoint]()))
        }
        
        override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
            guard let touch = touches.first?.location(in: nil) else{
                
                
                return
            }
            
            
            guard var lastPoint = lines.popLast() else {
                return
            }
            lastPoint.ponits?.append(touch)
            lastPoint.color = strokeColor
            lastPoint.width = 5.0
            lastPoint.opacity = 5.0
            lines.append(lastPoint)
            setNeedsDisplay()
        }
        
    func clearCanvasView(){
        lines.removeAll()
        setNeedsDisplay()
    }
    
    func undoDraw(){
        if lines.count > 0 {
            lines.removeLast()
            setNeedsDisplay()
        }
    }
        
    }
