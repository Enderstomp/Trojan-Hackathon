//
//  Classes.swift
//  Trojan Hackathon
//
//  Created by Evan Hatton on 12/19/24.
//

import SwiftUI

class Chapter1State: ObservableObject {
    @Published var i: Int = 0
    @Published var character: [String] = ["Penelope", "Calypso", "Polyphemus",""]
    @Published var messages: [String] = ["Hey, can we talk about our relationship?", "Filler", "Filler",""]
    @Published var option1: [String] = ["No thanks", "Yeah", "Ok", ""]  // Kind
    @Published var option2: [String] = ["Sure!", "Alright!", "Of Course!", ""]  // Affirmative
    @Published var option3: [String] = ["Maybe later...", "Not now.", "No", ""]  // Neutral
    @Published var option4: [String] = ["No!", "Leave me alone.", "Get away.", ""]  // Aggressive
    @Published var honor: Int = 0
}
class Chapter2State: ObservableObject {
    @Published var i: Int = 0
    @Published var character: [String] = ["Penelope", "Calypso", "Polyphemus",""]
    @Published var messages: [String] = ["Hey, can we talk about our relationship?", "Filler", "Filler",""]
    @Published var option1: [String] = ["No thanks", "Yeah", "Ok", ""]  // Kind
    @Published var option2: [String] = ["Sure!", "Alright!", "Of Course!", ""]  // Affirmative
    @Published var option3: [String] = ["Maybe later...", "Not now.", "No", ""]  // Neutral
    @Published var option4: [String] = ["No!", "Leave me alone.", "Get away.", ""]  // Aggressive
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
