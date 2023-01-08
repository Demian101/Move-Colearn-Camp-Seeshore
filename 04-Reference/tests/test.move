#[test_only]
module my_address::test_module{

    use my_address::ref::{swap};
    use std::debug::print;

    #[test]
    fun test_func() {
        let (a, b) =  (1, 10);
        swap(&mut a, &mut b);
        print(&a);  // we expect 10 
        print(&b);  // we expect 1
    }
}