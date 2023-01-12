module my_address::generic {

    use std::debug;
    public fun show<T>(a: &T) {
        debug::print(a);
    }

    struct Point<T, U> has drop {
        x: T,
        y: U,
    }

    public fun new_point<T, U>(x: T, y: U): Point<T, U> {
        Point {
          x, y,
        }
    }

    #[test]
    fun test_init() {
        let p1 = Point { x: 5, y: 10 };         // Automatic inference: Point<u64, u64>
        let p2 = Point<u8, u64> { x: 2, y: 3 }; // Point<u8, u64>
        let p3 = Point { x: 0, y: b"0" };       // Point<u64, vector<u8>>
        show(&p1); show(&p2); show(&p3);
    }

    #[test]
    fun test_generic_func() {
        let p1 = new_point(5, 10);              // Automatic inference.
        let p2 = new_point<u8, u64>(2, 3);
        let p3 = new_point<u64, vector<u8>>(0, b"0");
        show(&p1); show(&p2); show(&p3);
    }
}