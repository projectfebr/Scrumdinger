//
//  ErrorWrapper.swift
//  Scrumdinger
//
//  Created by Александр Болотов on 08.04.2024.
//

import Foundation

struct ErrorWrapper: Identifiable {
    let id: UUID
    let error: Error
    let guidance: String
    
    init(id: UUID = UUID(), error: Error, guidance: String) {
        self.id = id
        self.error = error
        self.guidance = guidance
    }

}
