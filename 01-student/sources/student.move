module my_address::student {
    
    struct Empty {}
    struct Student has drop {
        id: u64,
        age: u8,
        sex: bool,
    }
    public fun newStudent(id: u64, age: u8, sex: bool): Student {  //
        return Student {
            id,    // 
            age: age,  // age: age,  means  age ,
            sex: sex,  // sex
        }
    }
    public fun getId(stu: &Student): u64 {  //
        stu.id
    }
}