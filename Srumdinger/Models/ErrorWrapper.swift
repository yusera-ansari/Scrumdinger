//
//  ErrorWrapper.swift
//  Srumdinger
//
//  Created by Abcom on 23/07/25.
//
import Foundation
struct ErrorWrapper : Identifiable {
    var id : UUID
    let error: Error
      let guidance: String
    init(id: UUID=UUID(), error: Error, guidance: String) {
        self.id = id
        self.error = error
        self.guidance = guidance
    }
}
