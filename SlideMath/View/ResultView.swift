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
    let result: ResultType

    var body: some View {
        NavigationStack {
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
                            // TODO: Navigate to next soal
                            isNavigationActive = true
                        }
                    case .incorrect:
                        HStack(spacing: 30) {
                            SecondaryButton(title: "Ulang", buttonWidth: .half) {
                                // TODO: Back to previous soal
                            }
                            
                            SecondaryButton(title: "Lanjut", buttonWidth: .half) {
                                // TODO: Navigate to next soal
                                isNavigationActive = true
                            }
                        }
                    }
                }
            }.navigationDestination(isPresented: $isNavigationActive) {
                MapView(currentQuestion: result == .correct ? 2 : 1).navigationBarBackButtonHidden(true)
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(result: .correct)
    }
}
