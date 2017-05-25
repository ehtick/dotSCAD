include <unittest.scad>;
include <shape_arc.scad>;

module test_shape_arc() {
    echo("==== test_shape_arc ====");

    expected = [[0, -12.4315], [1.30661, -12.4315], [3.86271, -11.8882], [6.25, -10.8253], [8.36413, -9.28931], [10.1127, -7.34732], [11.4193, -5.08421], [12.2268, -2.5989], [12.5, 0], [12.2268, 2.5989], [11.4193, 5.08421], [10.1127, 7.34732], [8.36413, 9.28931], [6.25, 10.8253], [3.86271, 11.8882], [1.30661, 12.4315], [0, 12.4315], [0, 7.45891], [0.783963, 7.45891], [2.31763, 7.13292], [3.75, 6.49519], [5.01848, 5.57359], [6.06763, 4.40839], [6.85159, 3.05052], [7.33611, 1.55934], [7.5, 0], [7.33611, -1.55934], [6.85159, -3.05052], [6.06763, -4.40839], [5.01848, -5.57359], [3.75, -6.49519], [2.31763, -7.13292], [0.783963, -7.45891], [0, -7.45891]];

    actual = shape_arc(radius = 10, angle = [-90, 90], width = 5);

    assertEqualPoints(expected, actual);
}

test_shape_arc();