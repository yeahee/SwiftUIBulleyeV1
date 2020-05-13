//
//  ContentView.swift
//  SwiftUIBulleyeV1
//
//  Created by Release on 2020/05/13.
//  Copyright © 2020 yehee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0
    var body: some View {
        VStack {
            VStack {
                Spacer()
                // Target row
                HStack{
                    Text("Put the bullseye as close as you can to:")
                    Text("100")
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
                    print("Button pressed!")
                    self.alertIsVisible = true
                }) {
                    Text(/*@START_MENU_TOKEN@*/"Hit me!"/*@END_MENU_TOKEN@*/)
                }
                // State for alert
                    .alert(isPresented: self.$alertIsVisible){
                        Alert(title: Text("Hello there!"),
                              message: Text("The slider's value is \(Int(self.sliderValue.rounded()))."),
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
