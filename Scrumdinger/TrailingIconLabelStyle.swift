//
//  TrailingIconLabelStyle.swift
//  Scrumdinger
//
//  Created by Александр Болотов on 07.04.2024.
//

import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
               configuration.title
               configuration.icon
        }
    }

}

extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self { Self() }
}
