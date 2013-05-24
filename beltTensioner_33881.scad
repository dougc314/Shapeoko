/**
 *   Belt Tensioner source,
 *   Copyright (C) 2012  James M Adams
 *
 *   This program is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU Lesser General Public License as published by
 *   the Free Software Foundation, either version 3 of the License, or
 *   any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU Lesser General Public License for more details.
 *
 *   You should have received a copy of the GNU Lesser General Public License
 *   along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

//Controls the height of the bar 
barL = 51.5;

//changes the fatness of the part
height = 10;


//MAIN - Generates the part by calling submodules
translate([0,-40,0])
union() {
    bar();

    difference(){
        union(){
            crossBar();
            topBar();
        }

        union(){
            translate([-10,0,0,])
            hScrew();

            translate([10,0,0,])
                hScrew();
        }
    }
}


/**
 *The two 3mm screw holes
 */
module hScrew() {
    translate([0,75,height/2])
    rotate([90,0,0])
    translate([0,0,-10])
    cylinder(40,2.2,1.5);
}


/**
 *Called to create the two crossbars
 */
module crossBar() {
    translate([-15,barL-0,0])
    cube([30,8,height]);
}


/**
 *The bar section of the T, contains the two 5mm screw hole
 */
module bar() {
    barE = 21.5;
    preferred = 13.5;

    difference() {
        union() {
            translate([-6.5,0,0]){
                cube([13,barL+barE-preferred,height]);
            }
        }

        //subtraction
        union() {
            //bottom hole
            translate([0,8.075,-1])
            screw5mm();

            //middle hole
            translate([0,27.35,-1])
            screw5mm();
        }
    }
}


/**
 * Top bar not connected to the T section
 */
module topBar() {
    translate([0,11,0])
    crossBar();
}


/**
 *Cutout for the 5mm screw and head
 */
module screw5mm() {

//five mm hole radius
screw5 = 3.1275;
screw5Top = 4.7;
screw5topH = 5;

   translate([0,0,-7])
    union() {
        translate([0,0,10]){
        cylinder(screw5topH+height,screw5Top,screw5Top);}
        cylinder(15,screw5,screw5);
    }
}