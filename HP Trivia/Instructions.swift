//
//  Instructions.swift
//  HP Trivia
//
//  Created by Bogusz Kaszowski on 26/05/2024.
//

import SwiftUI

struct Instructions: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            InfoBackgroundImage()
            
            VStack {
                Image("appiconwithradius")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .padding(.top)
                
                ScrollView {
                    Text("How to Play")
                        .font(.largeTitle)
                        .padding()
                    VStack(alignment: .leading) {
                        Text("Welcome to HP Trivia! In this game, you will be asked random questions from the HP books and you must guess the right answer or you will loose points!😱")
                            .padding([.horizontal, .bottom])
                        
                        Text("Each question is worth 5 points, but if you guess a wrong answer, you loose 1 point.")
                            .padding([.horizontal, .bottom])
                        
                        Text("If you are struggling with a question, there is an option to reveal a hint or reveal the book that answers the question. But beware! Using these also minuses 1 point each.")
                            .padding([.horizontal, .bottom])
                        
                        Text("When you select the correct answer, you will be awareded all the points left for that question and they will be aded to your total score.")
                            .padding(.horizontal)
                    }
                    .font(.title3)
                    
                    Text("Good luck!")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .padding(.top)
                }
                .foregroundColor(.black)
                
                Button("Dismiss") {
                    dismiss()
                }
                .doneButton()
            }
        }
    }
}

#Preview {
    Instructions()
}
