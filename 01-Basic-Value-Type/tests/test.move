#[test_only]
module my_address::test_module{

    use my_address::value_test::{print_value, arithmetic_calculation};


    #[test]
    fun test_func() {
        let thirteen: u8 = 13u8;
        let count: u64 = 5546u64;
        let big_int: u128 = 0xFFFFFFFFFFFEECDAE1F;
        print_value(thirteen, count, big_int)
    }

    #[test]
    fun test_func2(){
        arithmetic_calculation();
    }

}