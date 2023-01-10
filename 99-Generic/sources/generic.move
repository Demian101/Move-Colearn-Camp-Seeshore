module my_address::generic {

  use std::debug;
  struct Coin has drop { value: u64}
  public fun new_coin(value: u64): Coin {
      Coin { value }
  }
  public fun show<T>(a: &T) {
    debug::print(a);
  }
}