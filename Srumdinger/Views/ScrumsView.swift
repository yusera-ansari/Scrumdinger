//
//  ScrumsView.swift
//  Srumdinger
//
//  Created by Abcom on 21/07/25.
//

//SwiftUI automatically adds the Back button in the detail view and fills in the title of the previous screen.
import SwiftUI
import SwiftData

struct ScrumsView: View {
    @Query(sort: \DailyScrum.title) private var scrums: [DailyScrum]
    
    @State private var isPresentingNewScrum = false;
    var body: some View {
        NavigationStack{
            //            The List view passes a scrum into its closure, but the DetailView initializer expects a binding to a scrum. You’ll use array binding syntax to retrieve a binding to an individual scrum. To use array binding syntax in SwiftUI, you’ll pass a binding to an array into a List.
            
                List(scrums){ scrum in
                    
                    NavigationLink(destination: DetailView(scrum: scrum)) {
                    CardView(scrum: scrum)
                       
                } .listRowBackground(scrum.theme.mainColor)
                         
            }//list end
                .navigationTitle("Daily Scrum")
                .navigationBarTitleDisplayMode(.large)
                .toolbar{
                    Button{
                        isPresentingNewScrum = true
                    }label: {
                        Image(systemName: "plus")
                    }.accessibilityLabel("New Scrum")
                }//toolbar
                .sheet(isPresented: $isPresentingNewScrum){
                    NewScrumSheet()
                }
        }//navigation stack
    }
}

#Preview (traits: .dailyScrumsSampleData){
//    @Previewable @State var scrums = DailyScrum.sampleData
    ScrumsView()
}
