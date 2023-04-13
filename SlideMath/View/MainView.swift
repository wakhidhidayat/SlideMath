//  MainView.swift
//
//  Created by Stiven on 11/04/23.
//

import SwiftUI

struct MainView: View {
    
    @State private var isNavigate = false
    
    var body: some View {
        NavigationStack {
            ZStack{ Color(.white).edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                        .frame(height: 120)
                    VStack(spacing: 15){
                        Image("logo")
                            .resizable(capInsets: EdgeInsets())
                            .frame(width: 300, height: 225)
                        Text("Belajar operasi bilangan negatif dengan menyenangkan!")
                            .fontWeight(.light)
                            .font(.title2)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal,35)
                        
                    }
                    Spacer()
                        .frame(height:230)
                    
                    
                    Button{
                        isNavigate.toggle()
                    }
                label: {
                    Text("Mulai")
                        .font(.system(.title) .weight(.semibold))
                        .frame(width: 230, height: 50)
                        .foregroundColor(.white)
                    
                }
                .navigationDestination(isPresented: $isNavigate){
                    MapView(currentSoal: 1).navigationBarBackButtonHidden(true)
                        .navigationBarHidden(false)
                }
                .buttonStyle(.borderedProminent)
                .tint(.orange)
                .buttonBorderShape(.roundedRectangle(radius: 18))
                    
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
