//
//  Classes.swift
//  Trojan Hackathon
//
//  Created by Evan Hatton on 12/19/24.
//

import SwiftUI

class Chapter1State: ObservableObject {
    @Published var i: Int = 0
    @Published var character: [String] = ["Penelope", "Penelope", "Penelope",""]
    @Published var messages: [String] = ["Odyssus Why are you leaving on a journey without me?", "What would I do without you?", "We Have A Son Together",""]
    @Published var option1: [String] = ["I want to protect you and our future generations", "I will be back soon,Please take care of our son ", "As my son he will be strong enough to protect you", ""]  // Kind
    @Published var option2: [String] = ["To Protect our sons's future!", "I trust you can protect our son and domain", "He will grow up strong with or without me", ""]  // Affirmative
    @Published var option3: [String] = ["To slay the traitorous Trojans", "Do what you wish", "If he is my son he will succeed", ""]  // Neutral
    @Published var option4: [String] = ["To get away from you!", "Why are you so clingy, Lets not be together anymore", "He is dead to me", ""]  // Aggressive
    @Published var honor: Int = 0
}
class Chapter2State: ObservableObject {
    @Published var i: Int = 0
    @Published var character: [String] = ["Story", "Story", "Story","wip"]
    @Published var messages: [String] = ["*you intend to raise your soldier's morale what do you do?*", "You encounter a vile gorgon: Medusa What do you do?", "Filler",""]
    @Published var option1: [String] = ["Let them rest", "Do research kill it", "wip", ""]  // Kind
    @Published var option2: [String] = ["Give a speech", "Face it alone", "wip", ""]  // Affirmative
    @Published var option3: [String] = ["Train them", "Fight them with your soldiers", "wip", ""]  // Neutral
    @Published var option4: [String] = ["Beat them to instill fear", "Sacrifice your soldiers so you can escape", "wip.", ""]  // Aggressive
    @Published var honor: Int = 0
}
struct checkForI{
//    @ObservedObject var chapter1State = Chapter1State()
//    func AdvanceChapter1() -> Bool{
//        if(chapter1State.i == 2){
//            if(chapter1State.honor >= 3){
//                return false
//            }else if(chapter1State.honor > 0){
//                return false
//            }else {
//                return true
//            }
//            
//        }
//        return true
//    }
}
