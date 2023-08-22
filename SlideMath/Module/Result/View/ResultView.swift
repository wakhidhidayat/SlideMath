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
    @Binding var isQuestionViewActive: Bool
    @ObservedObject var viewModel: ResultViewModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 100) {
                Spacer()
                
                Text(viewModel.result == .correct ? "Yeay Kamu Benar!🥳" : "Yahh Kamu Salah!😣")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(Color("blue_text"))
                
                Image(viewModel.result == .correct ? "background_success" : "background_failed")
                    .resizable()
                    .frame(height: 500)
            }
            .ignoresSafeArea()
            
            VStack(spacing: 24) {
                PrimaryButton(title: "Lihat penjelasan, yuk!") {
                    viewModel.isSheetPresent = true
                }
                
                switch viewModel.result {
                case .correct:
                    SecondaryButton(title: "Lanjut") {
                        viewModel.isNavigationActive = true
                    }
                case .incorrect:
                    SecondaryButton(title: "Ulang") {
                        isQuestionViewActive = false
                    }
                }
            }
        }
        .navigationDestination(isPresented: $viewModel.isNavigationActive) {
            if viewModel.currentQuestion <= 1 {
                MapView(viewModel: MapViewModel(
                    questionUnlocked: viewModel.result == .correct ? viewModel.currentQuestion + 1 : viewModel.currentQuestion)
                )
            } else {
                MapView(viewModel: MapViewModel(
                    questionUnlocked: viewModel.result == .correct ? viewModel.currentQuestion : viewModel.currentQuestion)
                )
            }
            
        }
        .sheet(isPresented: $viewModel.isSheetPresent) {
            ExplanationView(fileName: viewModel.videoFileName)
        }
        .onAppear {
            switch viewModel.result {
            case .correct:
                AudioManager.shared.playSound(sound: "correct", type: "mp3")
            case .incorrect:
                AudioManager.shared.playSound(sound: "wrong", type: "mp3")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                AudioManager.shared.playSound(sound: "play", type: "mp3")
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(
            isQuestionViewActive: .constant(false),
            viewModel: ResultViewModel(currentQuestion: 0, result: .incorrect, videoFileName: "answer1")
        )
    }
}
