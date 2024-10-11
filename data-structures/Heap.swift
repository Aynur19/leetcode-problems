public final class Heap<Element>: HeapProtocol {
    typealias Element = Element
    
    private var items: [Element]
    
    private var compare: (_ parent: Element, _ child: Element) -> Bool
    
    public var size: Int {
        items.count
    }
    
    public init(
        compare: @escaping (_ parent: Element, _ child: Element) -> Bool
    ) {
        self.items = []
        self.compare = compare
    }
    
    public init(
        items: [Element],
        compare: @escaping (_ parent: Element, _ child: Element) -> Bool
    ) {
        self.items = items
        self.compare = compare
        
        for idx in stride(from: size / 2, to: -1, by: -1) {
            heapify(index: idx)
        }
    }
    
    public static func sort(
        array: inout [Element],
        compare: @escaping (_ parent: Element, _ child: Element) -> Bool
    ) {
        let heap = Heap(items: array, compare: compare)
        for idx in array.indices {
            array[idx] = heap.pop()!
            
        }
    }
    
    public func peek() -> Element? {
        items.first
    }
    
    public func push(_ value: Element) {
        items.append(value)
        var currentIdx = size - 1
        var parentIdx = (currentIdx - 1) / 2
        
        while currentIdx > 0, !compare(items[parentIdx], items[currentIdx]) {
            items.swapAt(currentIdx, parentIdx)
            currentIdx = parentIdx
            parentIdx = (currentIdx - 1) / 2
        }
    }
    
    public func pop() -> Element? {
        let result = peek()

        if size > 0 {
            items[0] = items[size -  1]
            _ = items.removeLast()
            heapify(index: 0)
        }
        
        return result
        
    }
    
    private func heapify(index: Int) {
        var index = index
        
        while true {
            let ptrChildL = 2 * index + 1
            let ptrChildR = 2 * index + 2
            var ptrLargest = index
            
            if ptrChildL < size, !compare(items[ptrLargest], items[ptrChildL]) {
                ptrLargest = ptrChildL
            }
            
            if ptrChildR < size, !compare(items[ptrLargest], items[ptrChildR]) {
                ptrLargest = ptrChildR
            }
            
            if ptrLargest == index { return }
            
            items.swapAt(index, ptrLargest)
            index = ptrLargest
        }
    }
}
