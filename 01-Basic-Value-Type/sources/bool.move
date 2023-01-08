module my_address::bool_module {
    
    use std::signer;
    const ERROR_INVALID_OWNER:u64 = 100;

    public fun multi_sign_act(acc1: &signer, acc2: &signer) {
        // check the senders
        let a1 = signer::address_of(acc1);
        let a2 = signer::address_of(acc2);
        assert!(
            ((a2 == @0xCAFE) && (a1 == @0x42)) 
              || 
            ((a1 == @0xCAFE) && (a2 == @0x42))
            , ERROR_INVALID_OWNER);
    }
}