//
//  DispatchQueuViewController.swift
//  RoadTo_iOS
//
//  Created by 謝飛飛 on 2019/2/21.
//  Copyright © 2019 謝飛飛. All rights reserved.
//

import UIKit

let totle = 2500

class DispatchQueuViewController: UIViewController
{
    var sum = 0
    let q1 = DispatchQueue.init(label: "Q1")
    let q2 = DispatchQueue.init(label: "Q1")
    let q3 = DispatchQueue.init(label: "Q1")
    let q4 = DispatchQueue.init(label: "Q1")
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
//        trySync()
        trySync2()
//        tryAsync()
//        appCodaAsync()
    }
    
    func trySync()
    {
        for _ in 0 ..< totle
        {
            q1.sync {
                self.add(heart: "🧡")
            }
            q2.sync {
                self.add(heart: "💛")
            }
            q3.sync {
                self.add(heart: "💚")
            }
            q4.sync {
                self.add(heart: "💙")
            }
        }
    }
    
    func trySync2()
    {
        q1.sync {
            for _ in 0 ..< totle{
                self.add(heart: "🧡")
            }
        }
        q2.sync {
            for _ in 0 ..< totle{
                self.add(heart: "💛")
            }
        }
        q3.sync {
            for _ in 0 ..< totle{
                self.add(heart: "💚")
            }
        }
        q4.sync {
            for _ in 0 ..< totle{
                self.add(heart: "💙")
            }
        }
    }
    
    func tryAsync()
    {
        for _ in 0 ..< totle
        {
            q1.async {
                self.add(heart: "🧡")
            }
            q2.async {
                self.add(heart: "💛")
            }
            q3.async {
                self.add(heart: "💚")
            }
            q4.async {
                self.add(heart: "💙")
            }
        }
    }
    
    func appCodaAsync()//弄不出來你一言我一語啊
    {
        let q1 = DispatchQueue(label: "1A", qos: .userInteractive, attributes: .concurrent)
        let q2 = DispatchQueue(label: "2B", qos: .userInteractive, attributes: .concurrent)
        
        q1.async {
            for i in 0 ..< totle
            {
                print("\(i)❤️")
            }
        }
        
        q2.async {
            for i in 0 ..< totle
            {
                print("\(i)💜")
            }
        }
    }
    
    func add(heart: String)
    {
        sum += 1
        print("\(heart)\(self.sum)")
    }
}
