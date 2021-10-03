//
//  CompositePattern.swift
//  ysCompositePattern
//
//  Created by Ярослав on 03.10.2021.
//

import Foundation

protocol TaskComposite {
    var parent: TaskComposite? { get }
    var children: [TaskComposite] { get }
    var name: String { get }
    
    func add(child: TaskComposite)
    func listChildren() -> [String]
}

class Task: TaskComposite {
    var parent: TaskComposite?
    var children: [TaskComposite] = []
    var name: String
    
    init(name: String, parent: TaskComposite?) {
        self.name = name
        self.parent = parent
    }
    
    func add(child: TaskComposite) {
        children.append(child)
    }
    
    func listChildren() -> [String] {
        return children.map { $0.name }
    }
}
