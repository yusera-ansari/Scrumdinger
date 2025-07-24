//
//  SpeakerArc.swift
//  Srumdinger
//
//  Created by Abcom on 24/07/25.
//

import SwiftUI
//The Shape protocol requires a path(in:) function. The compiler generates an error until you add that function in the next step.


struct SpeakerArc : Shape {
    let speakerIndex:Int
    let totalSpeakers:Int
    private var degreesPerSpeaker: Double {
           360.0 / Double(totalSpeakers)
       }
    private var endAngle:Angle{
        Angle(degrees: startAngle.degrees + degreesPerSpeaker - 1.0)
    }
    private var startAngle: Angle {
           Angle(degrees: degreesPerSpeaker * Double(speakerIndex) + 1.0)
       }
      func path(in rect: CGRect) -> Path {
          let diameter = min(rect.size.width, rect.size.height ) - 24.0
          let radius = diameter / 2.0
          let center = CGPoint(x: rect.midX, y:rect.midY)
          
          return Path{
              path in
              path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
              //              The Path initializer takes a closure that passes in a path parameter.
//          The path(in:) function takes a CGRect parameter. The coordinate system contains an origin in the lower left corner, with positive values extending up and to the right.
          }
    }
}

