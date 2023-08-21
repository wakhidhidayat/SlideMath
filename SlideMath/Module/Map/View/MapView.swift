//
//  MapView.swift
//  SlideMath
//
//  Created by Wahid Hidayat on 11/04/23.
//

import SwiftUI
import AVFoundation

struct MapView: View {
    @ObservedObject var viewModel: MapViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                Spacer()
                ZStack(alignment: .topLeading) {
                    Image("background_map")
                        .resizable()
                        .frame(height: 80 / 100 * UIScreen.main.bounds.size.height)
                    
                    VStack {
                        HStack {
                            Button {
                                viewModel.isNavigationActive = true
                            } label: {
                                Image("first_fish")
                                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 0))
                            }
                            
                            Spacer()
                        }
                        
                        Image("first_bubble")
                        
                        HStack {
                            Spacer()
                            
                            Button {
                                viewModel.selectedQuestion = 1
                                viewModel.isNavigationActive = true
                            } label: {
                                Image(viewModel.questionUnlocked < 1 ? "second_fish_locked" : "second_fish")
                                    .padding()
                            }
                            .disabled(viewModel.questionUnlocked < 1)
                        }
                        
                        HStack {
                            Spacer()
                            Image("second_bubble")
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 50))
                        }
                        
                        HStack {
                            Spacer()
                            
                            Button {
                                viewModel.selectedQuestion = 2
                                viewModel.isNavigationActive = true
                            } label: {
                                Image(viewModel.questionUnlocked < 2 ? "third_fish_locked" : "third_fish")
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 50))
                            }
                            .disabled(viewModel.questionUnlocked < 2)
                        }
                    }
                }
            }
            .ignoresSafeArea()
            
            VStack {
                Image("title_map")
            }
        }
        .navigationDestination(isPresented: $viewModel.isNavigationActive) {
            QuestionView(viewModel: QuestionViewModel(selectedQuestion: viewModel.selectedQuestion))
        }
        .navigationBarBackButtonHidden()
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(viewModel: MapViewModel(questionUnlocked: 1))
    }
}
