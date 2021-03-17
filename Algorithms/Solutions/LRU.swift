class Node {
    let key: Int
    let value: Int
    var prev: Node?
    var next: Node?

    init(key: Int, value: Int) {
        self.key = key
        self.value = value
    }
}

class DoubleLinkList {

    var head: Node
    var tail: Node
    // 返回链表长度，时间 O(1)
    private(set) var size: Int = 0

    init() {
        head = Node(key: 0, value: 0)
        tail = Node(key: 0, value: 0)

        head.next = tail
        tail.prev = head
    }

    // 在链表头部添加节点 x，时间 O(1)
    func addFirst(_ x: Node) {
        
        let first = head.next

        first?.prev = x
        x.next = first
        
        x.prev = head
        head.next = x
        size += 1
    }
    // 删除链表中的 x 节点（x 一定存在）
    // 由于是双链表且给的是目标 Node 节点，时间 O(1)
    func remove(_ x: Node) {
        x.prev?.next = x.next
        x.next?.prev = x.prev
        size -= 1
    }

    // 删除链表中最后一个节点，并返回该节点，时间 O(1)
    func removeLast() -> Node? {
        guard let result = tail.prev, size >= 1 else { return nil }
        remove(result)
        return result
        
    }
}

class LRUCache {
    
    private let capacity: Int
    private var map = [Int: Node]()
    private let list = DoubleLinkList()

    init(_ capacity: Int) {
        self.capacity = capacity
    }

    func get(_ key: Int) -> Int {
        if let node = map[key] {
            put(key, node.value)
            return node.value
        } else {
            return -1
        }
    }

    func put(_ key: Int, _ value: Int) {

        if let node = map[key]  {
            // 删除节点
            list.remove(node)
        }

        let newNode = Node(key: key, value: value)
        list.addFirst(newNode)
        map[key] = newNode

        if list.size > capacity, let last = list.removeLast()  {
            map.removeValue(forKey: last.key)
        }
    }
}