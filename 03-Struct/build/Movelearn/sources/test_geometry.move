#[test_only]
module my_address::test_geometry{

    use my_address::Geometry::{Point, new_point, radius, Circle, new_circle, enlarge};
    use std::debug::print;

    #[test]
    fun test_geometry() {
        let point: Point = new_point(0, 0);
        let cir: Circle = new_circle(
            point, 4
        );
        print(&radius(&cir));

        let cir_2 = enlarge(&cir);
        print(&radius(&cir_2));
    }

}