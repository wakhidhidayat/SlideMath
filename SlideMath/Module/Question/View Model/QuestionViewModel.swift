//
//  QuestionViewModel.swift
//  SlideMath
//
//  Created by Wahid Hidayat on 13/04/23.
//

import SwiftUI

class QuestionViewModel: ObservableObject {
    @Published var questions = [Question]()
    @Published var isNavigationActive = false
    @Published var currentText: Int = 0
    @Published var value = 0.0
    @Published var valueSlider = 0.0
    @Published var showSpotLight: Bool = false
    @Published var currentSpot: Int = 0
    @Published var position: Position = .top
    @Published var hint: Hint?
    @AppStorage("spotlightShown") var spotlightShown: Bool = false
    var selectedQuestion: Int
    
    init(selectedQuestion: Int) {
        self.selectedQuestion = selectedQuestion
    }
    
    private let useCase = QuestionInjection().getUseCase()
    
    func getQuestions() {
        questions = useCase.getQuestions()
    }
}
