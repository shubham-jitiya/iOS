//
//  Coordinator.swift
//  iOS
//
//  Created by Shubham Jitiya on 13/07/23.
//

import Foundation

protocol Coordinator: AnyObject {
    func start()
    func finish()
    func finishToRootView()
}
