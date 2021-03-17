
extension Solution<K, V> {
  // 实现一个数据结构，要求实现如下 API：
  // set(index, val)
  // get(index)
  // setAll(val)
  // 三种操作时间复杂度都是O（1）
  
  class Node {
    
    private var map: [K : V] = [:]
    private var currentValue: K
    private var currentIndex: Int
    
    func set(index: K, value: V) {
        map[index] = (cnt, value)
    }
    
    func get(index: K) -> V {
        let tcnt = mp[index].0
        if tcnt == currentIndex {
          return mp[index].1
        }
        return currentValue
    }
    func setAll(value: V) {
        currentIndex += 1
        currentValue = val
    }
  }
}