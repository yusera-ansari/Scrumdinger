//
//  SwiftUIView.swift
//  Srumdinger
//
//  Created by Abcom on 24/07/25.
//

import SwiftUI
struct HistoryView: View {
    let history: History


    var body: some View {
       
        ScrollView {
           
            VStack(alignment: .leading) {
                Divider()
                    .padding(.bottom)
                Text("Attendees")
                    .font(.headline)
                Text(history.attendeeString)
                    .onAppear {
                        print("Transcript is_:\(history.transcript)")
                }
             
                
                if let transcript = history.transcript {
                    
                    Text("Transcript")
                        .font(.headline)
                        .padding(.top)
                        . foregroundStyle(.black)
                    Text(transcript)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.black)
                        .onAppear {
                                 print("Transcript is: \(transcript)")
                             }
                }
            }
        }
        .navigationTitle(Text(history.date, style: .date))
        .padding()
        
    }
}


extension History {
    var attendeeString: String {
        ListFormatter.localizedString(byJoining: attendees.map { $0.name })
    }
}


#Preview {
    let history = History(attendees: [
        Attendee(name: "Jon"),
        Attendee(name: "Darla"),
        Attendee(name: "Luis")
    ],
                          transcript: "Darla, would you like to start today? Sure, yesterday I reviewed Luis' PR and met with the design team to finalize the UI...")
  

    NavigationStack{
        HistoryView(history: history).onAppear{
            print("transcript for history : \(history.transcript)")
        }
    }
}
