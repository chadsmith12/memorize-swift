//
//  Pie.swift
//  Memorize
//
//  Created by Chad Smith on 6/6/21.
//

import SwiftUI

struct Pie: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockWise: Bool = true
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let midPoint = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: midPoint.x + radius * CGFloat(cos(startAngle.radians)),
            y: midPoint.y + radius * CGFloat(sin(startAngle.radians))
        )
        
        path.move(to: midPoint)
        path.addLine(to: start)
        path.addArc(center: midPoint, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockWise)
        path.addLine(to: midPoint)
        return path
    }
    
    
}
