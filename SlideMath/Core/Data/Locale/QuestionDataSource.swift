//
//  QuestionDataSource.swift
//  SlideMath
//
//  Created by Wahid Hidayat on 20/08/23.
//

import Foundation

protocol QuestionDataSource {
    func getQuestions() -> [Question]
}

class QuestionDataSourceImpl: QuestionDataSource {
    private init() {}
    
    static let shared = QuestionDataSourceImpl()
    
    func getQuestions() -> [Question] {
        var questions = [
            Question(
                number: 0,
                texts: [
                    "Sebuah kapal selam turun ke bawah permukaan laut sedalam 30 meter.",
                    "Kemudian, ia kembali turun sejauh 60 meter.",
                    "Maka posisi kapal selam sekarang berada pada kedalaman?"
                ],
                answer: -90,
                videoFileName: "answer1"),
            Question(
                number: 1,
                texts: [
                    "Sebuah kapal selam berada di kedalaman 80 meter dibawah laut.",
                    "Ternyata kondisi arus laut deras. Oleh karena itu, kapal dinaikkan 40 meter dari posisi semula.",
                    "Dimana posisi kapal selam sekarang?"
                ],
                answer: -40,
                videoFileName: nil),
            Question(
                number: 2,
                texts: [
                    "Posisi semula kapal selam berada di kedalaman 90 meter dibawah permukaan laut.",
                    "Kemudian ia naik 70 meter untuk melakukan penelitian ikan paus.",
                    "Dimana posisi kapal selam saat ini?"
                ],
                answer: -20,
                videoFileName: nil)
        ]
        return questions
    }
}
