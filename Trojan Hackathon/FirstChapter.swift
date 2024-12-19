//
//  FirstView.swift
//  Trojan Hackathon
//
//  Created by Owen Fahringer on 12/19/24.
//

import SwiftUI

struct FirstChapter:View{
    @State var i: Int = 0
    @State var character: [String] = ["Penelop", "Calypso", "Polyphemus"]
    @State var messages: [String] = ["Hey can we talk about something?", ""] //
    @State var option1: [String] = ["No thanks"] //Kind
    @State var option2: [String] = ["Sure!", "Alright!"] //Affirmative
    @State var option3: [String] = ["Maybe later..."]//Neutral
    @State var option4: [String] = ["No!"] //Aggresive
    @State var honor: Int = 0
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 15)
                    .stroke(style: StrokeStyle(lineWidth: 1))
                    .frame(width:300, height:100)
                Text("\(messages[i])")
            }
            HStack{
                Button {
                    i += 1
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width:180, height:50)
                            .foregroundStyle(.black)
                            .opacity(0.4)
                        Text("\(option1[i])")
                            .foregroundStyle(.black)
                    }
                }
                Button {
                    
                } label: {
                    ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width:180, height:50)
                        .foregroundStyle(.black)
                        .opacity(0.4)
                    Text("\(option2[i])")
                            .foregroundStyle(.black)
                }
                }
            }
            HStack{
                Button {
                    
                } label: {
                    ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width:180, height:50)
                        .foregroundStyle(.black)
                        .opacity(0.4)
                    Text("\(option3[i])")
                        .foregroundStyle(.black)
                }
                }
                Button {
                    
                } label: {
                    ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width:180, height:50)
                        .foregroundStyle(.black)
                        .opacity(0.4)
                        Text("\(option4[i])")
                        .foregroundStyle(.black)
                    }
                }
            }
        }
    }
    func CheckChapter() {
    
    }
}
#Preview{
    FirstChapter()
}
