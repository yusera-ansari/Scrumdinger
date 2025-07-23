//
//  ErrorView.swift
//  Srumdinger
//
//  Created by Abcom on 23/07/25.
//

import SwiftUI

struct ErrorView: View {
    let errorWrapper :ErrorWrapper
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("An error has occurred!")
                    .font(.title)
                    .padding(.bottom)
                Text(errorWrapper.error.localizedDescription)
                               .font(.headline)
                Text(errorWrapper.guidance)
                               .font(.caption)
                               .padding(.top)
                Spacer()
                }//vstack
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(14)
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing, content: {
                        Button("dismiss"){
                            dismiss()
                        }
                    })
                }
        }//nav stack
     
    }
}
private enum SampleError: Error {
    case errorRequired
}
#Preview {
    ErrorView(errorWrapper: ErrorWrapper(error: SampleError.errorRequired, guidance: "You can safely ignore this error"))
}
