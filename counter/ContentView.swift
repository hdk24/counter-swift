//
//  ContentView.swift
//  counter
//
//  Created by hanantadk on 09/06/20.
//  Copyright © 2020 hanantadk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tapCount = Preferences.readInt(forKey: AppConstant().PREF_TOTAL_TAP)
    
    @State private var progressValue: Float = Preferences.readFloat(forKey: AppConstant().PREF_PROGRESS)
    
    
    var body: some View {
        ZStack{
            Color(red: 243 / 255, green: 161 / 255, blue: 51 / 255)
                .opacity(0.9)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0.0) {
                Text("COUNTER")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text(getDateToday())
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(4)
                
                VStack {
                    
                    ZStack{
                        Circle()
                            .stroke(Color(red: 208 / 255, green: 132 / 255, blue: 28 / 255), lineWidth: 20)
                            .opacity(0.1)
                            .frame(width:300, height:300)
                        
                        Circle()
                            .trim(from: 0, to: CGFloat(min(self.progressValue, 1.0)))
                            .stroke(Color.black,style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                            //.stroke(Color.black, lineWidth: 20)
                            .rotationEffect(.degrees(-90))
                            .frame(width:300, height:300)
                        
                        
                        Text("\(tapCount)")
                            .font(.system(size: 116))
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                            .background(Circle()
                                .fill(Color(red: 241 / 255, green: 149 / 255, blue: 45 / 255).opacity(0.7))
                                .frame(width: 225, height: 225))
                        
                    }.padding(.bottom, 72)
                    
                    Button(action: {
                        self.resetCounter()
                        
                    }){
                        Image(systemName: "arrow.counterclockwise")
                            .resizable().frame(width: 32, height: 36)
                            .foregroundColor(Color.black)
                    }
                    .padding(16)
                    .background(Color.white)
                    .cornerRadius(16)
                    .foregroundColor(Color.white)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                //.background(Color.white)
                
                Text("Tap to increase counter")
                    .font(.system(size: 16))
                    .foregroundColor(.black)
            }
            .padding()
            
        }.onTapGesture {
            self.incrementProgress()
            
        }
    }
    
    private func getDateToday() -> String{
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        return "Today, \(formatter.string(from: date))"
    }
    
    
    private func incrementProgress(){
        if self.tapCount>0 && self.tapCount % 33 == 0 {
            self.progressValue = (1/33)
        } else {
            self.progressValue += (1/33)
        }
        
        self.tapCount += 1
        
        Preferences.saveInt(value: self.tapCount, forKey: AppConstant().PREF_TOTAL_TAP)
        
        Preferences.saveFloat(value: self.progressValue, forKey: AppConstant().PREF_PROGRESS)
    }
    
    private func resetCounter(){
        self.tapCount = 0
        self.progressValue = 0
        
        Preferences.saveInt(value: self.tapCount, forKey: AppConstant().PREF_TOTAL_TAP)
        
        Preferences.saveFloat(value: self.progressValue, forKey: AppConstant().PREF_PROGRESS)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
