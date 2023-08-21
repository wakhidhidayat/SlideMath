//  MainView.swift
//
//  Created by Stiven on 11/04/23.
//

import SwiftUI

struct MainView: View {
    @State private var isNavigate = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.white).edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                        .frame(height: 120)
                    VStack(spacing: 15) {
                        Image("logo")
                            .resizable(capInsets: EdgeInsets())
                            .frame(width: 300, height: 225)
                        Text("Belajar operasi bilangan negatif dengan menyenangkan!")
                            .fontWeight(.light)
                            .font(.title2)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 35)
                        
                    }
                    Spacer()
                        .frame(height: 230)
                    PrimaryButton(title: "Mulai") {
                        isNavigate.toggle()
                    }
                    .navigationDestination(isPresented: $isNavigate) {
                        MapView(viewModel: MapViewModel(questionUnlocked: 0))
                    }
                }
            }
        }
        .onAppear {
            AudioManager.shared.playSound(sound: "play", type: "mp3")
        }
        .preferredColorScheme(.light)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
