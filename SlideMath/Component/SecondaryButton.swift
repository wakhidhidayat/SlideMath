//
//  SecondaryButton.swift
//  SlideMath
//
//  Created by Wahid Hidayat on 06/04/23.
//

import SwiftUI

struct SecondaryButton: View {
    enum ButtonWidth {
        case full
        case half
    }
    
    var title: String
    var buttonWidth: ButtonWidth = .full
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
        }
        .frame(width: buttonWidth == .full ? UIScreen.main.bounds.width - 40 : UIScreen.main.bounds.width / 2 - 40, height: 52)
        .cornerRadius(16)
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.buttonColor, lineWidth: 2))
    }}

struct SecondaryButton_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryButton(title: "test", action: {})
    }
}
