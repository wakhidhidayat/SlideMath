//
//  QuestionUseCase.swift
//  SlideMath
//
//  Created by Wahid Hidayat on 20/08/23.
//

import Foundation

protocol QuestionUseCase {
    func getQuestions() -> [Question]
}

class QuestionUseCaseImpl: QuestionUseCase {
    private let repository: QuestionRepository
    
    init(repository: QuestionRepository) {
        self.repository = repository
    }
    
    func getQuestions() -> [Question] {
        repository.getQuestions()
    }
}
