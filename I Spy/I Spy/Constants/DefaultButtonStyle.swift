//
//  DefaultButtonStyle.swift
//  I Spy
//
//  Created by Bert Yan on 4/16/22.
//

import SwiftUI

let option1Gradient = LinearGradient(
    colors: [Color.mint.opacity(0.60), Color.blue.opacity(0.60)],
    startPoint: .leading, endPoint: .bottom)

let option2Gradient = LinearGradient(
    colors: [Color.blue.opacity(0.60), Color.indigo.opacity(0.60)],
    startPoint: .leading, endPoint: .bottom)

let optionResetGradient = LinearGradient(
    colors: [Color.indigo.opacity(0.60), Color.mint.opacity(0.60)],
    startPoint: .leading, endPoint: .bottom)


// Button style presets
struct Option1ButtonStyle: ButtonStyle {
 
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.system(size: 30, weight: .bold, design: .rounded))
            .padding(.horizontal)
            .padding(.horizontal)
            .padding(.horizontal)
            .padding(.horizontal)
            .padding(.horizontal)
            .padding(.horizontal)
            .padding()
            .background(Capsule()
                            .strokeBorder(option1Gradient, lineWidth: 40)
                            .shadow(radius: ViewConstants.shadowRadius)
                            )
            .foregroundColor(.white)
    }
}

struct Option2ButtonStyle: ButtonStyle {
 
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.system(size: 30, weight: .bold, design: .rounded))
            .padding(.horizontal)
            .padding(.horizontal)
            .padding(.horizontal)
            .padding()
            .background(Capsule()
                            .strokeBorder(option2Gradient, lineWidth: 40)
                            .shadow(radius: ViewConstants.shadowRadius)
                            )
            .foregroundColor(.white)
    }
}

struct ResetButtonStyle: ButtonStyle {
 
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.system(size: 30, weight: .bold, design: .rounded))
            .padding(.horizontal)
            .padding(.horizontal)
            .padding(.horizontal)
            .padding(.horizontal)
            .padding(.horizontal)
            .padding(.horizontal)
            .padding()
            .background(Capsule()
                            .strokeBorder(optionResetGradient, lineWidth: 40)
                            .shadow(radius: ViewConstants.shadowRadius)
                            )
            .foregroundColor(.white)
    }
}

