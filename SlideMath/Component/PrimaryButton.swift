//
//  PrimaryButton.swift
//  SlideMath
//
//  Created by Wahid Hidayat on 06/04/23.
//

import SwiftUI

struct PrimaryButton: View {
    var title: String
    var isDisabled: Bool = false
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(isDisabled ? .buttonTextDisabled : .buttonText)
        }
        .frame(width: UIScreen.main.bounds.width - 40, height: 52)
        .background(isDisabled ? Color.buttonDisabled : Color.buttonColor)
        .cornerRadius(16)
        .disabled(isDisabled)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(title: "Halo") {
            print("hello")
        }
    }
}
