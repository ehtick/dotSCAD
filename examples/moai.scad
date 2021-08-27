use <polyhedron_hull.scad>;
use <sweep.scad>;
use <util/reverse.scad>;
use <util/slice.scad>;
use <ptf/ptf_rotate.scad>;

h = 50;
face = 12;
face_step = 3;
nose = 5;
nose_step = 1;
smoothing = false; // warning: previewing is slow if it's true.
smoothing_r = 2;
$fn = 12;

if(smoothing) {
	minkowski() {
		translate([0, h / 2, 0])
			moai(h, face, face_step, nose, nose_step);
		sphere(smoothing_r);
	}
}
else {
	translate([0, h / 2, 0])
		moai(h, face, face_step, nose, nose_step);
}

/*
translate([70, h / 2, 0])
    moai(h = 50, face = 18, face_step = 3, nose = 4, nose_step = 1);
	
translate([-60, h / 2, 0])
    moai(h = 40, face = 10, face_step = 2.5, nose = 3, nose_step = 1);*/

module moai(h, face, face_step, nose, nose_step) {
	profile = [
	    for(p = [
			// back
			[0, 0, 0],
			[0, 0, h * 0.25],
			[0, -h / 25, h * 0.45],
			[0, -h / 20, h / 2],
			[0, -h / 40, h / 4 * 3],
			[0, h / 20, h],
			// head : 6
			[0, -h / 10, h * 1.05],
			[0, -h / 5, h * 1.075],
			[0, -h / 3.2, h * 0.975],
			[0, -h / 3.5, h * 0.925],
			// nose : 10
			[0, -h / 2.4, h * 0.75],
			[0, -h / 2, h * 0.7],
			[0, -h / 2, h * 0.65],
			// mouth : 13
			[0, -h / 2.15, h * 0.6],
			[0, -h / 1.8, h * 0.475],
			[0, -h / 2, h * 0.425],
			[0, -h / 2.5, h * 0.375],
			[0, -h / 2, h * 0.25],
			[0, -h / 1.75, 0],
		]) p + [0, -h / 2.5, 0]
	];

	no_nose_profile = concat(slice(profile, 0, 10), slice(profile, 13));
	no_nose_sections = concat(
		[
			[
				for(i = [0:len(no_nose_profile) - 1])
				let(
					p = no_nose_profile[i],
					rp = ptf_rotate([p[0] * 0.8, p[1] * 0.4, p[2] * 0.85] + [1, -13, 0], face + face_step)
				)
				[rp[0], rp[1], rp[2] == 0 ? rp[2] : rp[2] + 3] + [1, 0, 0]
			],
			[
				for(i = [0:len(no_nose_profile) - 1])
				let(
					p = no_nose_profile[i],
					rp = ptf_rotate([p[0] * 0.85, p[1] * 0.8, p[2] * 0.96] + [0, -6, 0], face + face_step * 1.1)
				)
				[rp[0], rp[1], rp[2] == 0 ? rp[2] : rp[2] + 1]
			]
		],
		[
			for(a = face; a >= 0; a = a - face_step) 
				[for(i = [0:len(no_nose_profile) - 1])
					ptf_rotate(no_nose_profile[i], a)]
		]
	);

	back = [
		for(section = no_nose_sections)
		each slice(section, 0, 6)
	];
	
    nose_profile = slice(profile, 9, 14); 
	nose_sections = [
		for(a = nose; a >= 0; a = a - nose_step) 
			[for(i = [0:len(nose_profile) - 1])
				ptf_rotate(nose_profile[i], a)]
	];
	

	polyhedron_hull(
		concat(back, [for(p = back) [-p[0], p[1], p[2]]]), 
		polyhedron_abuse = true
	);

	sweep(no_nose_sections);
	mirror([1, 0, 0])
		sweep(no_nose_sections);

	
	translate([0, .01, 0]) {
		sweep(nose_sections);
		mirror([1, 0, 0])
			sweep(nose_sections);
	}
	
	hull() {
	    translate([0, h / 7.5, 0])
		scale([2, 1.2, 1])
		intersection() {
		    union() {
				sweep(no_nose_sections);
				mirror([1, 0, 0])
					sweep(no_nose_sections);
			}
			translate([0, -h / 2, 0])
				cube([h / 2 * 2, h / 2 * 2, h * 0.8 / 2], center = true);		
		}
		
		scale([1, 1, 1])
		intersection() {
		    union() {
				sweep(no_nose_sections);
				mirror([1, 0, 0])
					sweep(no_nose_sections);
			}
			translate([0, -h / 2, 0])
				cube([h / 2 * 2, h / 2 * 2, h * 1.25 / 2], center = true);		
		}	
	}
}