//
//  ContentView.swift
//  Srumdinger
//
//  Created by Abcom on 21/07/25.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        
        VStack{
            ProgressView("Progress", value: 10, total: 15)
            HStack{
                VStack(alignment: .leading ){
                    Text("Sexonds Elapsed").font(.caption)
                    Label(  "300",  systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment:.trailing){
                    Text("Seconds Remaining").font(.caption)
                    Label( "600", systemImage: "hourglass.bottomhalf.fill")
                }
            }   .accessibilityElement(children: .ignore)
                .accessibilityLabel("Time Remaining")
                .accessibilityValue("10 minutes")
            
            Circle().strokeBorder(lineWidth: 24)
            HStack{
                Text("Speaker 1 of 3")
                Spacer()
                Button{}label: {
                    Image(systemName: "forward.fill")
                }.accessibilityLabel("Next Speaker")
            }
        }.padding()
        
    }
}

#Preview {
    MeetingView()
}
