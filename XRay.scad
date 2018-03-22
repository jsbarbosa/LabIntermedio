module Base()
{
    thick = 2.0;
    size = 143;
    
    pi = 3.1416;
    
    deg = 22;

    difference()
    {
        union()
        {
            cube([143*cos(deg), 58 + 2*thick, thick]);
            
            translate([0, -2*thick, 0])
            cube([size*cos(deg), 2*thick, size*sin(deg)]);
            
            translate([0, 2*thick + 58, 0])
            cube([size*cos(deg), 2*thick, size*sin(deg)]);
        }
    
        translate([0, 0, 157])
        rotate([0, -deg, 0])
        cube([2*size, 2*size, 2*size], center = true);
    }
    
    translate([6*thick, 0, 0])
    rotate([0, -deg, 0])
    
    difference()
    {
        cube([size*1.2, 15, thick]);
        translate([4, 4, 0])
        cube([size*1.1, 12 - 2*thick, 3*thick]);
    }
    
    translate([6*thick, 58 - 15/2 - 1.5*thick, 0])
    rotate([0, -deg, 0])
    difference()
    {
        cube([size*1.2, 15, thick]);
        translate([4, 4, 0])
        cube([size*1.15, 12 - 2*thick, 3*thick]);
    }

}

Base();