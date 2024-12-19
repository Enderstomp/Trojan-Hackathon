//
//  FicshCopy.swift
//  Trojan Hackathon
//
//  Created by Justin Liu on 12/19/24.
//

import Foundation
import SwiftUI
import SpriteKit

struct FicshCopy:View {
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    let timer1 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var xpos:CGFloat = 201
    @State var ypos:CGFloat = 300
    
    @State var xpos1:CGFloat = 200
    @State var ypos1:CGFloat = 300
    
    @State var width:CGFloat = 400
    
    @State var loseXPos:CGFloat = 0
    @State var winXPos:CGFloat = 400
    
    @State var count:Int = 30
    @State var flashing:Double = 0
    @State var counter: Double = 0.3
    
    var body: some View {
        VStack{
            Text("Dont Let it Fall")
            Text("\(count)")
            HStack{
                
                
                ZStack{
                    HStack{
                        VStack{
                            Rectangle().frame(width:width,height:100,alignment: .center)
                                .opacity(0.45)
                                .position(x:xpos,y:ypos)
                                
                            HStack{
                                Rectangle().frame(width:100,height:100)
                                    .position(x:loseXPos,y: -30)
                                    .foregroundStyle(Color.red)
                                    .opacity(flashing)
                                
                                Rectangle().frame(width:100,height:100)
                                    .position(x:200,y: -30)
                                    .foregroundStyle(Color.red)
                                    .opacity(flashing)
                                
                            }
                                    }
                                
                            
                        }
                        
                        Rectangle().frame(width:50,height:100).foregroundStyle(Color.black)
                            .position(x:xpos1,y: ypos1)
                        
                        
                    }
                }
            }
            Button(action:{
                xpos1 += 10
            },label:{
                Rectangle().frame(width:100,height:65)
            })
            .onReceive(timer) { input in
                
                if xpos1 < winXPos && xpos1 > loseXPos{
                    xpos1 -= counter
                }
                if count == 0 {
                    //timer == 0 condition
                }
                if xpos1 > winXPos {
                    //WIN CONDITION
                }
                else if xpos1 < loseXPos{
                   //LOSE CONDITION
                }
                
            }
            .onReceive(timer1) { input in
                
                count -= 1
                if count == 20 {
                    flashing = 1
                    counter = 0.4
                }
                if count == 19 {
                    flashing = 0
                }
                if count == 18 {
                    flashing = 1
                }
                if count == 17 {
                    flashing = 0
                    counter = 0.5
                }
                if count == 16 {
                    flashing = 1
                }
                if count == 15 {
                    flashing = 0
                    width -= 100
                    loseXPos += 75
                    winXPos -= 75
                    counter = 0.65
                }
                
            }
        }
    }


#Preview {
    FicshCopy()
}
