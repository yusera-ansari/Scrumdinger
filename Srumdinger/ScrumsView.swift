//
//  ScrumsView.swift
//  Srumdinger
//
//  Created by Abcom on 21/07/25.
//

//SwiftUI automatically adds the Back button in the detail view and fills in the title of the previous screen.
import SwiftUI

struct ScrumsView: View {
    let scrums : [DailyScrum]
    var body: some View {
        NavigationStack{
         
                List(scrums){ scrum in
                    
                    NavigationLink(destination: Text(scrum.title)) {
                    CardView(scrum: scrum)
                       
                } .listRowBackground(scrum.theme.mainColor)
                         
            }
                .navigationTitle("Daily Scrum")
                .navigationBarTitleDisplayMode(.large)
                .toolbar{
                    Button{}label: {
                        Image(systemName: "plus")
                    }.accessibilityLabel("New Scrum")
                }
        }
    }
}

#Preview {
    let scrums = DailyScrum.sampleData
    ScrumsView(scrums: scrums)
}
