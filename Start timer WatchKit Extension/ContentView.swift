//
//  ContentView.swift
//  Start timer WatchKit Extension
//
//  Created by m.kiselev on 5/3/21.
//

import SwiftUI

struct ContentView: View {
    @State var timerScreenShown:Bool = false
    @State var customTimerScreenShown:Bool = false
    @State var timeBeforeStart = 3
    
    var body: some View {
        
        VStack{
            Spacer()
            Text("Select Start timer")
            Spacer()
            HStack{
                NavigationLink(destination: TimerView(timerScreenShown: $timerScreenShown, timeBeforeStart: 3), isActive: $timerScreenShown, label: {Text("3 Min")})
                
                NavigationLink(destination: TimerView(timerScreenShown: $timerScreenShown, timeBeforeStart: 5), isActive: $timerScreenShown, label: {Text("5 Min")})
            }
            HStack{
                NavigationLink(destination: CustomTimerView(timerScreenShown: timerScreenShown, customTimerScreenShown: $customTimerScreenShown, timeBeforeStart: timeBeforeStart), isActive: $customTimerScreenShown, label: {Text("Custom timer")})
            }
        }
    }
}

struct TimerView: View {
    @Binding var timerScreenShown:Bool
    @State var timeBeforeStart: Int
    
    var body: some View{
        Text("Time before start is")
        Text("\(timeBeforeStart)")
            .font(.system(size: 23))
    }
}

struct CustomTimerView: View {
    @State var timerScreenShown:Bool = false
    @Binding var customTimerScreenShown:Bool
    @State var timeBeforeStart:Int
    
    var body: some View{
        VStack{
            Text("Choose a time before start:")
            Picker(selection: $timeBeforeStart, label: Text(""), content: {
                Text("1 min").tag(1)
                Text("2 min").tag(2)
                Text("3 min").tag(3)
                Text("4 min").tag(4)
                Text("5 min").tag(5)
                Text("6 min").tag(6)
                Text("7 min").tag(7)
                Text("8 min").tag(8)
                Text("9 min").tag(9)
                Text("10 min").tag(10)
            })
            NavigationLink(destination: TimerView(timerScreenShown: $timerScreenShown, timeBeforeStart: self.timeBeforeStart), isActive: $timerScreenShown, label: {Text("Choose")})
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
