//
//  MeetingHeaderView.swift
//  Srumdinger
//
//  Created by Abcom on 22/07/25.
//

import SwiftUI
import ThemeKit
import TimerKit

struct MeetingHeaderView: View {
    let secondsElapsed: Int
       let secondsRemaining: Int
    let theme:Theme
    private var totalSeconds: Int {
           secondsElapsed + secondsRemaining
       }
       private var progress: Double {
           guard totalSeconds > 0 else { return 1 }
           return Double(secondsElapsed) / Double(totalSeconds)
       }
    private var minutesRemaining: Int {
          secondsRemaining / 60
      }
    var body: some View {
  
        VStack{
            ProgressView(  value: progress)
                .progressViewStyle(ScrumProgressViewStyle(theme: theme))
            
            HStack{
                VStack(alignment: .leading ){
                    Text("Seconds Elapsed").font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment:.trailing){
                    Text("Seconds Remaining").font(.caption)
                    Label( "\(secondsRemaining)", systemImage: "hourglass.bottomhalf.fill")
                        .labelStyle(.trailingIcon)
                }
            }//hstack
          }//vstack
            .padding([.top, .horizontal])
            .accessibilityElement(children: .ignore)
                .accessibilityLabel("Time Remaining")
                .accessibilityValue("\(minutesRemaining) minutes")
            
        
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    MeetingHeaderView(secondsElapsed: 60, secondsRemaining: 180, theme: Theme.bubblegum)
}
