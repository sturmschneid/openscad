include <../vitamins/ISOThread.scad>
include <../utils/teardrops.scad>
$fn=100;

//difference() {
//cylinder(h = 10, r1 = 35/2, r2 = 35/2, center = false);
//translate([0,0,-0.1])nut(M8_nut, nyloc = true, brass = true);
//}

module body() {
    for(i = [120,-120]) {
        rotate([0,0,i]) {
            difference() {
                hull() {
                    translate([0,0,20]) cylinder(h=1,r=25/2);
                    leg();
                }
                translate([30,0,3+5]) {
                    rotate([0,0,90]) {
                        #teardrop(h=10,r=8/2,center=true);
                        #cylinder(h=30,r=3.5/2,center=true);
                    }
                }
            }
        }
    }
}

module leg() {
    difference() {
       linear_extrude(height=3) {
                hull() {
                translate([30,0]) circle(r=8/2);
                circle(r=42/2);
            }
        }
    }
}

module complete_body () { 
    difference() 
    {
        body();
        translate([0,0,-0.1])#cylinder(r=25/2,h=10);
        translate([0,0,21.1-5])#hex_nut(8.5,5);
        translate([0,0,10.3])#cylinder(r=10/2,h=20);
        translate([21-4,0,15+3]) {
            rotate([0,0,90]) {
                #teardrop(h=30,r=8/2,center=true);
                translate([0,0,-10])#cylinder(h=30,r=3.5/2,center=true);
            }
        }
    }
    support();
}

module support() {
    difference() {
        difference() {
            cylinder(r=20/2,h=10);
            translate([-2/2,-5/2,-0.3])cube([2,5,5]);
        }
        for(i=[-8:4:9]) {
            translate([i,0,9]) {
                rotate([90,0,0])teardrop(h=21,r=2/2,center=true);
            }
        }
    }
}

complete_body();