include <unittest.scad>;
include <pixel/px_circle.scad>;

module test_px_circle() {
    echo("==== test_px_circle ====");

    expected = [[0, 10], [0, -10], [-10, 0], [-9, 0], [-8, 0], [-7, 0], [-6, 0], [-5, 0], [-4, 0], [-3, 0], [-2, 0], [-1, 0], [0, 0], [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [8, 0], [9, 0], [10, 0], [-1, -10], [0, -10], [1, -10], [-10, -1], [-9, -1], [-8, -1], [-7, -1], [-6, -1], [-5, -1], [-4, -1], [-3, -1], [-2, -1], [-1, -1], [0, -1], [1, -1], [2, -1], [3, -1], [4, -1], [5, -1], [6, -1], [7, -1], [8, -1], [9, -1], [10, -1], [-10, 1], [-9, 1], [-8, 1], [-7, 1], [-6, 1], [-5, 1], [-4, 1], [-3, 1], [-2, 1], [-1, 1], [0, 1], [1, 1], [2, 1], [3, 1], [4, 1], [5, 1], [6, 1], [7, 1], [8, 1], [9, 1], [10, 1], [-1, 10], [0, 10], [1, 10], [-2, -10], [-1, -10], [0, -10], [1, -10], [2, -10], [-10, -2], [-9, -2], [-8, -2], [-7, -2], [-6, -2], [-5, -2], [-4, -2], [-3, -2], [-2, -2], [-1, -2], [0, -2], [1, -2], [2, -2], [3, -2], [4, -2], [5, -2], [6, -2], [7, -2], [8, -2], [9, -2], [10, -2], [-10, 2], [-9, 2], [-8, 2], [-7, 2], [-6, 2], [-5, 2], [-4, 2], [-3, 2], [-2, 2], [-1, 2], [0, 2], [1, 2], [2, 2], [3, 2], [4, 2], [5, 2], [6, 2], [7, 2], [8, 2], [9, 2], [10, 2], [-2, 10], [-1, 10], [0, 10], [1, 10], [2, 10], [-3, -10], [-2, -10], [-1, -10], [0, -10], [1, -10], [2, -10], [3, -10], [-10, -3], [-9, -3], [-8, -3], [-7, -3], [-6, -3], [-5, -3], [-4, -3], [-3, -3], [-2, -3], [-1, -3], [0, -3], [1, -3], [2, -3], [3, -3], [4, -3], [5, -3], [6, -3], [7, -3], [8, -3], [9, -3], [10, -3], [-10, 3], [-9, 3], [-8, 3], [-7, 3], [-6, 3], [-5, 3], [-4, 3], [-3, 3], [-2, 3], [-1, 3], [0, 3], [1, 3], [2, 3], [3, 3], [4, 3], [5, 3], [6, 3], [7, 3], [8, 3], [9, 3], [10, 3], [-3, 10], [-2, 10], [-1, 10], [0, 10], [1, 10], [2, 10], [3, 10], [-4, -9], [-3, -9], [-2, -9], [-1, -9], [0, -9], [1, -9], [2, -9], [3, -9], [4, -9], [-9, -4], [-8, -4], [-7, -4], [-6, -4], [-5, -4], [-4, -4], [-3, -4], [-2, -4], [-1, -4], [0, -4], [1, -4], [2, -4], [3, -4], [4, -4], [5, -4], [6, -4], [7, -4], [8, -4], [9, -4], [-9, 4], [-8, 4], [-7, 4], [-6, 4], [-5, 4], [-4, 4], [-3, 4], [-2, 4], [-1, 4], [0, 4], [1, 4], [2, 4], [3, 4], [4, 4], [5, 4], [6, 4], [7, 4], [8, 4], [9, 4], [-4, 9], [-3, 9], [-2, 9], [-1, 9], [0, 9], [1, 9], [2, 9], [3, 9], [4, 9], [-5, -9], [-4, -9], [-3, -9], [-2, -9], [-1, -9], [0, -9], [1, -9], [2, -9], [3, -9], [4, -9], [5, -9], [-9, -5], [-8, -5], [-7, -5], [-6, -5], [-5, -5], [-4, -5], [-3, -5], [-2, -5], [-1, -5], [0, -5], [1, -5], [2, -5], [3, -5], [4, -5], [5, -5], [6, -5], [7, -5], [8, -5], [9, -5], [-9, 5], [-8, 5], [-7, 5], [-6, 5], [-5, 5], [-4, 5], [-3, 5], [-2, 5], [-1, 5], [0, 5], [1, 5], [2, 5], [3, 5], [4, 5], [5, 5], [6, 5], [7, 5], [8, 5], [9, 5], [-5, 9], [-4, 9], [-3, 9], [-2, 9], [-1, 9], [0, 9], [1, 9], [2, 9], [3, 9], [4, 9], [5, 9], [-6, -8], [-5, -8], [-4, -8], [-3, -8], [-2, -8], [-1, -8], [0, -8], [1, -8], [2, -8], [3, -8], [4, -8], [5, -8], [6, -8], [-8, -6], [-7, -6], [-6, -6], [-5, -6], [-4, -6], [-3, -6], [-2, -6], [-1, -6], [0, -6], [1, -6], [2, -6], [3, -6], [4, -6], [5, -6], [6, -6], [7, -6], [8, -6], [-8, 6], [-7, 6], [-6, 6], [-5, 6], [-4, 6], [-3, 6], [-2, 6], [-1, 6], [0, 6], [1, 6], [2, 6], [3, 6], [4, 6], [5, 6], [6, 6], [7, 6], [8, 6], [-6, 8], [-5, 8], [-4, 8], [-3, 8], [-2, 8], [-1, 8], [0, 8], [1, 8], [2, 8], [3, 8], [4, 8], [5, 8], [6, 8], [-7, -7], [-6, -7], [-5, -7], [-4, -7], [-3, -7], [-2, -7], [-1, -7], [0, -7], [1, -7], [2, -7], [3, -7], [4, -7], [5, -7], [6, -7], [7, -7], [-7, -7], [-6, -7], [-5, -7], [-4, -7], [-3, -7], [-2, -7], [-1, -7], [0, -7], [1, -7], [2, -7], [3, -7], [4, -7], [5, -7], [6, -7], [7, -7], [-7, 7], [-6, 7], [-5, 7], [-4, 7], [-3, 7], [-2, 7], [-1, 7], [0, 7], [1, 7], [2, 7], [3, 7], [4, 7], [5, 7], [6, 7], [7, 7], [-7, 7], [-6, 7], [-5, 7], [-4, 7], [-3, 7], [-2, 7], [-1, 7], [0, 7], [1, 7], [2, 7], [3, 7], [4, 7], [5, 7], [6, 7], [7, 7]];
    actual = px_circle(10, true);

    assertEqualPoints(expected, actual);
}

test_px_circle();