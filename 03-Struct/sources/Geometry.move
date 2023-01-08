module my_address::Geometry {

  struct Point has drop, copy { x: u64, y: u64 }

  public fun new_point(x: u64, y: u64): Point {
      Point { x, y }
  }

  struct Circle has copy, drop {
      center: Point,
      radius: u64,
  }

  public fun new_circle(center: Point, radius: u64): Circle {
      Circle { center, radius }
  }

  public fun radius(circle: &Circle): u64 {
      circle.radius
  }

  public fun enlarge(circle: &Circle): Circle {
      let bigger = *circle;        // Attention 
      bigger.radius = 2 * bigger.radius;
      bigger
  }
}