//
//  QuestionRepository.swift
//  SlideMath
//
//  Created by Wahid Hidayat on 20/08/23.
//

import Foundation

protocol QuestionRepository {
    func getQuestions() -> [Question]
}

class QuestionRepositoryImpl: QuestionRepository {
    private var questionDataSource: QuestionDataSource
    static let shared: (QuestionDataSource) -> QuestionRepository = { ds in
        return QuestionRepositoryImpl(questionDataSource: ds)
    }
    
    private init(questionDataSource: QuestionDataSource) {
        self.questionDataSource = questionDataSource
    }
    
    func getQuestions() -> [Question] {
        questionDataSource.getQuestions()
    }
}
