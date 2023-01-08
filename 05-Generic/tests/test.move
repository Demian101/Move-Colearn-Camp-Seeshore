#[test_only]
module my_address::test_module{

    use my_address::generic::{show, Coin, new_coin};
    use my_address::generic_struct::{newUser };
    use std::debug::print;
    
    #[test]
    fun test_func() {
        let a: u8 = 10;
        let b: bool = false;
        let c: address = @0x65;
        let coin: Coin = new_coin(3);
        show(&a);
        show(&b);
        show(&c);
        show(&coin);
    }

    #[test]
    fun test_generic_struct() {
        let user1 = newUser(10001, 24);  // good
        print(&user1);
    }
}