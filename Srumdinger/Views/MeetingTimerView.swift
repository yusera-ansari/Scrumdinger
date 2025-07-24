//
//  MeetingTimerView.swift
//  Srumdinger
//
//  Created by Abcom on 24/07/25.
//

import SwiftUI
import ThemeKit
import TimerKit

struct MeetingTimerView: View {
    var theme:Theme;
    let isRecording: Bool
    var speakers: [ScrumTimer.Speaker]
    private var currentSpeaker:String {
        speakers.first(where: { !$0.isCompleted})?.name ?? "Someone"
    }
    
    var body: some View {
        Circle()
            .strokeBorder(lineWidth: 24)
//        Draws the stroke only inside the shape’s boundary.
            .overlay(content: {
                VStack{
                    Text(currentSpeaker)
                        .font(.title)
                    Text("is speaking")
                    Image(systemName: isRecording ? "mic" : "mic.slash")
                        .font(.title)
                        .padding(.top)
                        .accessibilityLabel(isRecording ? "with transcription" : "without transcription")
                }  .accessibilityElement(children: .combine)
                    .foregroundStyle(theme.accentColor)
//                Because the default alignment for an overlay is .centered, adding a text view to a layer in front of the circle makes the text appear in the center of the circle.
            })//overlay
            .overlay{
                ForEach(speakers){
                    speaker in
                    if speaker.isCompleted, let index = speakers.firstIndex(where: {$0.id == speaker.id}) {
                        SpeakerArc(speakerIndex: index, totalSpeakers: speakers.count)
                            .rotation(Angle(degrees: -90))
                             
                            .stroke(theme.mainColor, lineWidth: 12)
//                        The stroke line is half inside and half outside the shape’s boundary.
                    }
                }
            }
            .padding(.horizontal)
        
    }
}

#Preview {
    let speakers = [ScrumTimer.Speaker(name: "Bill", isCompleted: true), ScrumTimer.Speaker(name: "Cathy", isCompleted: false)]
 
    MeetingTimerView(theme: .yellow, isRecording: true, speakers: speakers)
}
