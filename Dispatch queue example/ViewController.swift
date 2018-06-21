//
//  ViewController.swift
//  Dispatch queue example
//
//  Created by Ekramul Hoque on 30/5/18.
//  Copyright © 2018 Ekramul Hoque. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
//        simpleQueue()
        queuesWithQosAtrribute()
        
       // concurrentQueue()
        
//        if let queue = inactiveQueue {
//            queue.activate()
//        }
//
//        gloablQueue()
    }
    var inactiveQueue:DispatchQueue!
    func concurrentQueue(){
        //create newQueue with userInitiated Qos
        //let newQueue = DispatchQueue(label: "com.concurrent.ekram", qos: DispatchQoS.background, attributes: .concurrent)
        let newQueue = DispatchQueue(label: "com.concurrent.ekram", qos: DispatchQoS.background, attributes: [.initiallyInactive,.concurrent])
        inactiveQueue = newQueue
        
        newQueue.async {
            for i in 0..<10 {
                print("Custom Green Love: 💚",i)
            }
        }
        newQueue.async {
            for i in 0..<10 {
                print("General Lover : ❤️",i)
            }
        }
        newQueue.async {
            for i in 0..<10 {
                print("Yallow love :💛",i)
            }
        }
    }

    func simpleQueue() {
        //create cuostom Queue
        let queue = DispatchQueue(label: "com.simpleQueue.Ekram")
        
        // Async Custom Queue
        queue.async {
            for i in 0..<10 {
                print("Custom Green Love: 💚",i)
            }
        }
        
        //Main Queue
        for i in 100..<110 {
            print("General Lover : ❤️",i)
        }
        
    }
    
    func queuesWithQosAtrribute() {
        
        //create DispathQueue with Qos Attribute
//        let queueOne = DispatchQueue(label: "com.queues.ekram", qos: DispatchQoS.background)
//        let queueTwo = DispatchQueue(label: "com.queues.ekram", qos: DispatchQoS.utility)
        let queueOne = DispatchQueue(label: "com.queues.ekram", qos: .userInitiated)
        let queueTwo = DispatchQueue(label: "com.queues.ekram", qos: .userInitiated)
        
        
        queueOne.async {
            for i in 0..<10 {
                print("Custom Green Love: 💚",i)
            }
        }
        
        queueTwo.sync {
            for i in 100..<110 {
                print("General Lover : ❤️",i)
            }
        }
        
        // Main queue
        for i in 500..<510 {
            print("Yallow love :💛",i)
        }
    }
    
    
    func gloablQueue() {
        
        //let globalQueue = DispatchQueue.global()
        let globalQueue = DispatchQueue.global(qos: .background)
        
        globalQueue.async {
            for i in 0..<10 {
                print("Custom Green Love: 💚",i)
            }
        }
    }

}

