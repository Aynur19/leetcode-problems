//
//  HeapProtocol.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 09.03.2024.
//

import Foundation

protocol HeapProtocol {
    associatedtype ValueType
        
    func empty() -> Bool
        
    func add(_ val: ValueType) -> Bool

    func removeMin() -> ValueType?
}


public final class HeapArray<T> {
    private var data = [T]()
    private var comparator: (T, T) -> Bool
    
    public init(comparator: @escaping (T, T) -> Bool) {
        self.comparator = comparator
    }
    
    public func add(_ val: T) {
        data.append(val)
        heapify()
    }
    
    public func buildHeap(_ values: [T]) {
        data.append(contentsOf: values)
        
        var idx = (data.count / 2)
        while idx >= 0 {
            heapify(idx)
            idx -= 1
        }
    }
    
    // O(log n)
    private func heapify() {
        var addedIdx = data.count - 1
        var parentIdx = (addedIdx - 1) / 2
        
        while addedIdx > 0, !comparator(data[parentIdx], data[addedIdx]) {
            let tmp = data[parentIdx]
            data[parentIdx] = data[addedIdx]
            data[addedIdx] = tmp
            
            addedIdx = parentIdx
            parentIdx = (addedIdx - 1) / 2
        }
    }
    
    // O(log n)
    private func heapify(_ idx: Int) {
        var idx = idx
        let size = data.count
        
        while true {
            var parentIdx = idx
            let leftIdx = idx * 2 + 1
            let rightIdx = idx * 2 + 2
            
            if leftIdx < size, !comparator(data[parentIdx], data[leftIdx]) {
                parentIdx = leftIdx
            }
            
            if rightIdx < size, !comparator(data[parentIdx], data[rightIdx]) {
                parentIdx = rightIdx
            }
            
            if parentIdx == idx { return }
            
            let tmp = data[idx]
            data[idx] = data[parentIdx]
            data[parentIdx] = tmp
            
            idx = parentIdx
        }
    }
    
    public func peak() -> T? {
        return empty() ? data[0] : nil
    }
    
    public func remove() -> T? {
        guard !empty() else { return nil }
        
        let result = data[0]
        data[0] = data[data.count - 1]
        _ = data.removeLast()
        
        return result
    }
    
    public func heapSort(values: inout [T])
    {
        buildHeap(values);
        var idx = data.count - 1
        
        while idx >= 0 {
            heapify(0)
            idx -= 1
        }
    }
    
    
    public func empty() -> Bool { return data.count == 0 }
}

//public class ArrayHeap<E> implements Heap<E> {
//
//    private final Comparator<E> comparator;
//    private final Class<E> eClass;
//    private int size;
//    private E[] array;
//    private int kSize;
//
//    public ArrayHeap(Comparator<E> comparator, Class<E> eClass) {
//        this.comparator = comparator;
//        this.eClass = eClass;
//        kSize = 8;
//        array = createArray(kSize - 1);
//    }
//
//    @SuppressWarnings("unchecked")
//    private E[] createArray(int size) {
//        return (E[]) Array.newInstance(eClass, size);
//    }
//
//    @Override
//    public Comparator<E> comparator() {
//        return comparator;
//    }
//
//    @Override
//    public boolean isEmpty() {
//        return size == 0;
//    }
//
//    @Override
//    public void add(E element) {
//        if (size == kSize - 1) {
//            expandArray();
//        }
//
//        array[size] = element;
//        upAndSwap(size);
//        size++;
//    }
//
//    private void upAndSwap(int index) {
//        if (index == 0) {
//            return;
//        }
//
//        int i = index;
//        int parent;
//        do {
//            parent = i % 2 == 0 ? (i - 1) / 2 : i / 2;
//            if (comparator.compare(array[parent], array[i]) > 0) {
//                swap(parent, i);
//                i = parent;
//            } else {
//                return;
//            }
//        } while (parent != 0);
//    }
//
//    private void swap(int i1, int i2) {
//        E element = array[i1];
//        array[i1] = array[i2];
//        array[i2] = element;
//    }
//
//    private void expandArray() {
//        kSize = kSize << 1;
//        E[] newArray = createArray(kSize - 1);
//        System.arraycopy(array, 0, newArray, 0, array.length);
//        array = newArray;
//    }
//
//    @Override
//    public E removeMin() {
//        if (isEmpty()) {
//            throw new NoSuchElementException();
//        }
//
//        E min = array[0];
//        E element = array[size - 1];
//        array[size - 1] = null;
//
//        if (size != 1) {
//            array[0] = element;
//            downAndSwap(0);
//        }
//
//        size--;
//        return min;
//    }
//
//    private int minOf2(int i1, int i2) {
//        E e1 = i1 < size ? array[i1] : null;
//        E e2 = i2 < size ? array[i2] : null;
//
//        if (e1 == null && e2 == null) {
//            return -1;
//        }
//
//        if (e1 == null) {
//            return i2;
//        }
//
//        if (e2 == null) {
//            return i1;
//        }
//
//        return comparator.compare(e1, e2) >= 0 ? i2 : i1;
//    }
//
//    private void downAndSwap(int index) {
//        int child1;
//        int child2;
//        int root = index;
//
//        do {
//            child1 = root * 2 + 1;
//            child2 = child1 + 1;
//            int minIndex = minOf2(child1, child2);
//            if (minIndex == -1) {
//                return;
//            }
//
//            if (comparator.compare(array[root], array[minIndex]) > 0) {
//                swap(root, minIndex);
//                root = minIndex;
//            } else {
//                return;
//            }
//        } while (true);
//    }
//
//    public static void main(String[] args) {
//        Heap<Integer> heap = new ArrayHeap<>(Comparator.reverseOrder(), Integer.class);
//        int[] values = {4, 5, 12, 8, 2, 1, 10, 8, 6, 9, 7, 9, 11, 12, 14, 15};
//        for (int i: values) {
//            heap.add(i);
//        }
//
//        // result must be - 15, 14, 12, 12, 11, 10, 9, 9, 8, 7, 6, 5, 4, 2, 1
//        while (!heap.isEmpty()) {
//            System.out.print(heap.removeMin() + " ");
//        }
//    }
//}
//
