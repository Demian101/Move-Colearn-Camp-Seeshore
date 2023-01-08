module my_address::student {
    
    use std::debug::print;

    struct Empty {}
    struct Student has drop {
        id: u64,
        age: u8,
        sex: bool,
    }

    public fun newStudent(id: u64, age: u8, sex: bool): Student {
        return Student {
            id: id,
            age: age,  // age: age,  means  age ,
            sex: sex,  // sex
        }
    }

    public fun getId(stu: &Student): u64 {
        stu.id
    }

    public fun destructor() {
        let stu2: Student = newStudent(10002, 34, true);
        let Student { id: _, age: stu2_age, sex: _ } = stu2;
        print(&stu2_age);
    }
}