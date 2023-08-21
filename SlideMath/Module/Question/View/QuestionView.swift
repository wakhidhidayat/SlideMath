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
    @ObservedObject var viewModel: QuestionViewModel
    
    var body: some View {
        ZStack {
            VStack {
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
                    
                    ProgressView(
                        value: Double(viewModel.currentText + 1),
                        total: viewModel.questions.isEmpty ? 0 : Double(viewModel.questions[viewModel.selectedQuestion].texts.count)
                    )
                        .tint(Color.blue)
                        .listRowSeparator(.visible)
                        .listRowSeparatorTint(Color.blue)
                        .listSectionSeparator(.visible)
                        .listSectionSeparatorTint(Color.blue)
                        .background(Color(.white))
                        .frame(width: 300, height: 23)
                        .scaleEffect(x: 1, y: 24, anchor: .center)
                        .cornerRadius(64)
                    Text(viewModel.questions.isEmpty ? "" : viewModel.questions[viewModel.selectedQuestion].texts[viewModel.currentText])
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("green_text"))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack {
                    Spacer()
                    Spacer()
                    HStack(alignment: .center, spacing: 30) {
                        Button(action: {
                            viewModel.currentText = viewModel.currentText != 0 ? viewModel.currentText - 1 : viewModel.currentText
                        }) {
                            Image(viewModel.currentText == 0 ? "back_quest_inactive" : "back_quest_active")
                        }
                        Button(action: {
                            viewModel.currentText = viewModel.currentText == viewModel.questions[viewModel.selectedQuestion].texts.count-1 ? viewModel.currentText : viewModel.currentText + 1
                        }) {
                            if viewModel.questions.isEmpty == false {
                                Image(viewModel.currentText == viewModel.questions[viewModel.selectedQuestion].texts.count-1 ? "next_quest_inactive" : "next_quest_active")
                            }
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
                
                CustomSlider(value: $viewModel.valueSlider, range: (0, 100), hint: $viewModel.hint)
                
                VStack(spacing: 20) {
                    Spacer()
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    HStack {
                        Button {
                            if viewModel.questions[viewModel.selectedQuestion].answer > -50 {
                                viewModel.hint = .top
                            } else {
                                viewModel.hint = .bottom
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
                    .hidden(viewModel.questions.isEmpty ? false : viewModel.currentText != viewModel.questions[viewModel.selectedQuestion].texts.count - 1)
                    
                    PrimaryButton(
                        title: "Submit",
                        isDisabled: viewModel.questions.isEmpty ? false : viewModel.currentText != viewModel.questions[viewModel.selectedQuestion].texts.count - 1
                    ) {
                        viewModel.isNavigationActive = true
                    }
                }
            }
        }.navigationDestination(isPresented: $viewModel.isNavigationActive) {
            if viewModel.questions.isEmpty == false {
                ResultView(
                    isQuestionViewActive: $viewModel.isNavigationActive,
                    viewModel: ResultViewModel(
                        currentQuestion: viewModel.questions[viewModel.selectedQuestion].number,
                        result: viewModel.valueSlider == Double(viewModel.questions[viewModel.selectedQuestion].answer) ? .correct : .incorrect,
                        videoFileName: viewModel.questions[viewModel.selectedQuestion].videoFileName
                    )
                )
                .navigationBarBackButtonHidden(true)
            }
        }
        .addSpotLightOverlay(show: $viewModel.showSpotLight, currentSpot: $viewModel.currentSpot, position: .bottom)
        .onAppear {
            viewModel.getQuestions()
            if !viewModel.spotlightShown {
                viewModel.showSpotLight = true
                viewModel.spotlightShown = true
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(viewModel: QuestionViewModel(selectedQuestion: 0))
    }
}
