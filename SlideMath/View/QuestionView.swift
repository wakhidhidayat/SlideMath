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
                HStack() {
                    Spacer()
                    Slider(value: $value, in: -40...40, step: 1)
                        .frame(width: 200.0, height: 20)
                        .tint(Color.blue)
                        .scaleEffect(x: 1, y:10, anchor: .center)
                        .cornerRadius(50)
                        .rotationEffect(.degrees(-90.0))
                        .scaledToFit()
                    
                }
                Spacer()
                Spacer()
                HStack{
                    Button(action: {
                        print("hint")
                    }) {
                        Image("hint_button")
                    }
                    Spacer()
                }
                PrimaryButton(title: "Submit", isDisabled: currentQuestion == 0) {
                    // TODO: Submit
                }
                Spacer()
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }.ignoresSafeArea()
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
