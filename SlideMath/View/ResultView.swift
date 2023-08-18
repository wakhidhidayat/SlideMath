//
//  ResultView.swift
//  SlideMath
//
//  Created by Wahid Hidayat on 06/04/23.
//

import SwiftUI

enum ResultType {
    case correct
    case incorrect
}

struct ResultView: View {
    @State private var isNavigationActive = false
    @State private var isSheetPresent = false
    @Binding var isQuetionViewActive: Bool
    
    let currentQuestion: Int
    let result: ResultType
    let videoFileName: String?
    
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
                    isSheetPresent = true
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
        }
        .navigationDestination(isPresented: $isNavigationActive) {
            if currentQuestion <= 1 {
                MapView(questionUnlocked: result == .correct ? currentQuestion + 1 : currentQuestion)
            } else {
                MapView(questionUnlocked: result == .correct ? currentQuestion : currentQuestion)
            }
            
        }
        .sheet(isPresented: $isSheetPresent) {
            VideoView(fileName: videoFileName)
        }
        .onAppear {
            switch result {
            case .correct:
                playSound(sound: "correct", type: "mp3")
            case .incorrect:
                playSound(sound: "wrong", type: "mp3")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                playSound(sound: "play", type: "mp3")
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(
            isQuetionViewActive: .constant(false),
            currentQuestion: 0,
            result: .incorrect,
            videoFileName: "answer1"
        )
    }
}
