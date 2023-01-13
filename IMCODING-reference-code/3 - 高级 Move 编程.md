### 3.1 while 和 loop



```rust
fun sum(n: u64): u64 { // 3
  let sum = 0;
  let i = 0;
  loop {
    sum = sum + i; // sum==1; sum==1+2; sum==3+3
    if (i >= n) break; //1!=3; 2!=3; 3==3, break;
    i = i + 1;     // i==1; i==2; i==3;
  };

  sum
}
```





```rust
fun sum_of_digits(number: u64): u64 {
  let sum = 0;
  while (number != 0) {
    sum = sum + number % 10;  // 123 % 10 == 3 ; 12 % 10 == 2 ; 1 % 10 == 1; => 3+2+1;
    number = number / 10; // 123/10 = 12 ;  12/10 == 1; 2/10 == 0; // round down 
  };

  sum 
}
```





示例直接给了...

```rust
fun is_prime(number: u64): bool {
  if (number <= 1) return false;

  let i = 2;
  while (i < number) {
    if (number % i  == 0) {
        return false;
    };
    i = i + 1;
  };
  true
}

fun count_prime(number: u64): u64 {
  let count = 0;
  let i = 0;
  while (i < number) {
    i = i + 1;
    if (!is_prime(i)) continue;
    count = count + 1;
  };

  count
}
```



### 3.2 使用向量定义数据集合

```rust
let empty = vector<u64>[1,2];
print(&empty);

// contains at least 3 elements
let v0 = vector<u64>[1024, 1025, 1026 ];
print(&v0);

// don't change the elements
let v1: vector<u64> = vector<u64>[100, 200, 500];
print(&v1); 
```





```rust
script {
  use Std::Vector;
  use Std::Debug::print;

  fun test() {
    let v = vector<u64>[1, 2, 3, 4, 5, 6];
    
    //Vector::pop_back(&mut v);

    Vector::push_back(&mut v, 7);
    Vector::push_back(&mut v, 1);
    
    //Vector::pop_back(&mut v);
    // don't remove any lines above



    print(&v);
  }
}
```





### 3.3 Move中的字符串



```rust
module 0xCAFE::String {
  use 0x1::Vector;
  struct String has copy, drop {
    bytes: vector<u8>,
  }

  public fun new(bytes: vector<u8>): String {
    String {
      bytes,
    }
  }

  public fun bytes(s: &String): vector<u8> {
    s.bytes
  }

  public fun length(s: &String): u64 {
    Vector::length(&s.bytes)
  }

  public fun append(s: &mut String, r: String) {
    Vector::append(&mut s.bytes, r.bytes);
  }
}
```



### 3.4 实现泛型

```rust
use Std::Vector;

struct Option<T> has drop {
  vec: vector<T>
}

// 返回一个空的 `Option`
public fun none<T>(): Option<T> {
  Option {
    vec: Vector::empty(),
  }
}

// 返回一个包含 `v` 的 `Option`
public fun some<T>(v: T): Option<T> {
  Option {
    vec: Vector::singleton(v),
  }
}

// 如果 `t` 没有包含值，返回 true
public fun is_none<T>(t: &Option<T>): bool {
  Vector::is_empty(&t.vec)
}


// 如果 `t` 包含值并且值等于 `e`，返回 true
public fun contains<T>(t: &Option<T>, e: &T): bool {
  Vector::contains(&t.vec, e)
}
```





- 参数里的 `(t: &Option<T>`  里的 T 不用加

```rust
use Std::Vector;

struct Option<T> has drop {
  vec: vector<T>
}

public fun get_with_default<T: drop+copy>(t: &Option<T>, default: T): T {
  if (Vector::is_empty(&t.vec)) {
    default
  } else {
    *Vector::borrow(&t.vec, 0)
  }
}
```

