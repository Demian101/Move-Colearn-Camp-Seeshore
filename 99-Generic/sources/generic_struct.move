module my_address::generic_struct{

    struct Student has drop {
        id: u64,
        age: u8,
        sex: bool,
    }

    struct User<T1, T2> has drop {
        id: T1,
        age: T2,
    }

    public fun newUser<T1, T2>(id: T1, age: T2): User<T1, T2> {
        return User { id , age }
    }
}