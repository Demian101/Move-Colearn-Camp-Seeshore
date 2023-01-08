

首先我们可以安装一个 Aptos 的 Petra 钱包, 搞一个自己的 Aptos 链地址

![image-20230105163451720](http://imagesoda.oss-cn-beijing.aliyuncs.com/Sodaoo/2023-01-05-083814.png)



然后来到 Playground, 在 Move.toml 定义一个 `my_address` 



![image-20230105163415425](http://imagesoda.oss-cn-beijing.aliyuncs.com/Sodaoo/2023-01-05-083817.png)



之后便可以在 Module 里面使用这个地址: 

```rust
module my_address::student {  // 使用了 my_address
   ....
```





在测试文件夹运行测试 : 

点击 Playground 左上角的 Test 即可运行测试文件 : 

![image-20230105163655139](http://imagesoda.oss-cn-beijing.aliyuncs.com/Sodaoo/2023-01-05-083823.png)





```rust
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
```





控制台输出 : 

![image-20230105163712840](http://imagesoda.oss-cn-beijing.aliyuncs.com/Sodaoo/2023-01-05-083825.png)

