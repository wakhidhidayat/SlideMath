//
//  ResultView.swift
//  SlideMath
//
//  Created by Wahid Hidayat on 06/04/23.
//

import SwiftUI

enum ResultType{
    case correct
    case incorrect
}

struct ResultView: View {
    @State private var isNavigationActive = false
    @Binding var isQuetionViewActive: Bool
    
    let currentQuestion: Int
    let result: ResultType

    var body: some View {
            ZStack(alignment: .bottom) {
                VStack(spacing: 100) {
                    Spacer()
                    
                    Text(result == .correct ? "Yeay Kamu Benar!🥳" : "Yahh Kamu Salah!😣")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(Color("blue_text"))
                    
                    Image(result == .correct ? "background_success" : "background_failed")
                        .resizable()
                        .frame(height: 500)
                }
                .ignoresSafeArea()
                
                VStack(spacing: 24) {
                    PrimaryButton(title: "Lihat penjelasan, yuk!") {
                        // TODO: Show penjelasan
                    }
                    
                    switch result {
                    case .correct:
                        SecondaryButton(title: "Lanjut") {
                            isNavigationActive = true
                        }
                    case .incorrect:
                        SecondaryButton(title: "Ulang") {
                            isQuetionViewActive = false
                        }
                    }
                }
            }.navigationDestination(isPresented: $isNavigationActive) {
                if currentQuestion <= 1 {
                    MapView(questionUnlocked: result == .correct ? currentQuestion + 1 : currentQuestion)
                } else {
                    MapView(questionUnlocked: result == .correct ? currentQuestion : currentQuestion)
                }

            }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(isQuetionViewActive: .constant(false), currentQuestion: 0, result: .incorrect)
    }
}
