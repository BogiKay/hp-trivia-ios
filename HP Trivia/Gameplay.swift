//
//  Gameplay.swift
//  HP Trivia
//
//  Created by Bogusz Kaszowski on 04/06/2024.
//

import SwiftUI

struct Gameplay: View {
    @State private var animateViewsIn = false
    @State private var tappedCorrectAnswer = false

    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("hogwarts")
                    .resizable()
                    .frame(width: geo.size.width * 3, height: geo.size.height * 1.05)
                    .overlay(Rectangle().foregroundColor(.black.opacity(0.8)))
                VStack {
                    // MARK: Controls
                    HStack {
                        Button("End game") {
                            
                        }
                            .buttonStyle(.borderedProminent)
                            .tint(.red.opacity(0.5))
                        
                        Spacer()
                        
                        Text("Score 33")
                    }
                    .padding()
                    .padding(.vertical, 30)
                    
                    // MARK: Question
                    VStack {
                        if animateViewsIn {
                            Text("Who is Harry Potter? Are you sure?")
                                .multilineTextAlignment(.center)
                                .padding()
                                .font(.custom(Constants.hpFont, size: 50))
                                .transition(.scale)
                        }
                    }
                    .animation(.easeInOut(duration: 2), value:  animateViewsIn)
                    
                    
                    
                    Spacer()

                    // MARK: Hints
                    HStack {
                        VStack {
                            if animateViewsIn {
                                Image(systemName: "questionmark.app.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100)
                                    .foregroundColor(.cyan)
                                    .rotationEffect(.degrees(-15))
                                    .padding()
                                    .transition(.offset(x: -geo.size.width / 2))
                            }
                        }
                        .animation(.easeOut(duration: 1.5).delay(2), value: animateViewsIn)
                        
                        Spacer()
                        
                        VStack {
                            if animateViewsIn {
                                
                                Image(systemName: "book.closed")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50)
                                    .foregroundColor(.black)
                                    .frame(width: 100, height: 100)
                                    .background(.cyan)
                                    .cornerRadius(20)
                                    .rotationEffect(.degrees(15))
                                    .padding()
                                    .transition(.offset(x: geo.size.width / 2))
                            }
                        }
                        .animation(.easeOut(duration: 1.5).delay(2), value: animateViewsIn)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom)

                    // MARK: Answers
                    LazyVGrid(columns: [GridItem(), GridItem()], content: {
                        ForEach(0..<4) { i in
                            VStack {
                                if animateViewsIn {
                                    Text(i == 3 ? "The boy who basically lived and got sent to his relatives house where he was treated quite badly if I'm being honest" : "Answer \(i) ")
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.center)
                                        .padding(10)
                                        .frame(width: geo.size.width / 2.15, height: 80)
                                        .background(.green.opacity(0.5))
                                        .clipShape(.rect(cornerRadius: 25))
                                        .transition(.scale)
                                }
                            }
                            .animation(.easeOut(duration: 1).delay(1.5), value: animateViewsIn)
                        }
                    })
                    Spacer()
                }
                .frame(width: geo.size.width, height: geo.size.height)
                .foregroundColor(.white)
                
                // MARK: Celebration
                VStack {
                    Spacer()
                    
                    VStack {
                        if (tappedCorrectAnswer) {
                            
                            Text("5")
                                .font(.largeTitle)
                                .padding(.top, 50)
                                .transition(.offset(y: -geo.size.height / 4))
                        }
                    }           
                    .animation(.easeInOut(duration: 1).delay(2), value: tappedCorrectAnswer)
                    
                    
                    Spacer()
                    
                    VStack {
                        if (tappedCorrectAnswer) {
                            Text("Brilliant!")
                                .font(.custom(Constants.hpFont, size: 100))
                                .transition(.scale.combined(with: .offset(y: -geo.size.height / 2)))
                        }
                    }
                    .animation(.easeInOut(duration: 1).delay(1), value: tappedCorrectAnswer)
                    
                    
                    Spacer()
                    
                    Text("Answer 1")
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: geo.size.width / 2.15, height: 80)
                        .background(.green.opacity(0.5))
                        .clipShape(.rect(cornerRadius: 25))
                        .scaleEffect(2)
                    
                    Spacer()
                    Spacer()
                    
                    VStack {
                        if tappedCorrectAnswer {
                            Button("Next Level >") {
                                    // TOOD: reset level
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(.blue.opacity(0.5))
                            .font(.largeTitle)
                            .transition(.offset(y: geo.size.height / 3))
                        }
                    }
                    .animation(.easeInOut(duration: 2.7).delay(2.7), value: tappedCorrectAnswer)
                    
                    
                    Group {
                        Spacer()
                        Spacer()
                    }
                    
                }
                .foregroundColor(.white)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
        .onAppear {
//            animateViewsIn = true
            tappedCorrectAnswer = true
        }
    }
}

#Preview {
    Gameplay()
}
