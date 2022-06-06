use <unittest.scad>
use <shape_ellipse.scad>

module test_shape_ellipse() {
    echo("==== test_shape_ellipse ====");

    expected = [[40, 0], [39.1259, 4.1582], [36.5418, 8.1347], [32.3607, 11.7557], [26.7652, 14.8629], [20, 17.3205], [12.3607, 19.0211], [4.1811, 19.8904], [-4.1811, 19.8904], [-12.3607, 19.0211], [-20, 17.3205], [-26.7652, 14.8629], [-32.3607, 11.7557], [-36.5418, 8.1347], [-39.1259, 4.1582], [-40, 0], [-39.1259, -4.1582], [-36.5418, -8.1347], [-32.3607, -11.7557], [-26.7652, -14.8629], [-20, -17.3205], [-12.3607, -19.0211], [-4.1811, -19.8904], [4.1811, -19.8904], [12.3607, -19.0211], [20, -17.3205], [26.7652, -14.8629], [32.3607, -11.7557], [36.5418, -8.1347], [39.1259, -4.1582]];

    actual = shape_ellipse([40, 20]);

    assertEqualPoints(expected, actual);
}

test_shape_ellipse();