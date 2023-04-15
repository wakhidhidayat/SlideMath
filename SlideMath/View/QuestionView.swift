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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var question: Question
    
    @State private var isNavigationActive = false
    @State private var currentText: Int = 0
    @State private var value = 0.0
    @State private var valueSlider = 0.0
    
    @State private var showSpotLight: Bool = false
    @State private var currentSpot: Int = 0
    @State private var position: Position = .top
    @State private var hint: Hint?
    
    var body: some View {
        ZStack() {
            VStack() {
                Spacer()
                Image("background_question").resizable().scaledToFit()
            }
            .ignoresSafeArea()
            
            ZStack {
                VStack(spacing: 40) {
                    HStack(alignment: .top) {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image("back_button")
                        }
                        Spacer()
                        Button {
                            // TODO: Show Walkthrough
                        } label: {
                            Image("help_button")
                        }
                        .addSpotlight(0, shape: .rounded, roundedRadius: 10, text: """
    For walkthrough
    """, position: .top)
                        
                        
                    }
                    
                    ProgressView(value: Double(currentText+1), total: Double(question.texts.count))
                        .tint(Color.blue)
                        .listRowSeparator(.visible)
                        .listRowSeparatorTint(Color.blue)
                        .listSectionSeparator(.visible)
                        .listSectionSeparatorTint(Color.blue)
                        .background(Color(.white))
                        .frame(width: 300, height: 23)
                        .scaleEffect(x: 1, y: 24, anchor: .center)
                        .cornerRadius(64)
                    Text(question.texts[currentText]).font(.title2).fontWeight(.semibold).foregroundColor(Color("green_text")).multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack {
                    Spacer()
                    Spacer()
                    HStack(alignment: .center, spacing: 30) {
                        Button(action: {
                            currentText = currentText != 0 ? currentText - 1 : currentText
                        }) {
                            Image(currentText == 0 ? "back_quest_inactive" : "back_quest_active")
                        }
                        Button(action: {
                            currentText = currentText == question.texts.count-1 ? currentText : currentText + 1
                        }) {
                            Image(currentText == question.texts.count-1 ? "next_quest_inactive" : "next_quest_active")
                        }
                        .addSpotlight(2, shape: .circle, roundedRadius: 30, text: """
    Next Question
    """, position: .top)
                        
                    }
                    .padding(.top, 25)
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                
                CustomSlider(value: $valueSlider, range: (0, 100), hint: $hint)
                
                VStack(spacing: 20) {
                    Spacer()
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    HStack{
                        Button {
                            if question.answer > -50 {
                                hint = .top
                            } else {
                                hint = .bottom
                            }
                        } label: {
                            Image("hint_button")
                        }
                        .padding(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        .addSpotlight(1, shape: .circle, roundedRadius: 50, text: """
    Hint
    """, position: .bottom)
                        Spacer()
                    }
                    .hidden(currentText != question.texts.count - 1)
                    
                    
                    PrimaryButton(title: "Submit", isDisabled: currentText != question.texts.count - 1) {
                        isNavigationActive = true
                    }
                }
            }
        }.navigationDestination(isPresented: $isNavigationActive) {
            ResultView(isQuetionViewActive: $isNavigationActive, currentQuestion: question.number, result: valueSlider == Double(question.answer) ? .correct : .incorrect).navigationBarBackButtonHidden(true)
        }
        .addSpotLightOverlay(show: $showSpotLight, currentSpot: $currentSpot, position: .bottom)
        .onAppear {
            showSpotLight = true
        }
        .navigationBarBackButtonHidden()
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: QuestionViewModel().questions[0])
    }
}
