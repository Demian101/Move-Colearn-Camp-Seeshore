#[test_only]
module my_address::test_module{

    use my_address::loop_::{max, diff, sum99};
    use std::debug::print;

    #[test]
    fun test_func() {
        let (res1, res2, res3) = (max(33, 34), diff(20, 30), sum99() ) ;
        print(&res1);
        print(&res2);
        print(&res3);
    }

}