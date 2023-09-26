//
//  WeatherButton.swift
//  WeatherTutorial
//
//  Created by Wuqiong Fan on 9/25/23.
//

import SwiftUI

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .font(.system(size: 20, weight: .bold, design: .default))
            .background(backgroundColor.gradient)
            .foregroundColor(textColor)
            .cornerRadius(10)
    }
}
