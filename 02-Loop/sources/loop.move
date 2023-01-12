module my_address::loop_ {

    public fun max(a:u64, b:u64): u64 {
        // a>b ? a : b
        if (a >= b) {
            a
        } else {
            b
        }
    }

    public fun diff(x: u64, y: u64): u64 {
        let diff = if (x > y) {
          x - y
        } else if (x < y) {
          y - x
        } else {
          0
        };
        diff
    }

    // calculate 1 + 3 + 5 ...
    public fun sum99(): u64 {
        let idx: u64 = 0;
        let res: u64 = 0;
        while ( idx <= 99) {
            idx = idx + 1;   // not support `+=` ?
            if ( idx % 2 == 0) continue;
                res = res + idx
        };     // Attention  `;`
        res
    }

}