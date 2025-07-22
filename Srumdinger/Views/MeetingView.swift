//
//  ContentView.swift
//  Srumdinger
//
//  Created by Abcom on 21/07/25.
//

import SwiftUI
import TimerKit
import AVFoundation

struct MeetingView: View {
    private let player = AVPlayer.dingPlayer()
    @State var scrumTimer = ScrumTimer()
    @Binding var scrum : DailyScrum
    var body: some View {
     
        ZStack{
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.theme.mainColor)
            VStack{
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed,
                                                secondsRemaining: scrumTimer.secondsRemaining,
                                                theme: scrum.theme)
                Circle().strokeBorder(lineWidth: 24)
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
                      
            }//vstack
        }//zstack
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear{
            scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendeeNames: scrum.attendees.map { $0.name })
            scrumTimer.speakerChangedAction = {
                player.seek(to: .zero)
                player.play()
//                Seeking to time .zero ensures that the audio file always plays from the beginning.
                       }
            scrumTimer.startScrum()
        }
        .onDisappear{
            scrumTimer.stopScrum()
        }
        
    }
}

#Preview {
    @Previewable @State var scrum = DailyScrum.sampleData[0]
    MeetingView(scrum:$scrum)
}
