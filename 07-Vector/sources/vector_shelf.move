module my_address::vector_shelf {

    use std::vector;
    #[test_only]
    use std::debug::print;

    struct Box<T> has drop { value: T }
    struct Shelf<T> has drop {
        boxes: vector<Box<T>>
    }

    public fun create_box<T>(value: T): Box<T> {
        Box { value }
    }

    // this method will be inaccessible for non-copyable contents
    // means T musr have copy ability. 
    public fun value<T: copy>(box: &Box<T>): T {
        *&box.value
    }

    public fun create<T>(): Shelf<T> {
        Shelf {
            boxes: vector::empty<Box<T>>()
        }
    }

    // box value is moved to the vector
    public fun put<T>(shelf: &mut Shelf<T>, box: Box<T>) {
        vector::push_back<Box<T>>(&mut shelf.boxes, box);
    }

    public fun remove<T>(shelf: &mut Shelf<T>): Box<T> {
        vector::pop_back<Box<T>>(&mut shelf.boxes)
    }

    public fun size<T>(shelf: &Shelf<T>): u64 {
        vector::length<Box<T>>(&shelf.boxes)
    }

    #[test]
    fun test_shelf() {
        let shelf = create<u64>();
        let box_1 = create_box<u64>(99);
        let box_2 = create_box<u64>(999);

        // put both boxes to shelf
        put(&mut shelf, box_1);
        put(&mut shelf, box_2);

        // prints size - 2
        print(&size<u64>(&shelf));  // 2

        // then take one from shelf (last one pushed)
        let take_back = remove(&mut shelf);
        let value     = value<u64>(&take_back);

        // verify that the box we took back is one with 999
        assert!(value == 999, 1);

        // and print size again - 1
        print(&size<u64>(&shelf));  // 1
    }
}