#[test_only]
module my_address::test_module{

    use my_address::student::{Student, newStudent, getId, destructor};
    use std::debug::print;

    #[test]
    fun test_newStudent() {
        let stu1: Student = newStudent(10001, 24, true);
        let _id = getId(&stu1);
        print(&_id);
    }

    #[test]
    fun test_destructor(){
        destructor();
    }
}