//
//  DispatchQueuViewController.swift
//  RoadTo_iOS
//
//  Created by 謝飛飛 on 2019/2/21.
//  Copyright © 2019 謝飛飛. All rights reserved.
//

import UIKit

let totle = 10

class DispatchQueuViewController: UIViewController
{
    var sum = 0
    let q1 = DispatchQueue.init(label: "Q1")
    let q2 = DispatchQueue.init(label: "Q2")
    let q3 = DispatchQueue.init(label: "Q3")
    let q4 = DispatchQueue.init(label: "Q4")
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
//        trySync()
//        trySync2()
//        tryAsync()
        appCodaAsync()
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
    
    func tryDispatch()
    {
        //        let queue = DispatchQueue.init(label: "")
        let queue = DispatchQueue.init(label: "", attributes: .concurrent)
        
        //        //串行同步, 同步會塞車所以照順序
        //        //並行同步, 同上
        //        queue.sync {
        //            print(1)
        //        }
        //        print(2)
        //        queue.sync {
        //            print(3)
        //        }
        //        print(4)
        
        //        //串行異步, 異步順序不定, 但一定先1再3, 先2再4, 先2再3
        //        //並行異步, 同上
        //        queue.async {
        //            print(1)
        //        }
        //        print(2)
        //        queue.async {
        //            print(3)
        //        }
        //        print(4)
        
        //        //串行異步包同步, 152死鎖
        //        //並行異步包同步, 同步只會塞住一個線程, 開了多條, 所以不會死鎖, 15234or12534or12354or12345(5跟234順序不定)
        //        print(1)
        //        queue.async {
        //            print(2)
        //            queue.sync {
        //                print(3)
        //            }
        //            print(4)
        //        }
        //        print(5)
        
        //串行同步包異步, 12345,12435,12453(3什麼時候回來不知道)
        //並行同步包異步,       12435,12453
        print(1)
        queue.sync {
            print(2)
            queue.async {
                print(3)
            }
            print(4)
        }
        print(5)
    }
    
    func appCodaAsync()
    {
        let q1 = DispatchQueue(label: "1A", qos: .userInitiated)
        let q2 = DispatchQueue(label: "2B", qos: .userInitiated)
        
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
