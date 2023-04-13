//
//  QuestionView.swift
//  SlideMath
//
//  Created by Agfid Prasetyo on 06/04/23.
//

import SwiftUI

enum Position {
    case top
    case center
    case bottom
}

struct QuestionView: View {
    
//    var question: [String] = ["Sebuah kapal selam menyelam hingga ke kedalaman 40 meter di bawah permukaan laut.", "Kemudian, kapal selam tersebut kembali menyelam sejauh 60 meter. Maka posisi kapal selam sekarang berada pada kedalaman?"]
    var question: [String] = ["Sebuah kapal selam berada di kedalaman 80 meter dibawah laut.", "Ternyata kondisi arus laut deras. Oleh karena itu, kapal dinaikkan 40 meter dari posisi semula.", "Tentukan dimana posisi kapal selam sekarang?"]
    @State private var isNavigationActive = false
    @State var currentQuestion: Int = 0
    @State var value = 0.0
    @State var valueSlider = 0.0

    @State var showSpotLight: Bool = false
    @State var currentSpot: Int = 0
    @State var position: Position = .top
    
    var body: some View {
        NavigationStack {
            ZStack() {
                VStack() {
                    Spacer()
                    Image("background_question").resizable().scaledToFit()
                }.ignoresSafeArea()
                ZStack {
                    VStack(spacing: 50) {
                        HStack(alignment: .top) {
                            Button {
                                print("back")
                            } label: {
                                Image("back_button")
                            }
                            Spacer()
                            Button {
                                print("help")
                            } label: {
                                Image("help_button")
                            }
                            .addSpotlight(0, shape: .rounded, roundedRadius: 10, text: """
    For walkthrough
    """, position: .top)

                                
                        }
                        
                        ProgressView(value: Double(currentQuestion+1), total: Double(question.count))
                            .tint(Color.blue)
                            .listRowSeparator(.visible)
                            .listRowSeparatorTint(Color.blue)
                            .listSectionSeparator(.visible)
                            .listSectionSeparatorTint(Color.blue)
                            .background(Color(.white))
                            .frame(width: 300, height: 23)
                            .scaleEffect(x: 1, y: 24, anchor: .center)
                            .cornerRadius(64)
                        Text(question[currentQuestion]).font(.title2).fontWeight(.semibold).foregroundColor(Color("green_text")).multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                        Spacer()
                    }
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    VStack {
                        Spacer()
                        Spacer()
                        HStack(alignment: .center, spacing: 30) {
                            Button(action: {
                                currentQuestion = currentQuestion != 0 ? currentQuestion - 1 : currentQuestion
                            }) {
                                Image(currentQuestion == 0 ? "back_quest_inactive" : "back_quest_active")
                            }
                            Button(action: {
                                currentQuestion = currentQuestion == question.count-1 ? currentQuestion : currentQuestion + 1
                            }) {
                                Image(currentQuestion == question.count-1 ? "next_quest_inactive" : "next_quest_active")
                            }
                            .addSpotlight(2, shape: .circle, roundedRadius: 30, text: """
    Next Question
    """, position: .top)
                            
                        }
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                    
                    CustomSlider(value: $valueSlider, range: (0, 100))

                    VStack(spacing: 20) {
                        Spacer()
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        HStack{
                            Button {
                                print("back")
                            } label: {
                                Image("hint_button")
                            }
                            .padding(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                            .addSpotlight(1, shape: .circle, roundedRadius: 50, text: """
    Hint
    """, position: .bottom)
                            Spacer()
                        }
                        
                        
                        PrimaryButton(title: "Submit", isDisabled: currentQuestion != question.count - 1) {
                            isNavigationActive = true
                            print("isNavigation: ", isNavigationActive)
                        }

                        Spacer()
                        Spacer()
                    }.ignoresSafeArea()
                }
            }.navigationDestination(isPresented: $isNavigationActive) {
                ResultView(result: valueSlider == Double(-40) ? .correct : .incorrect).navigationBarBackButtonHidden(true)
            }
                .addSpotLightOverlay(show: $showSpotLight, currentSpot: $currentSpot, position: .bottom)
                .onAppear {
                    showSpotLight = true
                }
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
