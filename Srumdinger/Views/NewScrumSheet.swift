//
//  NewScrumSheet.swift
//  Srumdinger
//
//  Created by Abcom on 23/07/25.
//

import SwiftUI


struct NewScrumSheet: View {
  
    
    var body: some View {
        NavigationStack{
            DetailEditView(scrum: nil)
        }
    }
}


#Preview {
    NewScrumSheet()
}
