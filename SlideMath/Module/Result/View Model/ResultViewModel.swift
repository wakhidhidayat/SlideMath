//
//  ResultViewModel.swift
//  SlideMath
//
//  Created by Wahid Hidayat on 20/08/23.
//

import Foundation

class ResultViewModel: ObservableObject {
    @Published var isNavigationActive = false
    @Published var isSheetPresent = false
    
    let currentQuestion: Int
    let result: ResultType
    let videoFileName: String?
    
    init(currentQuestion: Int, result: ResultType, videoFileName: String?) {
        self.currentQuestion = currentQuestion
        self.result = result
        self.videoFileName = videoFileName
    }
}
