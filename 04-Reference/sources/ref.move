module my_address::ref {

  public fun swap(a:&mut u64, b:&mut u64) { // no return
    let temp = *a;
    *a = *b;
    *b = temp;
  }
}