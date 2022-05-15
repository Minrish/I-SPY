//
//  ViewConstant.swift
//  I Spy
//
//  Created by Bert Yan on 4/16/22.
//

import Foundation
import SwiftUI

struct ViewConstants {
    
    // Textual constants
    static let title1stline : String = "I "
    static let title2ndline : String = "SPY"
    
    static let option1title : String = "Show me around!"
    static let option2title : String = "Choose a picture!"
    
    // Shadow constants
    static let shadowRadius: CGFloat = 20.0
    
    // Background constants
    static let backgroundGradient = LinearGradient(
        colors: [Color.black.opacity(0.90), Color.black.opacity(0.90)],
        startPoint: .top, endPoint: .bottom)
}

