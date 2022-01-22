//
//  TextView.swift
//  SpaceNews
//
//  Created by Federico on 22/01/2022.
//

import Foundation
import UIKit
import SwiftUI

// NOT USED IN THE PROJECT, JUST FOR EXPERIMENTATION PURPOSES

struct TextView: UIViewRepresentable {
    var text: String
    var textAlignmentStyle : TextAlignmentStyle
    var width: CGFloat

    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.textAlignment = NSTextAlignment(rawValue: textAlignmentStyle.rawValue)!
        label.numberOfLines = 0
        label.preferredMaxLayoutWidth = width
        label.setContentHuggingPriority(.required, for: .horizontal)
        label.setContentHuggingPriority(.required, for: .vertical)

        return label
    }

    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = text
    }
}

enum TextAlignmentStyle : Int{
     case left = 0 ,center = 1 , right = 2 ,justified = 3 ,natural = 4
}
