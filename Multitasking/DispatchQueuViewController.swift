//
//  DispatchQueuViewController.swift
//  RoadTo_iOS
//
//  Created by 謝飛飛 on 2019/2/21.
//  Copyright © 2019 謝飛飛. All rights reserved.
//

import UIKit

//class Foo {
//
//    var n: Int
//
//    init(n: Int) {
//        self.n = n
//        print("Foo created: \(n)")
//    }
//    deinit {
//        print("Foo gone")
//    }
//}
//
//class Bar: Foo {
//    override init(n: Int) {
//        print("Bar created: \(n)")
//    }
//    //Is not overwritten here
//    deinit {
//        print("Bar gone")
//    }
//}

class DispatchQueuViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let q1 = DispatchQueue.init(label: "Q1")
        let q2 = DispatchQueue.init(label: "Q1")
        let q3 = DispatchQueue.init(label: "Q1")
        let q4 = DispatchQueue.init(label: "Q1")
        
        var sum = 0
        
        func add()
        {
            sum += 1
        }
        
        for _ in 0..<25//0
        {
            q1.async {
                add()
                print("🧡\(sum)")
            }
            q2.async {
                add()
                print("💛\(sum)")
            }
            q3.async {
                add()
                print("💚\(sum)")
            }
            q4.async {
                add()
                print("💙\(sum)")
            }
            
//            q1.sync {
//                add()
//                print("🧡\(sum)")
//            }
//            q2.sync {
//                add()
//                print("💛\(sum)")
//            }
//            q3.sync {
//                add()
//                print("💚\(sum)")
//            }
//            q4.sync {
//                add()
//                print("💙\(sum)")
//            }
        }
        print(sum)
    }
}
