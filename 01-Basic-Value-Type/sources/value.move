module my_address::value_test {
    
    use std::debug;

    public fun print_value(param1: u8, param2: u64, param3: u128) {
        debug::print(&param1);
        debug::print(&param2);
        debug::print(&param3);
    }

    public fun arithmetic_calculation(){
        let quotient = 4136 / 41 ;
        debug::print(&quotient);    // = 100.87, res is 100.

        let remainder = 600 % 500;
        debug::print(&remainder);  // 600/500 = 1 ,res is 100.
    }
}