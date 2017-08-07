//
//  ViewController.swift
//  Clock
//
//  Created by Vladislav Fedotovskiy
//  Copyright © 2017 Vladislav Fedotovskiy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var clockLabel: UILabel!
    
    @IBOutlet weak var stopWatchLabel: UILabel!
    
    
    let stopwatch = Stopwatch()
    
    
    @IBAction func start(_ sender: Any) {
        
        guard !stopwatch.isRunning else {return}
        
        Timer.scheduledTimer(timeInterval: 0.1, target: self,
                             selector: #selector(ViewController.updateElapsedTimeLabel(_:)), userInfo: nil, repeats: true)
        stopwatch.start()

        
    }
    
    @IBAction func stop(_ sender: Any) {
        
        stopwatch.stop()
        
    }
    
    // STOPWATCH FUNC
    
    func updateElapsedTimeLabel(_ timer: Timer) {
        if stopwatch.isRunning {
            stopWatchLabel.text = stopwatch.elapsedTimeAsString
        } else {
            timer.invalidate()
        }
    }
    
    
    // CURRENT TIME FUNC
    
    var timer: Timer?
    
    let clock = Clock()
    
    lazy var df = DateFormatter()
    
    deinit {
        
        if let timer = timer {
            timer.invalidate()
        }
    }
    
    
    func updateClock() {
        
        clockLabel.text = df.string(from: clock.currentTime)
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateClock()
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Current Time
        
        df.timeStyle = .medium
        df.locale = Locale(identifier: "RU_ru")
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateClock), userInfo: nil, repeats: true)
        
        updateClock()
        
        
        
        
    }

// Make "UPSIDE DOWN" orientation working
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .all
    }
    

}













