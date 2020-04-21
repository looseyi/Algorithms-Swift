//
//  LinkList.swift
//  Algorithms
//
//  Created by Edmond on 2020/4/11.
//  Copyright © 2020 Algorithms. All rights reserved.
//

import Foundation


open class ListNode {
    var next: ListNode?
    var value: Int
    
	public init(value: Int, next: ListNode? = nil) {
        self.value = value
        self.next = next
    }
}
