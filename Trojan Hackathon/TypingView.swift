//
//  Typing.swift
//  Trojan Hackathon
//
//  Created by Aditya Joshi on 12/19/24.
//
import SwiftUI

struct TypingView: View {
    var hardMode: Bool
    
    @State var goToSecondView: Bool = false
    @State var correct = 0
    @State var wrong = 0
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var thoseWhoKnowCountdown = 30
    @State var thoseWhoKnowTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var countdown: Int
    
    var words = [
        "Zeus", "Hera", "Poseidon", "Athena", "Apollo", "Artemis", "Ares", "Demeter",
        "Hermes", "Hestia", "Persephone", "Hades", "Hephaestus", "Hercules", "Achilles",
        "Odysseus", "Medusa", "Cyclops", "Minotaur", "Cerberus", "Elysium", "Titan",
        "Prometheus", "Pandora", "Chimera", "Sisyphus", "Orpheus", "Theseus", "Icarus",
        "Narcissus", "Echo", "Thetis", "Cassandra", "Atlas", "Medea", "Calypso", "Chiron",
        "Leda", "Pegasus", "Herculean", "Arachne", "Orpheus", "Antigone", "Helios",
        "Selene", "Nyx", "Gaia", "Uranus", "Cronus", "Rhea", "Eros", "Pygmalion", "Asclepius"
    ]
    
    @State var currentWord: String
    @State var enteredWord: String = ""
    @FocusState private var isFieldFocused: Bool
    
    init(hardMode: Bool) {
        currentWord = words.randomElement()!
        self.hardMode = hardMode
        self.countdown = if hardMode { 3 } else { 5 }
    }
    
    var body: some View {
        NavigationStack{
            VStack {
                Text("\(thoseWhoKnowCountdown)")
                Text(currentWord).font(.largeTitle)
                Text("\(countdown)").font(.title)
                TextField("Enter something", text: $enteredWord).onSubmit {
                    if (enteredWord == currentWord){
                        correct += 1
                    } else {
                        wrong += 1
                    }
                    timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                    countdown = if hardMode { 3 } else { 5 }
                    enteredWord = ""
                    currentWord = words.randomElement()!
                    isFieldFocused = true
                }.multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
                    .focused($isFieldFocused)
                    .autocorrectionDisabled()
                Text("\(correct) \(wrong)")
                
            }.onReceive(timer) { time in
                if countdown > 1 {
                    countdown -= 1
                } else {
                    if (enteredWord == currentWord){
                        correct += 1
                    } else {
                        wrong += 1
                    }
                    enteredWord = ""
                    currentWord = words.randomElement()!
                    countdown = if hardMode { 3 } else { 5 }
                }
            }.onReceive(thoseWhoKnowTimer) { time in
                if thoseWhoKnowCountdown > 0 {
                    thoseWhoKnowCountdown -= 1
                } else {
                    goToSecondView = true
                    print(correct - wrong)
                }
            }
        }
        .navigationDestination(isPresented: $goToSecondView) {
            SecondChapter()
        }
    }
}

#Preview {
    TypingView(hardMode: true)
}
