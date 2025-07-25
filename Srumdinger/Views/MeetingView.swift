//
//  ContentView.swift
//  Srumdinger
//
//  Created by Abcom on 21/07/25.
//

import SwiftUI
import TimerKit
import AVFoundation
import SwiftData
import TranscriptionKit

struct MeetingView: View {
    @Environment(\.modelContext) private var context
    private let player = AVPlayer.dingPlayer()
    @State var scrumTimer = ScrumTimer()
    let scrum : DailyScrum
    var speechRecognizer : SpeechRecognizer = SpeechRecognizer()
    @Binding var errorWrapper: ErrorWrapper?
    @State private var isRecording = false;
    var body: some View {
     
        ZStack{
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.theme.mainColor)
            VStack{
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed,
                                                secondsRemaining: scrumTimer.secondsRemaining,
                                                theme: scrum.theme)
                MeetingTimerView(theme: scrum.theme, isRecording: isRecording, speakers: scrumTimer.speakers)
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
                      
            }//vstack
        }//zstack
        
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear{
       startScrum()
        }
        .onDisappear{
          do{
            try  stopScrum()
          }catch{
              errorWrapper = ErrorWrapper(error: error, guidance: "Meeting time was not recorded. Try again later.")
          }
        }
        
    }//view
    func stopScrum()throws{

        scrumTimer.stopScrum()
        isRecording = false
        speechRecognizer.stopTranscribing()
      let newHistory = History(attendees: scrum.attendees,
        transcript: speechRecognizer.transcript)
        scrum.history.insert(newHistory, at: 0);
        try context.save()
    }
    func startScrum(){
        scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendeeNames: scrum.attendees.map { $0.name })
        scrumTimer.speakerChangedAction = {
            player.seek(to: .zero)
            player.play()
//                Seeking to time .zero ensures that the audio file always plays from the beginning.
                   }
        speechRecognizer.startTranscribing()
        isRecording = true
        scrumTimer.startScrum()
    }
}

#Preview (traits: .dailyScrumsSampleData){
//    @Previewable @Query(sort: \DailyScrum.title) var scrums: [DailyScrum]
    let scrum = DailyScrum.sampleData[0]
    MeetingView(scrum: scrum,  errorWrapper: .constant(nil))
}
