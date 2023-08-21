//
//  MapViewModel.swift
//  SlideMath
//
//  Created by Wahid Hidayat on 21/08/23.
//

import Foundation

class MapViewModel: ObservableObject {
    @Published var selectedQuestion = 0
    @Published var isNavigationActive = false
    
    var questionUnlocked: Int
    
    init(questionUnlocked: Int) {
        self.questionUnlocked = questionUnlocked
    }
}
