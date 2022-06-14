//
//  SimpleButtonView.swift
//  WeatherIOSApp
//
//  Created by Lucas Romero Magaña on 14/6/22.
//

import SwiftUI

struct SimpleButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
