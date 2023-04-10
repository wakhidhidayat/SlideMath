//
//  QuestionView.swift
//  SlideMath
//
//  Created by Agfid Prasetyo on 06/04/23.
//

import SwiftUI

struct QuestionView: View {
    var question: [String] = ["Sebuah kapal selam menyelam hingga ke kedalaman 40 meter di bawah permukaan laut.", "Kemudian, kapal selam tersebut kembali menyelam sejauh 60 meter. Maka posisi kapal selam sekarang berada pada kedalaman?"]
    @State var currentQuestion: Int = 0
    @State var value = 0.0
    var body: some View {
        ZStack() {
            VStack() {
                Spacer()
                Image("background_question").resizable().scaledToFit()
            }
            ZStack {
                VStack(spacing: 50) {
                    HStack(alignment: .top) {
                        Image("back_button")
                        Spacer()
                        Image("help_button")
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
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                }
                
                VStack(spacing: 20) {
                    Spacer()
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    HStack{
                        Button(action: {
                            print("hint")
                        }) {
                            Image("hint_button")
                        }
                        .padding(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        Spacer()
                    }
                    
                    
                    PrimaryButton(title: "Submit", isDisabled: currentQuestion == 0) {
                        // TODO: Submit
                    }
                    Spacer()
                    Spacer()
                }
            }
        }.ignoresSafeArea()
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
