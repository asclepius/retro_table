$fn=100;

table_width=4*12;
table_depth=2*12;
board_width=0.75;

table_height=6;

leg_height=1*12;
leg_d=1.5;

// Define the slab for the top and bottom
module slab(x=0,y=0,z=0){
color("sienna")
translate([x,y,z])
cube([table_width,table_depth,board_width],center=true);
};

// Define the slab for the sides
module side(x=0,y=0,z=0){
color("sienna")

translate([x,y,z])
rotate([0,-90,0])
cube([table_height,table_depth,board_width],center=true);
};

//Define the legs
module leg(x=0,y=0,z=0){
color("sienna")

translate([x,y,z])
rotate([0,0,0])
cylinder(h=leg_height,d=leg_d,center=true);
};

slab(z=table_height);
slab();

side(x=table_width/2-board_width/2,z=table_height/2);
side(x=-(table_width/2-board_width/2),z=table_height/2);


module leg_dist(percent=1/1.61803398875)
{
	leg(x=(percent*table_width/2),y=percent*table_depth/2);
	leg(x=(-percent*table_width/2),y=percent*table_depth/2);
	leg(x=(percent*table_width/2),y=-percent*table_depth/2);
	leg(x=(-percent*table_width/2),y=-percent*table_depth/2);

}

leg_dist();