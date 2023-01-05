#[test_only]
module my_address::test_module{

    use my_address::student::{Student, newStudent, getId};
    use std::debug;

    #[test(sender=@my_address)]
    fun test_newStudent() {  //
        let stu1: Student = newStudent(10001, 24, true);
        let _id = getId(&stu1);
        debug::print(&_id);
    }
}