//
//  HeapProtocol.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 09.03.2024.
//

protocol HeapProtocol {
    associatedtype ValueType
        
    func empty() -> Bool
        
    func add(_ val: ValueType) -> Bool

    func removeMin() -> ValueType?
}



public final class HeapArray<ValueType>: HeapProtocol {
    private var data: [ValueType]
    private var size: Int
    private let defaultValue: ValueType
    
    init(_ size: Int = 10, defaultValue: ValueType) {
        self.size = size
        self.defaultValue = defaultValue
        self.data = .init(repeating: defaultValue, count: size)
    }
    
    
    func add(_ val: ValueType) -> Bool {
        return true
    }
    //    public void add(E element) {
    //        if (size == kSize - 1) {
    //            expandArray();
    //        }
    //
    //        array[size] = element;
    //        upAndSwap(size);
    //        size++;
    //    }
    func empty() -> Bool {
        return true
    }
    
    
    func removeMin() -> ValueType? {
        return defaultValue
    }
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
