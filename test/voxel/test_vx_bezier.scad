use <voxel/vx_bezier.scad>;

module test_vx_bezier() {
    echo("==== test_vx_bezier ====");

    t_step = 0.05;
    width = 2;

    p1 = [0, 0, 0];
    p2 = [30, 15, 25];
    p3 = [-35, 20, -20];
    p4 = [10, 40, 9];

    expected = [[-1, 18, 3], [8, 10, 8], [7, 5, 6], [5, 3, 4], [3, 1, 2], [1, 1, 1], [1, 0, 1], [0, 0, 0], [2, 1, 2], [2, 1, 1], [4, 2, 3], [3, 2, 3], [3, 2, 2], [6, 4, 5], [5, 3, 5], [6, 4, 6], [8, 8, 8], [8, 6, 7], [7, 6, 7], [8, 7, 7], [8, 7, 8], [8, 9, 8], [4, 14, 6], [7, 12, 7], [7, 11, 8], [6, 13, 7], [6, 12, 7], [5, 13, 7], [5, 14, 6], [2, 16, 5], [3, 15, 5], [4, 15, 6], [3, 16, 5], [1, 17, 4], [2, 16, 4], [0, 18, 3], [0, 17, 4], [-6, 27, -1], [-5, 23, 0], [-3, 20, 1], [-2, 19, 2], [-1, 19, 3], [-2, 20, 2], [-3, 20, 2], [-4, 21, 1], [-3, 21, 1], [-5, 22, 0], [-4, 22, 0], [-6, 25, -1], [-6, 24, -1], [-6, 23, 0], [-6, 26, -1], [-2, 33, 1], [-5, 30, 0], [-6, 29, -1], [-6, 28, -1], [-5, 30, -1], [-4, 32, 0], [-4, 31, 0], [-5, 31, 0], [-3, 32, 1], [-3, 33, 1], [3, 36, 4], [0, 35, 3], [-1, 34, 2], [-2, 34, 2], [0, 35, 2], [1, 36, 3], [1, 35, 3], [2, 36, 4], [6, 38, 6], [4, 37, 5], [3, 37, 5], [5, 38, 6], [8, 39, 8], [7, 39, 7], [7, 38, 7], [9, 40, 8], [9, 39, 8], [9, 40, 9], [10, 40, 9]];
    actual = vx_bezier(p1, p2, p3, p4);

    assert(expected == actual);
}

test_vx_bezier();