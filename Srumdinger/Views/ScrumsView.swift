//
//  ScrumsView.swift
//  Srumdinger
//
//  Created by Abcom on 21/07/25.
//

//SwiftUI automatically adds the Back button in the detail view and fills in the title of the previous screen.
import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    var body: some View {
        NavigationStack{
            //            The List view passes a scrum into its closure, but the DetailView initializer expects a binding to a scrum. You’ll use array binding syntax to retrieve a binding to an individual scrum. To use array binding syntax in SwiftUI, you’ll pass a binding to an array into a List.
            
                List($scrums){ $scrum in
                    
                    NavigationLink(destination: DetailView(scrum: $scrum)) {
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
    @Previewable @State var scrums = DailyScrum.sampleData
    ScrumsView(scrums: $scrums)
}
