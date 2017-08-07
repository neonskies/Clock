//
//  StopWatch.swift
//  Clock
//
//  Created by Vladislav Fedotovskiy on 21.01.17.
//  Copyright © 2017 Vladislav Fedotovskiy. All rights reserved.
//

import Foundation

class Stopwatch {
    
    fileprivate var startTime: Date?
    
    var elapsedTime: TimeInterval {
        if let startTime = self.startTime {
            return -startTime.timeIntervalSinceNow
        } else {
            return 0
        }
    }
    
    var elapsedTimeAsString: String {
        
        let m = Int(elapsedTime / 60) //minute
        let s = Int(elapsedTime.truncatingRemainder(dividingBy: 60)) //second
        let ms = Int((elapsedTime * 10).truncatingRemainder(dividingBy: 10)) //milisecond
        
        return String(format: "%02d:%02d.%d", //02d means number of digits you want to see
                      m, s, ms)
    }
    
    var isRunning: Bool {
        return startTime != nil
    }
    
    func start() {
        startTime = Date()
    }
    
    func stop() {
        startTime = nil
    }
    
}
