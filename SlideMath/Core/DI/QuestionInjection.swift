//
//  QuestionInjection.swift
//  SlideMath
//
//  Created by Wahid Hidayat on 20/08/23.
//

import Foundation

class QuestionInjection {
    private func getRepo() -> QuestionRepository {
        let dataSource = QuestionDataSourceImpl.shared
        return QuestionRepositoryImpl.shared(dataSource)
    }
    
    func getUseCase() -> QuestionUseCase {
        let repo = getRepo()
        return QuestionUseCaseImpl(repository: repo)
    }
}
