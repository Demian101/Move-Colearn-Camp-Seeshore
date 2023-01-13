### 1. 基本的Move程序结构

```rust
fun plus_oned(a: u64): u64 {
  a+1
}
```



```rust
// import the Debug module from stdlib, which include print function
use Std::Debug::print;

fun print_to_console() {
  // print literal
  print(&100);

  // print expression
  print(&(100 + 3));

  let a: u64 = 123;
  // print variable
  print(&a);
}
```

```rust
script {
  // first part: dependency declaration
  use Std::Debug::print;

  // second part: constants definition
  const ONE: u64 = 1;

  // last part: the only function with any name
  fun plus_one(x: u64) {
    let sum = x + ONE;
    print(&sum);
  }
}
```



```rust
module 0x1::BasicCoin {
    struct Coin has key {
        value: u64,
    }

    public fun mint(account: signer, value: u64) {
        move_to(&account, Coin { value })
    }
}
```



```rust
// script.move
script {
    // import Math Module
    use Std::Debug::print;
    //use 0xCAFE::Math as Math;
    // use 0xCAFE::Math as Math;
    use 0xCAFE::Math;
    use 0xCAFE::Math::quo;
    use 0xCAFE::Math::rem;
    

    fun quo_rem(x: u64, y: u64) {
        let q = quo(x, y);
        let r = rem(x, y);
        print(&q);
        print(&r);
    }
}

//math.move
module 0xCAFE::Math {
    // calculate the quotient x/y
    public fun quo(x: u64, y: u64): u64 {
        assert!(y != 0, 101);
        x / y
    }

    // calculate the remainder x%y
    public fun rem(x: u64, y: u64): u64 {
        assert!(y != 0, 102);
        x % y
    }
}
```


### 2. 创建和使用变量

```rust
script {
  use Std::Debug::print;

  fun get_twenty() {
    let x = 11;

    let y;
    y = 9;

    print(&(x + y));
  }
}
```

```rust
// do not change this line
let x = true;

// Do not modify the assignment of the variables "vi"
let v0 = x;
let v1 = 0;
let v2 = false;
let v3 = @0x1;

if (x) {
  print(&x);
  v0=true;
  v2=true;
  v1=6;
  v3=@0xCAFE;
};
```

```rust
script {
  use Std::Debug::print;
  const ONE: u64 = 7;
  fun pass_weeks(days: u64) {
    
    let weeks = days / ONE;
    print(&weeks);
  }
}
```


### 3. 基本数据类型

```rust
let thirteen: u8 = 13u8;
let count:u64 = 5546;
let big_int: u128 = 0xFFFFFFFFFFFEECDAE1F;
```


```rust
let sum = 12 + 88;
print(&sum);

let diff = 123 - 23;
print(&diff);

let product = 4 * 25;
print(&product);

let quotient = 4136 / 41 ;
print(&quotient);    // = 100.87, res is 100

let remainder = 600 % 500;
print(&remainder);
```


```rust
let grammar =40;
let math = 42;
let history = 20;

let is_r = math > grammar;
print(&is_r);

let excellent = (grammar + math + history) > 100;
print(&excellent);
```



```rust
script {
  use Std::Debug;

  fun print_std_addr() {
    let std_addr = @Std;
    Debug::print(&std_addr);
  }
}
```





### 4. 使用函数

```rust
// utils.move
module 0xCAFE::Utils {
  use Std::Debug::print;

  fun multiply(x: u64, y:u64) {
    let z = x * y;
    print(&z);
  }

  public fun print_one_hundred() {
    multiply(4, 25);
  }
}

//script.move
script {
  use 0xCAFE::Utils;

  fun imcoding_test() {
    Utils::print_one_hundred();
  }
}
```



```rust
let z = {
  let x = 4;
  let y = 25;
  x * y
};

print(&z);
```



```rust
use Std::Debug::print;

fun plus_one(x: u64): u64 {
  x + 1
}

public fun hundred(): u64 {
  let x = plus_one(99);
  x
}
```



### 5. 使用 if/else 条件语句

```rust
fun smaller(x: u64, y: u64):u64 {
  if ( x < y ) {
    return x
  } else {
    return y
  }
}
```



```rust
let x = 25;
let y =  20 ;

let min: u64 = if (x < y) x else y;

let z: u64 = if (min < 25) 10u64 else 12u64;

print(&z);
```



```rust
fun dice_compare(x: u8, y: u8): u8 {
  if (x > y) {
    if (x == 6 && y == 1) {
      2
    } else {
      1
    }
  } else if ( x == y ) {
    0
  } else {
    if (x == 1 && y == 6 ) {
      1
    } else {
      2
    }
  }
}
```



### 6. 中止和断言

```rust
use Std::Debug::print;

fun div(x: u64, y: u64) {
  // abort if y is zero
  if (y==0) {
    abort(100)
  };

  let z = x / y;
  print(&z);
}
```




```rust
use Std::Debug::print;

fun subtract(x: u64, y: u64) {
  assert!(!(x < y), 100);

  let z = x - y;
  print(&z);
}
```





### 测验：创建一个数学模块

创建你的第一个 `Move` 模块，需要满足以下要求：

1. 命名为 `Math`，发布在账户 `0x1` 下；
2. 该模块有一个名为 `add` 的函数，它有两个类型为 `u64` 的参数，并返回两数之和 `x+y`；
3. 该模块有一个名为 `sub` 的函数，它有两个参数，类型都是 `u64`，当 `x>=y` 时返回差值 `x-y`。如果 `x<y`，则以状态码 `20` 中止；
4. 该模块有一个名为 `mul` 的函数，它有两个参数，类型都是 `u64`，并返回两数之积 `x*y`。
5. 该模块有一个名为 `div` 的函数，它有两个参数，类型都是 `u64`，当 `y!=0` 时返回商 `x/y`。如果 `y=0`，则以状态码 `40` 中止。
6. 该模块有一个名为 `mod` 的函数，它有两个参数，类型都是 `u64`，对于 `y!=0` 返回模数 `x%y`。如果 `y=0`，则以状态码 `60` 中止。
7. 该模块有一个名为 `diff` 的函数，它有两个参数，类型都是 `u64`，当 `x>=y` 时返回差值 `x-y`，当 `x<y` 时返回`y-x`。


```rust
// set the module name
module 0x1::Math {
  // return the sum x+y
  public fun add(x: u64, y: u64): u64 {
    x + y
  }

  // return the difference x-y for x>=y
  public fun sub(x: u64, y: u64): u64 {
    assert!( !(x < y), 20);
    x - y
  }

  // return the product x*y
  public fun mul(x: u64, y: u64): u64  {
    x * y
  }

  // return the quotient x/y for y!=0
  public fun div(x: u64, y: u64): u64  {
    assert( y!=0, 40 );
    x / y
  }

  // return the modules x%y for y!=0
  public fun mod(x: u64, y: u64): u64 {
    assert( y!=0, 60 );
    x % y
  }

  // return the difference x-y for x>=y or y-x for x<y
  public fun diff(x: u64, y: u64): u64 {
    if(x > y){
      x - y
    }else{
      y - x 
    }
  }

}
```


