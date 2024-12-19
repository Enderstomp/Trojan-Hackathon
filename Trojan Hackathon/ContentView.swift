//
//  ContentView.swift
//  Trojan Hackathon
//
//  Created by Owen Fahringer on 12/19/24.
//

import SwiftUI

struct ContentView: View { //hi
    var body: some View {
        NavigationStack {
            NavigationLink(destination: FirstChapter()){ //destination
                ZStack{
                    Rectangle()
                        .foregroundStyle(Color.black)
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                        Text("Adventures of Odysseus")
                            .foregroundStyle(.white)
                            .font(.title)
                        Spacer()
                    }
                    Image("Odysseus")
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
