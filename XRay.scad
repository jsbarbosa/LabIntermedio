// OpenScad

width = 59;
height = 25.4;
length = 149;
thick = 2.0;

module Screws()
{
    h = 50;
    translate([142.2/2, 52.4/2, 0])
    cylinder(h = h, d = 4, center = true);

    translate([142.2/2, -52.4/2, 0])
    cylinder(h = h, d = 4, center = true);

    translate([-142.2/2, 52.4/2, 0])
    cylinder(h = h, d = 4, center = true);

    translate([-142.2/2, -52.4/2, 0])
    cylinder(h = h, d = 4, center = true);
}
module Device()
{
    difference()
    {
        cube([length, width, height], center = true);
        
        Screws();
    }  
}

module Base()
{
    difference()
    {
        union()
        {
            rotate([0, 22, 0])
            {
                difference()
                {
                    translate([0, 0, -25.4/2])
                    cube([length + 2*thick, width + 2*thick, 5], center = true);
                    
                    Device();
                    Screws();
                }
            }

            translate([-3, 0, -20])
            {
                difference()
                {
                    h = length + 2*thick;
                    z = h*sin(22);
                    x = h*cos(22);

                    translate([5, 0, 0])
                    union()
                    {
                        cube([x*0.75, width + 2*thick, z], center = true);
                        translate([53, 0, 0])
                        cube([20, width/2, z], center = true);
                    }
             
                    translate([0, 0, 36])
                    rotate([0, 22, 0])
                    cube([x*2, width*2, z], center = true);
                    
                    translate([2, 0, 0])
                    cube([x/3, width*2, z*1.1], center = true);
                }
            }
        }
    
        x = (25/2)*3;
        translate([x, 0, -6])
        cube([15, width*0.8, 80], center = true);
        
        translate([-x, 0, -6])
        cube([15, width*0.8, 80], center = true);
        
        translate([x, 25*0.5, -60])
        cylinder(d = 7, h = 20);
        
        translate([x, -25*0.5, -60])
        cylinder(d = 7, h = 20);
        
        translate([-x, 25*0.5, -60])
        cylinder(d = 7, h = 20);
        
        translate([-x, -25*0.5, -60])
        cylinder(d = 7, h = 20);
    }
}

Base();
