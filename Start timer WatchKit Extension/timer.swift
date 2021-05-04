//
//  timer.swift
//  Start timer WatchKit Extension
//
//  Created by m.kiselev on 5/4/21.
//

import Foundation

struct TimerModel {
    var time: Int
    var timeTitle: String {
        return "\(time)"
    }
    
    var unit: TimerUnit
    var unitTitle: String {
        if time > 1 {return unit.plural()}
        return unit.rawValue
    }
    
    init(time: Int, unit: TimerUnit) {
        if time >= 60 {
            self.time = time / 60
            self.unit = .min
        } else {
            self.time = time
            self.unit = unit
        }
    }
    
    static func allTimerValues() -> [TimerModel] {
        return [
            TimerModel(time: 3, unit: .min),
            TimerModel(time: 5, unit: .min)
        ]
    }
    
    enum TimerUnit: String {
        case min = "MIN"
        case sec = "SEC"
        
        func plural() -> String {
            switch self {
            case .min:
                return "MINS"
            case .sec:
                return "SECS"
            }
        }
    }
    
}
