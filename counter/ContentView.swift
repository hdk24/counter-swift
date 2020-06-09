//
//  ContentView.swift
//  counter
//
//  Created by hanantadk on 09/06/20.
//  Copyright © 2020 hanantadk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tapCount = PreferenceUtils.readInt(forKey: "Tap")
    
    var body: some View {
        NavigationView{
            Button(action: {
                self.tapCount+=1
                PreferenceUtils.saveInt(value: self.tapCount, forKey: "Tap")
            }) {
                ZStack {
                    Text("\(tapCount)")
                        .font(.system(size: 124))
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                .background(Color.white)
                
            }
            .navigationBarTitle("Counter",displayMode: .inline)
            .navigationBarHidden(false)
            .navigationBarColor(.red, .white, .white)
            .navigationBarItems(
                trailing:
                Button(action: {
                    self.tapCount = 0
                    PreferenceUtils.saveInt(value: self.tapCount, forKey: "Tap")
                }) {
                    Text("Reset")
                }
            )
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
