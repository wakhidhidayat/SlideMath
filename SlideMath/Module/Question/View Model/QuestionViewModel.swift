//
//  QuestionViewModel.swift
//  SlideMath
//
//  Created by Wahid Hidayat on 13/04/23.
//

import Foundation

class QuestionViewModel: ObservableObject {
    @Published var questions = [Question]()
    
    private let useCase = QuestionInjection().getUseCase()
    
    func getQuestions() {
        questions = useCase.getQuestions()
    }
}
