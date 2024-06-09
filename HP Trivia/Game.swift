//
//  Game.swift
//  HP Trivia
//
//  Created by Bogusz Kaszowski on 09/06/2024.
//

import Foundation

@MainActor
class Game: ObservableObject {
    private var allQuestions: [Question] = []
    private var answeredQuestions: [Int] = []

    var filteredQuestions: [Question] = []
    var currentQuestion = Constants.previewQuestion
    
    
    init() {
        decodeQuestions()
    }
    
    func filterQuestions(to books: [Int]) {
        filteredQuestions = allQuestions.filter { books.contains($0.book) }
    }
    
    func newQuestion() {
        if filteredQuestions.isEmpty {
            return
        }
        
        if answeredQuestions.count == filteredQuestions.count {
            answeredQuestions = []
        }
        
        var potentialQuestion = filteredQuestions.randomElement()!
        
        while answeredQuestions.contains(potentialQuestion.id) {
            potentialQuestion = filteredQuestions.randomElement()!
        }
        
        currentQuestion = potentialQuestion
    }
    
    private func decodeQuestions() {
        if let url = Bundle.main.url(forResource: "trivia", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                allQuestions = try decoder.decode([Question].self, from: data)
                filteredQuestions = allQuestions
            } catch {
                print("Error decoding JSON data: \(error)")
            }
        }
    }
}
