//
//  ReverseFlappyBird.swift
//  Trojan Hackathon
//
//  Created by Aditya Joshi on 12/19/24.
//
// we tried!!!!!!!!

import SwiftUI
import SpriteKit
extension UIScreen {
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
}

struct ReverseFlappyBirdView: View {
    @State private var x1 = CGFloat.random(in: -UIScreen.screenWidth / 2..<UIScreen.screenWidth / 2)
    @State private var x2 = CGFloat.random(in: -UIScreen.screenWidth / 2..<UIScreen.screenWidth / 2)
    @State private var x3 = CGFloat.random(in: -UIScreen.screenWidth / 2..<UIScreen.screenWidth / 2)
    @State private var y: CGFloat = 0
    @State private var animationDuration: Double = 4.0
    @State private var playerX = 0
    @State var score = 0
    
    var body: some View {
        VStack {
            Text("\(score)").font(.title)
            Image("Cannonball")
                .resizable()
                .frame(width: 30, height: 30)
                .offset(x: x1, y: y)
            Image("Cannonball")
                .resizable()
                .frame(width: 30, height: 30)
                .offset(x: x2, y: y)
            Image("Cannonball")
                .resizable()
                .frame(width: 30, height: 30)
                .offset(x: x3, y: y)
            Spacer()
            Rectangle().frame(width: 50, height: 50).offset(x: CGFloat(playerX), y: -20).animation(.default)
            HStack {
                Spacer()
                Button(action: {
                    playerX -= 20
                }) {
                    Image(systemName: "chevron.left")
                }
                Spacer()
                Button(action: {
                    playerX += 20
                }) {
                    Image(systemName: "chevron.right")
                }
                Spacer()
            }.background(.white)
                .font(.largeTitle)
        }
        .onAppear {
            startMoving()
            collideCheck()
        }
    }
    
    func collideCheck() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            print(x1, x2, x3, playerX)
            collideCheck()
        }
    }
    
    func startMoving() {
        y = 0
        
        withAnimation(.linear(duration: animationDuration).repeatForever(autoreverses: false)) {
            y = UIScreen.screenHeight
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            x1 = CGFloat.random(in: -UIScreen.screenWidth / 2..<UIScreen.screenWidth / 2)
            x2 = CGFloat.random(in: -UIScreen.screenWidth / 2..<UIScreen.screenWidth / 2)
            x3 = CGFloat.random(in: -UIScreen.screenWidth / 2..<UIScreen.screenWidth / 2)
            score += 1
            startMoving()
        }
    }
}

struct ReverseFlappyBirdView_Previews: PreviewProvider {
    static var previews: some View {
        ReverseFlappyBirdView()
    }
}
