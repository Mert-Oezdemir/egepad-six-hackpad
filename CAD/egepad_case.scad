// EgePad Six Hackpad case source
// Owner: Ege Ozdemir
// Units: millimeters
//
// Export targets:
// - Top.STEP / Top.stl from top_plate()
// - Bottom.STEP / Bottom.stl from bottom_shell()
// - assembled-model.STEP / assembled-model.stl from assembled_preview()
//
// This file is the measured CAD source for the sandwich case concept.

$fn = 48;

case_w = 112;
case_h = 80;
corner_r = 8;

top_t = 3;
bottom_t = 13;
wall = 3;
floor_t = 2;

pcb_w = 92;
pcb_h = 60;
pcb_clearance = 0.4;

switch_cutout = 14;
switch_pitch = 19.05;
switch_origin_x = 28;
switch_origin_y = 24;

encoder_x = 88;
encoder_y = 28;
encoder_cutout_d = 14;

screw_d = 3.4;
insert_d = 4.7;
insert_depth = 4;

usb_cutout_w = 12;
usb_cutout_h = 8;

mounts = [
  [10, 10],
  [case_w - 10, 10],
  [10, case_h - 10],
  [case_w - 10, case_h - 10],
  [case_w / 2, 10],
  [case_w / 2, case_h - 10]
];

module rounded_box(w, h, z, r) {
  linear_extrude(height = z)
    hull() {
      translate([r, r]) circle(r);
      translate([w - r, r]) circle(r);
      translate([r, h - r]) circle(r);
      translate([w - r, h - r]) circle(r);
    }
}

module switch_grid_cutouts() {
  for (row = [0:1]) {
    for (col = [0:2]) {
      translate([
        switch_origin_x + col * switch_pitch,
        switch_origin_y + row * switch_pitch,
        -0.5
      ])
        cube([switch_cutout, switch_cutout, top_t + 1], center = true);
    }
  }
}

module screw_cutouts(d, z) {
  for (p = mounts) {
    translate([p[0], p[1], -0.5])
      cylinder(h = z + 1, d = d);
  }
}

module top_plate() {
  difference() {
    rounded_box(case_w, case_h, top_t, corner_r);
    switch_grid_cutouts();
    translate([encoder_x, encoder_y, -0.5])
      cylinder(h = top_t + 1, d = encoder_cutout_d);
    screw_cutouts(screw_d, top_t);
  }
}

module bottom_shell() {
  difference() {
    rounded_box(case_w, case_h, bottom_t, corner_r);

    translate([
      (case_w - (pcb_w + pcb_clearance * 2)) / 2,
      (case_h - (pcb_h + pcb_clearance * 2)) / 2,
      floor_t
    ])
      cube([pcb_w + pcb_clearance * 2, pcb_h + pcb_clearance * 2, bottom_t]);

    // XIAO USB-C cutout on right wall.
    translate([case_w - wall - 0.2, 48, 4])
      cube([wall + 1, usb_cutout_w, usb_cutout_h]);

    for (p = mounts) {
      translate([p[0], p[1], bottom_t - insert_depth])
        cylinder(h = insert_depth + 1, d = insert_d);
    }
  }
}

module assembled_preview() {
  color("#94a3b8") bottom_shell();
  translate([0, 0, bottom_t + 0.2])
    color("#e2e8f0") top_plate();
}

assembled_preview();

