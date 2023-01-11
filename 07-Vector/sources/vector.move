module my_address::vector_chapter {

    #[test_only]
    use std::debug::print;
    #[test_only]
    use std::vector;

    #[test]
    public fun test_push_pop() {
        // use generics to create an emtpy vector
        let a = vector::empty<u8>();
        let i = 0;

        // let's fill it with data
        while (i < 10) {
            vector::push_back(&mut a, i);
            i = i + 1;
        };  // Attention ; there...

        // now print vector length
        let a_len = vector::length(&a); // 10 
        print<u64>(&a_len);

        // then remove 2 elements from it
        vector::pop_back(&mut a);
        vector::pop_back(&mut a);

        // and print length again
        let a_len = vector::length(&a);
        print<u64>(&a_len);  // 8
    }

}