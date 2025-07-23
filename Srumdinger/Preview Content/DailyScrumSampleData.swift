//
//  DailyScrumSampleData.swift
//  Srumdinger
//
//  Created by Abcom on 23/07/25.
//

import Foundation
import SwiftData
import SwiftUI

//To conform to the PreviewModifier protocol, you need to define a makeSharedContext() method.



struct DailyScrumSampleData: PreviewModifier {
    static func makeSharedContext() async throws -> ModelContainer {
         let container = try ModelContainer(for: DailyScrum.self, configurations: .init(isStoredInMemoryOnly: true))
         DailyScrum.sampleData.forEach { container.mainContext.insert($0) }
         return container
     }
    func body(content: Content, context: ModelContainer) -> some View {
         content.modelContainer(context)
     }
}
//A container manages storage in SwiftData. When you fetch or save data, the container performs the reading and writing of underlying data using information from the schema that you established in your SwiftData models.
extension PreviewTrait where T == Preview.ViewTraits {
    @MainActor static var dailyScrumsSampleData: Self = .modifier(DailyScrumSampleData())
}
