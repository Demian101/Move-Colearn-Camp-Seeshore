#[test_only]
module my_address::test_bool{
    use std::debug::print;
    use my_address::bool_module::{multi_sign_act};

    #[test]
    fun test_bool(){
        let grammar = 40;
        let math = 42;
        let history = 20;

        let is_r = math > grammar;
        print(&is_r);   // true

        let excellent = (grammar + math + history) > 100;
        print(&excellent);  // true 
    }

    #[test(aptos_framework = @0x1, acc1 = @0xCAFE, acc2 = @0x42)]
    fun test_multi_sign(acc1: &signer, acc2: &signer){
        multi_sign_act(acc1, acc2);
    }
    
    #[test(acc1 = @0xCAFE, acc2 = @0x24)]
    // This Test will FAIL
    fun test_multi_sign2(acc1: &signer, acc2: &signer){
        multi_sign_act(acc1, acc2);
    }
}
