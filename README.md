#### 适用人群

1. seeshore 线下 co-learn 与童鞋
2. 706 Move 课程童靴

Move playground 适合在 Web 端做一些快速的学习和验证 , 可配合 Mirror 笔记一起阅读操练 .



#### Contents

|            | Title                                    | Code                                                         | Mirror                                                       |
| ---------- | ---------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| 0x00       | Why Move?                                | /                                                            | [Mirror](https://mirror.xyz/0x65d5b68A7878A987e7A19826A7f9Aa6F5F92e10F/RlJedleB0o9BfKGJyJSnwra7eRkK93C2c8EIhKB3-ec) |
| 0x01       | Basic Value Type 基础类型                | [code](https://github.com/Demian101/Move-Colearn-Camp-Seeshore/tree/main/01-Basic-Value-Type) | [Mirror](https://mirror.xyz/0x65d5b68A7878A987e7A19826A7f9Aa6F5F92e10F/2OcPxVUduAO7SC45R2iWifnkZqGkIX3QsEQb44mUR_k) |
| 0x02       | Loop 循环                                | [code](https://github.com/Demian101/Move-Colearn-Camp-Seeshore/tree/main/02-Loop) | [Mirror](https://mirror.xyz/0x65d5b68A7878A987e7A19826A7f9Aa6F5F92e10F/DXZLErU3mhh1DR77sT9z96H1yudCE5FVNDO6_USeaE4) |
| 0x03       | Struct 结构体                            | [code](https://github.com/Demian101/Move-Colearn-Camp-Seeshore/tree/main/03-Struct) | [Mirror](https://mirror.xyz/0x65d5b68A7878A987e7A19826A7f9Aa6F5F92e10F/oC8X_b2sNZhXLw9DygizgIsp143IxUI32oSymmgLHJY) |
| 0x04       | tuple & Reference 元组、引用             | [code](https://github.com/Demian101/Move-Colearn-Camp-Seeshore/tree/main/04-Reference) | [Mirror](https://mirror.xyz/0x65d5b68A7878A987e7A19826A7f9Aa6F5F92e10F/cEyfZZet5KeMH1bf_FOCKMDz81o5got2OqL-TcdiI6o) |
| 0x05       | Abort & Assert 中止和断言                | [code](https://github.com/Demian101/Move-Colearn-Camp-Seeshore/tree/main/05-Abort%20%26%20Assert) | [Mirror](https://mirror.xyz/0x65d5b68A7878A987e7A19826A7f9Aa6F5F92e10F/vljKhk_e31GmGdNoi64_B7CA1NxK8_g4P4thfz64gDQ) |
| [Practice] | football star 球星卡(AptosEden)          | [code](https://github.com/Demian101/Move-Colearn-Camp-Seeshore/tree/main/Practice-football%20star) | /                                                            |
| 0x06       | ownership 所有权问题                     | /                                                            | [Mirror](https://mirror.xyz/0x65d5b68A7878A987e7A19826A7f9Aa6F5F92e10F/VH9p6T6kBCoBwYIfORHsyz-7yZEjMYsVT9zrMAcsdk8) |
| 0x07       | signer 签署者                            | /                                                            | [Mirror](https://mirror.xyz/0x65d5b68A7878A987e7A19826A7f9Aa6F5F92e10F/bfJem0ViDWpk_xetDiUdCwL1O2quII16K_1cAqWDnRQ) |
| 0x08       | Resource 资源类型                        | [code](https://github.com/Demian101/Move-Colearn-Camp-Seeshore/tree/main/06-Resource) | [Mirror](https://mirror.xyz/0x65d5b68A7878A987e7A19826A7f9Aa6F5F92e10F/z5rADoZ3dpSemK43OYYjVEHQl3bS_-1IKhrnI4gewXo) |
| 0x09       | Vector 容器                              | [code](https://github.com/Demian101/Move-Colearn-Camp-Seeshore/tree/main/07-Vector) | [Mirror](https://mirror.xyz/0x65d5b68A7878A987e7A19826A7f9Aa6F5F92e10F/kncPPsXPhB0xpR8H46irNHKSTHJ_uR1Py-SCwSFeajo) |
| 0x10       | Generics 泛型                            | [code](https://github.com/Demian101/Move-Colearn-Camp-Seeshore/tree/main/08-Generic) | [Mirror](https://mirror.xyz/0x65d5b68A7878A987e7A19826A7f9Aa6F5F92e10F/aZpIFBw6LhjnDv71Zw_-Ggynh1_M7NuljKKTRRBdqJE) |
| 0x11       | Move Patterns 设计模式  [预计 1.14 上线] |                                                              |                                                              |
| 0x12       | Move 高级数据结构  [预计 1.17 上线]      |                                                              |                                                              |





#### 新版本 Move Playground 操作方法:

地址: https://playground.pontem.network/

1. 首先我们可以安装一个 Aptos 的 `Petra`  钱包, 搞一个自己的 Aptos 链地址 ( Sui 钱包同理 )

![image-20230105163451720](http://imagesoda.oss-cn-beijing.aliyuncs.com/Sodaoo/2023-01-05-083814.png)



2. 然后来到 Playground, 在 `Move.toml` 定义一个地址: 即 `my_address` 

![image-20230105163415425](http://imagesoda.oss-cn-beijing.aliyuncs.com/Sodaoo/2023-01-05-083817.png)



3. 之后便可以在 `Module` 里面使用 `my_address` 这个地址:  

```rust
module my_address::student {  // 使用了 my_address
   ....
```



4. 编译通过后,  点击左上角运行测试函数 : 

点击 Playground 左上角的 `Test` 即可运行测试文件/函数 : 

![image-20230105163655139](http://imagesoda.oss-cn-beijing.aliyuncs.com/Sodaoo/2023-01-05-083823.png)



Test 测试函数举例 : 

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



5. 观察控制台输出 : 

![image-20230105163712840](http://imagesoda.oss-cn-beijing.aliyuncs.com/Sodaoo/2023-01-05-083825.png)



社区对 Move playground 评头论足  : 

> 看出来了, Move Playground 他想做 Move 版本的 Remix, 让用户在浏览器端直接**部署合约**
>
> 但是填私钥有点怕怕的 .... 不过没关系, 后续可以搞个测试账号

