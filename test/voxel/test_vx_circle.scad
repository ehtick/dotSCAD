use <voxel/vx_circle.scad>

module test_vx_circle() {
    echo("==== test_vx_circle ====");

    expected = [[0, 0], [3, 0], [7, 0], [10, 0], [2, -1], [8, -1], [-3, -9], [-7, -4], [-4, -4], [-9, -5], [-2, -5], [-3, 5], [3, -8], [-3, -6], [-8, 6], [-2, 6], [6, 6], [0, 10], [0, -1], [3, -1], [7, -1], [10, -1], [2, 1], [8, 1], [3, -9], [-7, 4], [0, 4], [2, -5], [-9, 5], [3, 5], [-4, -8], [3, -6], [2, 6], [0, -7], [-10, 0], [-1, 0], [3, 1], [7, 1], [10, 1], [-1, 10], [2, -2], [8, -2], [-4, -9], [-1, 4], [-7, -5], [-3, -5], [-4, 5], [4, -8], [-4, -6], [-3, 6], [-1, -7], [-10, -1], [-1, -1], [1, 10], [3, -2], [7, -2], [10, -2], [2, 2], [8, 2], [4, -9], [1, 4], [3, -5], [-7, 5], [4, 5], [-5, -8], [4, -6], [3, 6], [1, -7], [0, -10], [-10, 1], [0, 1], [3, 2], [7, 2], [10, 2], [-2, 10], [0, -3], [8, -3], [-2, 4], [-5, -9], [-4, -5], [-5, 5], [5, -8], [-7, -6], [-5, -6], [-4, 6], [0, 8], [-2, -7], [5, 0], [-1, -10], [-1, 1], [-10, -2], [2, 10], [-1, -3], [3, -3], [7, -3], [10, -3], [8, 3], [2, 4], [5, -9], [4, -5], [-6, -8], [5, -6], [-7, 6], [4, 6], [-1, 8], [2, -7], [-6, 0], [-5, 0], [1, 0], [9, 0], [1, -10], [5, -1], [-10, 2], [1, -3], [3, 3], [7, 3], [10, 3], [-3, 10], [8, -4], [-3, 4], [6, -8], [-5, 6], [1, 8], [-7, -7], [-3, -7], [-6, -1], [-5, -1], [1, -1], [9, -1], [5, 1], [-2, -10], [-10, -3], [-2, -3], [3, 10], [0, -4], [7, -4], [3, 4], [8, 4], [5, 6], [-2, 8], [3, -7], [0, 7], [-6, 1], [-5, 1], [1, 1], [9, 1], [2, -10], [5, -2], [2, -3], [-10, 3], [-1, -4], [-4, 4], [7, 4], [8, -5], [-6, 6], [2, 8], [-4, -7], [-1, 7], [-8, 0], [-3, 0], [4, 0], [6, 0], [-6, -2], [-5, -2], [0, -2], [9, -2], [5, 2], [-3, -10], [1, -4], [0, 9], [7, -5], [8, 5], [-3, 8], [4, -7], [1, 7], [-8, -1], [-3, -1], [4, -1], [6, -1], [-1, -2], [-6, 2], [-5, 2], [9, 2], [3, -10], [5, -3], [-2, -4], [-1, 9], [7, 5], [8, -6], [3, 8], [-5, -7], [-2, 7], [-8, 1], [-3, 1], [4, 1], [6, 1], [1, -2], [-6, -3], [-5, -3], [9, -3], [5, 3], [2, -4], [1, 9], [7, -6], [8, 6], [-4, 8], [5, -7], [2, 7], [-9, 0], [-2, 0], [-8, -2], [-3, -2], [4, -2], [6, -2], [-6, 3], [-5, 3], [9, 3], [-3, -4], [5, -4], [-2, 9], [7, 6], [4, 8], [-6, -7], [-3, 7], [-9, -1], [-2, -1], [-8, 2], [-3, 2], [4, 2], [6, 2], [-6, -4], [-5, -4], [3, -4], [9, -4], [5, 4], [2, 9], [-5, 8], [6, -7], [7, -7], [3, 7], [-7, 0], [-4, 0], [-9, 1], [-2, 1], [-8, -3], [-3, -3], [4, -3], [6, -3], [-6, 4], [-5, 4], [9, 4], [-3, 9], [5, -5], [5, 8], [-4, 7], [7, 7], [-7, -1], [-4, -1], [-9, -2], [-2, -2], [-8, 3], [0, 3], [4, 3], [6, 3], [3, 9], [-6, -5], [-5, -5], [9, -5], [5, 5], [0, -8], [-6, 8], [4, 7], [-7, 1], [-4, 1], [-9, 2], [0, 2], [-1, 3], [0, -9], [-8, -4], [4, -4], [6, -4], [-4, 9], [-6, 5], [0, 5], [9, 5], [-1, -8], [0, -6], [6, 8], [-5, 7], [-7, -2], [-4, -2], [-1, 2], [-9, -3], [1, 3], [-1, -9], [-8, 4], [4, 4], [6, 4], [4, 9], [-1, 5], [1, -8], [-6, -6], [-1, -6], [5, 7], [-7, 2], [-4, 2], [1, 2], [-9, 3], [-2, 3], [1, -9], [-8, -5], [0, -5], [6, -5], [1, 5], [-5, 9], [-2, -8], [1, -6], [0, 6], [-6, 7], [-2, 2], [-7, -3], [-4, -3], [2, 3], [-2, -9], [-9, -4], [-1, -5], [-8, 5], [-2, 5], [6, 5], [5, 9], [2, -8], [-2, -6], [-1, 6], [6, 7], [2, 0], [8, 0], [-7, 3], [-4, 3], [-3, 3], [2, -9], [-9, 4], [1, -5], [2, 5], [-3, -8], [-8, -6], [2, -6], [6, -6], [1, 6], [-7, 7]];
    actual = vx_circle(10, true);

    assert(expected == actual);
}

test_vx_circle();