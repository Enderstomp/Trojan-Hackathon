//
//  FirstView.swift
//  Trojan Hackathon
//
//  Created by Owen Fahringer on 12/19/24.
//

import SwiftUI

struct FirstChapter: View {
    @ObservedObject var chapter1State = Chapter1State()
    @State private var goesToGame1: Bool = false
    @State private var hardMode: Bool? = false

    var body: some View {
        NavigationStack {
            VStack {
                Text("Character: \(chapter1State.character[chapter1State.i])")
                    .padding()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(style: StrokeStyle(lineWidth: 1))
                        .frame(width: 330, height: 100)
                    Text("\(chapter1State.messages[chapter1State.i])")
                        .padding()
                        .foregroundColor(.black)
                }
                
                HStack {
                    Button {
                        handleOptionSelection(increaseHonorBy: 1)
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: 180, height: 50)
                                .foregroundStyle(.black)
                                .opacity(0.4)
                            Text("\(chapter1State.option1[chapter1State.i])")
                                .foregroundStyle(.black)
                        }
                    }
                    
                    Button {
                        handleOptionSelection(increaseHonorBy: 2)
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: 180, height: 50)
                                .foregroundStyle(.black)
                                .opacity(0.4)
                            Text("\(chapter1State.option2[chapter1State.i])")
                                .foregroundStyle(.black)
                        }
                    }
                }
                
                HStack {
                    Button {
                        handleOptionSelection(increaseHonorBy: 0)
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: 180, height: 50)
                                .foregroundStyle(.black)
                                .opacity(0.4)
                            Text("\(chapter1State.option3[chapter1State.i])")
                                .foregroundStyle(.black)
                        }
                    }
                    
                    Button {
                        handleOptionSelection(increaseHonorBy: -2)
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: 180, height: 50)
                                .foregroundStyle(.black)
                                .opacity(0.4)
                            Text("\(chapter1State.option4[chapter1State.i])")
                                .foregroundStyle(.black)
                        }
                    }
                }
            }
            .navigationDestination(isPresented: $goesToGame1) {
                TypingView(hardMode: self.hardMode ?? false)
            }
        }
    }
    
    func handleOptionSelection(increaseHonorBy honorChange: Int) {
        chapter1State.i += 1
        chapter1State.honor += honorChange
        
        // When chapter1State.i reaches 2, check the conditions to navigate
        if chapter1State.i == 3 {
            hardMode = shouldGoToHardMode() // Update the hardMode flag based on game logic
            goesToGame1 = true // Trigger navigation
        }
    }
    
    func shouldGoToHardMode() -> Bool {
        // Determine whether the game should go to hard mode based on the honor value
        if chapter1State.honor >= 3 {
            return false // Normal mode
        } else if chapter1State.honor > 0 {
            return false // Normal mode
        } else {
            return true // Hard mode
        }
    }
}

#Preview {
    FirstChapter()
}
