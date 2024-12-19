//
//  SecondChapter.swift
//  Trojan Hackathon
//
//  Created by Evan Hatton on 12/19/24.
//

import SwiftUI

struct SecondChapter: View {
    @ObservedObject var chapter2State = Chapter2State()
    @State private var goesToGame1: Bool = false
    @State private var hardMode: Bool? = false

    var body: some View {
        NavigationStack {
            VStack {
                Text("Character: \(chapter2State.character[chapter2State.i])")
                    .padding()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(style: StrokeStyle(lineWidth: 1))
                        .frame(width: 330, height: 100)
                    Text("\(chapter2State.messages[chapter2State.i])")
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
                            Text("\(chapter2State.option1[chapter2State.i])")
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
                            Text("\(chapter2State.option2[chapter2State.i])")
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
                            Text("\(chapter2State.option3[chapter2State.i])")
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
                            Text("\(chapter2State.option4[chapter2State.i])")
                                .foregroundStyle(.black)
                        }
                    }
                }
            }
            .navigationDestination(isPresented: $goesToGame1) {
                FicshCopy()
            }
        }
    }
    
    func handleOptionSelection(increaseHonorBy honorChange: Int) {
        chapter2State.i += 1
        chapter2State.honor += honorChange
        
        // When chapter2State.i reaches 2, check the conditions to navigate
        if chapter2State.i == 3 {
            hardMode = shouldGoToHardMode() // Update the hardMode flag based on game logic
            goesToGame1 = true // Trigger navigation
        }
    }
    
    func shouldGoToHardMode() -> Bool {
        // Determine whether the game should go to hard mode based on the honor value
        if chapter2State.honor >= 3 {
            return false // Normal mode
        } else if chapter2State.honor > 0 {
            return false // Normal mode
        } else {
            return true // Hard mode
        }
    }
}

#Preview {
    SecondChapter()
}
