//
//  MapView.swift
//  SlideMath
//
//  Created by Wahid Hidayat on 11/04/23.
//

import SwiftUI

struct MapView: View {
    private let viewModel = QuestionViewModel()
    var questionUnlocked: Int
    @State private var selectedQuestion = 0
    @State private var isNavigationActive = false
    
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
                                    isNavigationActive = true
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
                                    selectedQuestion = 1
                                    isNavigationActive = true
                                } label: {
                                    Image(questionUnlocked < 1 ? "second_fish_locked" : "second_fish")
                                        .padding()
                                }
                                .disabled(questionUnlocked < 1)
                            }
                            
                            HStack {
                                Spacer()
                                Image("second_bubble")
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 50))
                            }
                            
                            HStack {
                                Spacer()
                                
                                Button {
                                    selectedQuestion = 2
                                    isNavigationActive = true
                                } label: {
                                    Image(questionUnlocked < 2 ? "third_fish_locked" : "third_fish")
                                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 50))
                                }
                                .disabled(questionUnlocked < 2)
                            }
                        }
                    }
                }
                .ignoresSafeArea()
                
                VStack {
                    Image("title_map")
                }
            }.navigationDestination(isPresented: $isNavigationActive) {
                QuestionView(question: viewModel.questions[selectedQuestion])
            }
            .navigationBarBackButtonHidden()
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(questionUnlocked: 1)
    }
}
