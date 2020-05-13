//
//  ContentView.swift
//  SwiftUIBulleyeV1
//
//  Created by Release on 2020/05/13.
//  Copyright © 2020 yehee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // Properties
    // ==========
    // state for User interface views
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0
    @State var target: Int = Int.random(in: 1...100)
    var sliderValueRounded: Int{
        Int(self.sliderValue.rounded())
    }
    
    // User interface content and layout
    var body: some View {
        VStack {
            VStack {
                Spacer()
                // Target row
                HStack{
                    Text("Put the bullseye as close as you can to:")
                    //Text("100")
                    Text("\(self.target)")
                }
                Spacer()
                // Slider row
                HStack{
                    Text("1")
                    Slider(value: self.$sliderValue, in: 1...100)
                    Text("100")
                }
                Spacer()
                // Button row
                Button(action: {
                    //print("Button pressed!")
                    print("Points awarded: \(self.pointsForCurrentRound())")
                    self.alertIsVisible = true
                }) {
                    Text(/*@START_MENU_TOKEN@*/"Hit me!"/*@END_MENU_TOKEN@*/)
                }
                // State for alert
                    .alert(isPresented: self.$alertIsVisible){
                        Alert(title: Text("Hello there!"),
                              message: Text(self.scoringMessage()),
                              dismissButton: .default(Text("Awesome!")))
                }// End of alert
                Spacer()
                // Score row
                HStack{
                    Button(action: {}){
                        Text("Start Over")
                    }
                    Spacer()
                    Text("Score:")
                    Text("999999")
                    Spacer()
                    Text("Round:")
                    Text("999")
                    Spacer()
                    Button(action:{}){
                        Text("Inform")
                    }
                }.padding(.bottom, 20)
            }
        }// End of VStack
    }// End of body
    
    // Method
    func pointsForCurrentRound() -> Int{
        let difference: Int
        
        if self.sliderValueRounded > self.target{
            difference = self.sliderValueRounded - self.target
        }
        else if self.target > self.sliderValueRounded{
            difference = self.target - self.sliderValueRounded
        }
        else{
            difference = 0
        }
        return 100 - difference
    }
    
    func scoringMessage() -> String{
        return "The slider's value is \(Int(self.sliderValueRounded)).\n" +
        "The target value is \(self.target).\n" +
        "You scored \(pointsForCurrentRound()) points this round."
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
