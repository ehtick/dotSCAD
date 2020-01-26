include <unittest.scad>;
include <cross_sections.scad>;
include <archimedean_spiral.scad>;
include <rotate_p.scad>;

module test_cross_sections() {
    echo("==== test_cross_sections ====");

    shape_pts = [
        [-2, -10],
        [-2, 10],
        [2, 10],
        [2, -10]
    ];

    pts_angles = archimedean_spiral(
        arm_distance = 20,
        init_angle = 180,
        point_distance = 5,
        num_of_points = 100 
    ); 

    pts = [for(pt_angle = pts_angles) pt_angle[0]];
    angles = [
        for(i = [0:len(pts_angles) - 1]) [90, 0, pts_angles[i][1]]
    ];  

    expected =  [[[-8, -8.98657e-6, -10], [-8, -8.98657e-6, 10], [-12, -0.0000134799, 10], [-12, -0.0000134799, -10]], [[-8.69941, -4.81325, -9.96698], [-8.14922, -4.50884, 9.84122], [-11.6156, -6.42677, 9.96698], [-12.1658, -6.73118, -9.84122]], [[-6.87799, -9.40726, -9.92296], [-6.14294, -8.4019, 9.67387], [-8.45619, -11.5658, 9.92296], [-9.19124, -12.5712, -9.67387]], [[-3.19172, -12.82, -9.86815], [-2.74495, -11.0255, 9.4983], [-3.6807, -14.784, 9.86815], [-4.12747, -16.5785, -9.4983]], [[1.59972, -14.5687, -9.80282], [1.33342, -12.1435, 9.31486], [1.75076, -15.9442, 9.80282], [2.01706, -18.3694, -9.31486]], [[6.77117, -14.5107, -9.72719], [5.49566, -11.7773, 9.12391], [7.08993, -15.1939, 9.72719], [8.36544, -17.9273, -9.12391]], [[11.6998, -12.74, -9.64155], [9.27924, -10.1042, 8.92583], [11.791, -12.8393, 9.64155], [14.2116, -15.4751, -8.92583]], [[15.8949, -9.50598, -9.54615], [12.354, -7.38833, 8.72099], [15.4894, -9.26352, 9.54615], [19.0303, -11.3812, -8.72099]], [[19.0056, -5.15104, -9.44129], [14.5101, -3.93264, 8.50976], [17.9753, -4.8718, 9.44129], [22.4708, -6.0902, -8.50976]], [[20.8154, -0.0609642, -9.32725], [15.6418, -0.0458117, 8.29253], [19.1657, -0.0561326, 9.32725], [24.3394, -0.0712851, -8.29253]], [[21.229, 5.37195, -9.20434], [15.7291, 3.9802, 8.06968], [19.0783, 4.82771, 9.20434], [24.5783, 6.21946, -8.06968]], [[20.2549, 10.7762, -9.07287], [14.8198, 7.88457, 7.8416], [17.8063, 9.47349, 9.07287], [23.2414, 12.3651, -7.8416]], [[17.9859, 15.8199, -8.93315], [13.0133, 11.4462, 7.60868], [15.4975, 13.6312, 8.93315], [20.47, 18.0049, -7.60868]], [[14.5804, 20.2235, -8.78551], [10.4452, 14.4878, 7.37132], [12.3349, 17.1089, 8.78551], [16.4701, 22.8447, -7.37132]], [[10.2433, 23.7661, -8.63027], [7.27401, 16.8769, 7.1299], [8.5216, 19.7715, 8.63027], [11.4909, 26.6607, -7.1299]], [[5.20923, 26.2883, -8.46779], [3.67076, 18.5244, 6.88482], [4.26761, 21.5364, 8.46779], [5.80607, 29.3003, -6.88482]], [[-0.272672, 27.6913, -8.29839], [-0.190853, 19.3821, 6.63649], [-0.220264, 22.369, 8.29839], [-0.302083, 30.6781, -6.63649]], [[-5.95173, 27.9333, -8.12244], [-4.14168, 19.4382, 6.38528], [-4.74634, 22.276, 8.12244], [-6.55639, 30.7712, -6.38528]], [[-11.5865, 27.0247, -7.94028], [-8.02297, 18.713, 6.13159], [-9.13197, 21.2996, 7.94028], [-12.6955, 29.6114, -6.13159]], [[-16.9536, 25.0212, -7.75228], [-11.6908, 17.254, 5.87583], [-13.2196, 19.5104, 7.75228], [-18.4825, 27.2776, -5.87583]], [[-21.8539, 22.0168, -7.55879], [-15.019, 15.131, 5.61836], [-16.8756, 17.0014, 7.55879], [-23.7105, 23.8873, -5.61836]], [[-26.1179, 18.1365, -7.36018], [-17.9017, 12.4311, 5.35959], [-19.9912, 13.8821, 7.36018], [-28.2075, 19.5875, -5.35959]], [[-29.6081, 13.5283, -7.15682], [-20.2537, 9.25418, 5.0999], [-22.4834, 10.2729, 7.15682], [-31.8378, 14.5471, -5.0999]], [[-32.2209, 8.35645, -6.94907], [-22.0116, 5.70868, 4.83966], [-24.2939, 6.30058, 6.94907], [-34.5032, 8.94835, -4.83966]], [[-33.8866, 2.79414, -6.73732], [-23.1328, 1.90742, 4.57925], [-25.3885, 2.09342, 6.73732], [-36.1423, 2.98013, -4.57925]], [[-34.5686, -2.98247, -6.52192], [-23.595, -2.0357, 4.31905], [-25.7552, -2.22208, 6.52192], [-36.7288, -3.16884, -4.31905]], [[-34.2615, -8.79991, -6.30327], [-23.395, -6.0089, 4.05942], [-25.4024, -6.52448, 6.30327], [-36.2689, -9.31549, -4.05942]], [[-32.9889, -14.4922, -6.08172], [-22.5471, -9.90508, 3.80073], [-24.3566, -10.7, 6.08172], [-34.7984, -15.2872, -3.80073]], [[-30.7998, -19.9051, -5.85765], [-21.0811, -13.6241, 3.54332], [-22.6602, -14.6447, 5.85765], [-32.3789, -20.9256, -3.54332]], [[-27.7658, -24.8989, -5.63143], [-19.0407, -17.0747, 3.28755], [-20.3687, -18.2656, 5.63143], [-29.0938, -26.0898, -3.28755]], [[-23.9771, -29.3517, -5.40343], [-16.4814, -20.1757, 3.03376], [-17.5489, -21.4826, 5.40343], [-25.0447, -30.6585, -3.03376]], [[-19.5391, -33.1605, -5.17403], [-13.4681, -22.8573, 2.78228], [-14.276, -24.2283, 5.17403], [-20.3469, -34.5314, -2.78228]], [[-14.568, -36.2428, -4.94357], [-10.0737, -25.0616, 2.53344], [-10.6314, -26.4491, 4.94357], [-15.1258, -37.6303, -2.53344]], [[-9.18817, -38.5369, -4.71244], [-6.37624, -26.7432, 2.28756], [-6.70093, -28.105, 4.71244], [-9.51286, -39.8988, -2.28756]], [[-3.52774, -40.0022, -4.48097], [-2.45775, -27.8692, 2.04496], [-2.5724, -29.1693, 4.48097], [-3.64239, -41.3023, -2.04496]], [[2.28404, -40.6181, -4.24954], [1.59808, -28.4193, 1.80592], [1.66607, -29.6285, 4.24954], [2.35204, -41.8273, -1.80592]], [[8.11996, -40.3838, -4.01848], [5.70741, -28.3852, 1.57074], [5.92777, -29.4811, 4.01848], [8.34031, -41.4797, -1.57074]], [[13.8574, -39.3163, -3.78814], [9.78792, -27.7703, 1.33971], [10.1288, -28.7376, 3.78814], [14.1983, -40.2835, -1.33971]], [[19.3807, -37.4496, -3.55887], [13.7602, -26.5889, 1.1131], [14.1896, -27.4188, 3.55887], [19.8102, -38.2794, -1.1131]], [[24.5832, -34.8323, -3.33099], [17.549, -24.8655, 0.891165], [18.0359, -25.5554, 3.33099], [25.0701, -35.5222, -0.891165]], [[29.3684, -31.5262, -3.10482], [21.0844, -22.6336, 0.674163], [21.5996, -23.1866, 3.10482], [29.8836, -32.0792, -0.674163]], [[33.6518, -27.6038, -2.8807], [24.3029, -19.9351, 0.462334], [24.8198, -20.3591, 2.8807], [34.1688, -28.0278, -0.462334]], [[37.3615, -23.1466, -2.65893], [27.1477, -16.8188, 0.255906], [27.6433, -17.1259, 2.65893], [37.8571, -23.4537, -0.255906]], [[40.4388, -18.2431, -2.43982], [29.57, -13.3399, 0.0550995], [30.0248, -13.545, 2.43982], [40.8936, -18.4483, -0.0550995]], [[42.8385, -12.9862, -2.22366], [31.529, -9.55782, -0.13988], [31.9278, -9.67872, 2.22366], [43.2373, -13.1071, 0.13988]], [[44.529, -7.47204, -2.01074], [32.9924, -5.53618, -0.328838], [33.3241, -5.59185, 2.01074], [44.8607, -7.52771, 0.328838]], [[45.4921, -1.79751, -1.80134], [33.9365, -1.34092, -0.51159], [34.1942, -1.3511, 1.80134], [45.7499, -1.8077, 0.51159]], [[45.7226, 3.94115, -1.59574], [34.3463, 2.96055, -0.687966], [34.5272, 2.97614, 1.59574], [45.9035, 3.95674, 0.687966]], [[45.2274, 9.65004, -1.39418], [34.2153, 7.30043, -0.857807], [34.3202, 7.32281, 1.39418], [45.3323, 9.67243, 0.857807]], [[44.025, 15.239, -1.19694], [33.5455, 11.6116, -1.02097], [33.5788, 11.6231, 1.19694], [44.0583, 15.2505, 1.02097]], [[42.1445, 20.6229, -1.00423], [32.3469, 15.8286, -1.17731], [32.3158, 15.8134, 1.00423], [42.1134, 20.6077, 1.17731]], [[39.6244, 25.7227, -0.8163], [30.6369, 19.8884, -1.32672], [30.5513, 19.8328, 0.8163], [39.5387, 25.6671, 1.32672]], [[36.5118, 30.4663, -0.633365], [28.4403, 23.7313, -1.46909], [28.312, 23.6242, 0.633365], [36.3834, 30.3592, 1.46909]], [[32.8609, 34.7894, -0.455635], [25.7884, 27.3018, -1.60432], [25.6306, 27.1348, 0.455635], [32.7032, 34.6224, 1.60432]], [[28.7323, 38.636, -0.283306], [22.7182, 30.5489, -1.73233], [22.5453, 30.3164, 0.283306], [28.5594, 38.4035, 1.73233]], [[24.1911, 41.9588, -0.116567], [19.2722, 33.4271, -1.85305], [19.0988, 33.1262, 0.116567], [24.0177, 41.6579, 1.85305]], [[19.3063, 44.7193, 0.0444085], [15.4973, 35.8963, -1.96642], [15.3379, 35.5271, -0.0444085], [19.1469, 44.3501, 1.96642]], [[14.1494, 46.8882, 0.199456], [11.4439, 37.9228, -2.0724], [11.3127, 37.4878, -0.199456], [14.0182, 46.4532, 2.0724]], [[8.79326, 48.4452, 0.348425], [7.16581, 39.479, -2.17096], [7.07582, 38.9832, -0.348425], [8.70327, 47.9494, 2.17096]], [[3.31108, 49.3786, 0.491176], [2.71867, 40.5439, -2.26209], [2.68183, 39.9944, -0.491176], [3.27424, 48.8292, 2.26209]], [[-2.22457, 49.6854, 0.627581], [-1.84032, 41.1031, -2.34576], [-1.81372, 40.509, -0.627581], [-2.19797, 49.0913, 2.34576]], [[-7.74272, 49.3709, 0.757525], [-6.45329, 41.1489, -2.42201], [-6.35477, 40.5207, -0.757525], [-7.64419, 48.7426, 2.42201]], [[-13.1748, 48.4477, 0.880906], [-11.0625, 40.6802, -2.49083], [-10.8856, 40.0295, -0.880906], [-12.9979, 47.797, 2.49083]], [[-18.4555, 46.936, 0.997633], [-15.611, 39.702, -2.55228], [-15.3512, 39.0412, -0.997633], [-18.1957, 46.2753, 2.55228]], [[-23.5232, 44.8624, 1.10763], [-20.0433, 38.2257, -2.60638], [-19.6983, 37.5678, -1.10763], [-23.1783, 44.2046, 2.60638]], [[-28.3209, 42.2594, 1.21083], [-24.306, 36.2684, -2.65321], [-23.8757, 35.6265, -1.21083], [-27.8907, 41.6174, 2.65321]], [[-32.7964, 39.1648, 1.30718], [-28.3484, 33.853, -2.69282], [-27.8347, 33.2397, -1.30718], [-32.2828, 38.5514, 2.69282]], [[-36.9028, 35.621, 1.39664], [-32.123, 31.0072, -2.7253], [-31.5298, 30.4347, -1.39664], [-36.3096, 35.0485, 2.7253]], [[-40.5987, 31.6744, 1.47919], [-35.586, 27.7636, -2.75075], [-34.919, 27.2432, -1.47919], [-39.9317, 31.154, 2.75075]], [[-43.8488, 27.3743, 1.5548], [-38.6979, 24.1587, -2.76926], [-37.9643, 23.7007, -1.5548], [-43.1152, 26.9164, 2.76926]], [[-46.6235, 22.7728, 1.62348], [-41.4233, 20.2328, -2.78095], [-40.6318, 19.8462, -1.62348], [-45.8319, 22.3862, 2.78095]], [[-48.8992, 17.9235, 1.68524], [-43.7318, 16.0295, -2.78595], [-42.8922, 15.7217, -1.68524], [-48.0596, 17.6158, 2.78595]], [[-50.6585, 12.8814, 1.74009], [-45.598, 11.5946, -2.7844], [-44.721, 11.3716, -1.74009], [-49.7815, 12.6584, 2.7844]], [[-51.8899, 7.70161, 1.78808], [-47.0016, 6.97608, -2.77644], [-46.0986, 6.84206, -1.78808], [-50.9869, 7.56758, 2.77644]], [[-52.5875, 2.43952, 1.82925], [-47.9276, 2.22335, -2.76223], [-47.0103, 2.1808, -1.82925], [-51.6702, 2.39697, 2.76223]], [[-52.7511, -2.85036, 1.86365], [-48.3661, -2.61342, -2.74193], [-47.4463, -2.56372, -1.86365], [-51.8313, -2.80066, 2.74193]], [[-52.386, -8.11469, 1.89136], [-48.3128, -7.48374, -2.71573], [-47.4022, -7.34269, -1.89136], [-51.4755, -7.97365, 2.71573]], [[-51.5025, -13.3018, 1.91246], [-47.7683, -12.3374, -2.68381], [-46.8782, -12.1075, -1.91246], [-50.6124, -13.072, 2.68381]], [[-50.1155, -18.3622, 1.92704], [-46.7385, -17.1249, -2.64636], [-45.8796, -16.8102, -1.92704], [-49.2566, -18.0476, 2.64636]], [[-48.2446, -23.2489, 1.93521], [-45.2341, -21.7982, -2.60358], [-44.4163, -21.4041, -1.93521], [-47.4268, -22.8548, 2.60358]], [[-45.9133, -27.9177, 1.93709], [-43.2704, -26.3107, -2.5557], [-42.5027, -25.8439, -1.93709], [-45.1455, -27.4508, 2.5557]], [[-43.1488, -32.3276, 1.93279], [-40.8674, -30.6183, -2.50292], [-40.1574, -30.0864, -1.93279], [-42.4388, -31.7957, 2.50292]], [[-39.9817, -36.441, 1.92245], [-38.0489, -34.6794, -2.44547], [-37.4033, -34.0909, -1.92245], [-39.336, -35.8525, 2.44547]], [[-36.4453, -40.2239, 1.90622], [-34.8427, -38.4552, -2.38358], [-34.2666, -37.8194, -1.90622], [-35.8692, -39.5881, 2.38358]], [[-32.5754, -43.6462, 1.88427], [-31.2798, -41.9102, -2.3175], [-30.7772, -41.2368, -1.88427], [-32.0728, -42.9727, 2.3175]], [[-28.4101, -46.6815, 1.85674], [-27.3944, -45.0126, -2.24747], [-26.9677, -44.3114, -1.85674], [-27.9833, -45.9803, 2.24747]], [[-23.9887, -49.3074, 1.82383], [-23.2234, -47.7342, -2.17373], [-22.8736, -47.0152, -1.82383], [-23.639, -48.5884, 2.17373]], [[-19.3523, -51.5056, 1.78571], [-18.8056, -50.0507, -2.09656], [-18.5325, -49.3239, -1.78571], [-19.0792, -50.7788, 2.09656]], [[-14.5423, -53.2619, 1.74258], [-14.182, -51.9421, -2.01619], [-13.984, -51.2169, -1.74258], [-14.3443, -52.5367, 2.01619]], [[-9.60108, -54.5658, 1.69463], [-9.39462, -53.3924, -1.93291], [-9.2689, -52.6779, -1.69463], [-9.47536, -53.8513, 1.93291]], [[-4.57088, -55.4109, 1.64208], [-4.48665, -54.3899, -1.84698], [-4.42929, -53.6945, -1.64208], [-4.51351, -54.7155, 1.84698]], [[0.506175, -55.7947, 1.58515], [0.498304, -54.9272, -1.75867], [0.492238, -54.2584, -1.58515], [0.500108, -55.126, 1.75867]], [[5.58849, -55.7184, 1.52406], [5.51653, -55.0009, -1.66826], [5.45282, -54.3657, -1.52406], [5.52477, -55.0831, 1.66826]], [[10.6353, -55.1865, 1.45903], [10.5246, -54.6121, -1.57602], [10.4097, -54.0161, -1.45903], [10.5204, -54.5905, 1.57602]], [[15.607, -54.2074, 1.39031], [15.4798, -53.7657, -1.48224], [15.3208, -53.2136, -1.39031], [15.448, -53.6553, 1.48224]], [[20.4652, -52.7924, 1.31814], [20.3404, -52.4705, -1.38719], [20.1448, -51.966, -1.31814], [20.2696, -52.2879, 1.38719]], [[25.1733, -50.956, 1.24277], [25.0661, -50.7391, -1.29116], [24.8416, -50.2847, -1.24277], [24.9488, -50.5017, 1.29116]], [[29.6964, -48.7156, 1.16445], [29.6183, -48.5876, -1.19443], [29.3728, -48.1848, -1.16445], [29.4508, -48.3128, 1.19443]], [[34.0016, -46.0913, 1.08344], [33.9605, -46.0356, -1.09728], [33.7016, -45.6846, -1.08344], [33.7427, -45.7403, 1.09728]], [[38.0584, -43.1054, 1], [38.0584, -43.1054, -1], [37.7937, -42.8055, -1], [37.7937, -42.8055, 1]]];

    sects = cross_sections(shape_pts, pts, angles, twist = 180, scale = 0.1);

    for(i = [0:len(expected) - 1]) {
        assertEqualPoints(expected[i], sects[i]);
    }
}

test_cross_sections();