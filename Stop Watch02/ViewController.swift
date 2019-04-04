//
//  ViewController.swift
//  Stop Watch02
//
//  Created by D7703_24 on 2019. 4. 4..
//  Copyright © 2019년 D7703_24. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var StartButton: UIBarButtonItem!
    @IBOutlet weak var PauseBu: UIBarButtonItem!
    @IBOutlet weak var ResetBu: UIBarButtonItem!
    var time = 0
    var min = 0
    var sec = 0
    //timer 객체 생성
    var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        TimeLabel.text = String(time)
    }
    @IBAction func StartButton(_ sender: Any) {
        if(myTimer.isValid) {
            return;
        }
        myTimer = Timer.scheduledTimer(timeInterval: 0.01, target:self, selector: #selector(updateTime),userInfo: nil, repeats: true)
        ChangebuttonState(start: false, pause: true, stop: true)
    }
    @IBAction func PauseButton(_ sender: Any) {
        myTimer.invalidate()
        ChangebuttonState(start: true, pause: false, stop: true)
    }
    @IBAction func ResetButton(_ sender: Any) {
        myTimer.invalidate()
        time = 0
        TimeLabel.text = String(time)
        ChangebuttonState(start: true, pause: true, stop: false)
    }
    @objc func updateTime() {
        time += 1
        if(time==100){
            time=0
            sec+=1
        }
        if(sec==60){
            sec=0
            min+=1
        }
        TimeLabel.text = String(min)+":"+String(sec)+":"+String(time)
    }
    func ChangebuttonState(start:Bool, pause:Bool, stop:Bool){
        StartButton.isEnabled = start
        PauseBu.isEnabled = pause
        ResetBu.isEnabled = stop
    }

}

