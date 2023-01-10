module my_address::assert {

    use 0x1::debug::print;

    fun div(x: u64, y: u64): u64 {
        assert!(y != 0, 100);  // replaced if..abort 100
        x / y
    }

    // Both of the following test functions will fail.
    // Carefully observe the error statement.
    #[test]
    #[expected_failure]
    fun test_abort(){
        let temp: u8 = 10;
        if (temp == 10) {
            abort(1)
        };
        
        print(&temp);
    }

    #[test]
    #[expected_failure]
    fun test_assert(){
        div(3, 0);
    }

}