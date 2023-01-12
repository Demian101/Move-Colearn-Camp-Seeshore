module my_address::option {
    // $ aptos move test -f option
    // To be honest, I don't quite understand this example...
    use std::vector;
    #[test_only]
    use std::debug::print;

    struct Option<T> has drop {
      vec: vector<T>
    }

    // Return an empty `Option`.
    public fun none<T>(): Option<T> {
      Option {
        vec: vector::empty(),
      }
    }

    // Return a `Option` contains `v`.
    public fun some<T>(v: T): Option<T> {
      Option {
        vec: vector::singleton(v),
      }
    }

    // Returns true if `t` does not contain a value
    public fun is_none<T>(t: &Option<T>): bool {
      vector::is_empty(&t.vec)
    }


    // Returns true if `t` contains a value and the value is equal to `e`
    public fun contains<T>(t: &Option<T>, e: &T): bool {
      vector::contains(&t.vec, e)
    }

    #[test]
    fun test_option() {
        let a = vector::empty<u8>();
        let res = none<vector<u8>>();
        print(&a); print(&res);

        let res2 = is_none<vector<u8>>(&res);
        print(&res2);

        vector::push_back(&mut a, 3);
        let res3 = some<vector<u8>>(a);
        print(&res3);

        let res4 = contains<vector<u8>>(&res3, &a);
        print(&res4);
    }
}