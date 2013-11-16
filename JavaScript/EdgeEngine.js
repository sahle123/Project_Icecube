/*********************************************************************
Author: Jacob Rail
Data: November 15th, 2013




This code creates a 3d array of 0's and 1's to which a remove function
is capable of changing a 0 --> 1. In the even a 1 is selected, the 
remaining 1's on higher levels are look at to see if they are being 
supported by the 'edge' of another 1. If the answer is no, the 1 is 
moved down untill an 'edge' is found. 

TO CHECK:
--------
(1) Are block that will fall of the level accounted for. Meaning you
do no go into in infinite loop or any other error occurs. All you want
to do is remove the block that fell and not push a new starting 
location for it. 

*********************************************************************/

// variables and prep for the test array
var lvl_height = 8
var lvl_width = 5
var lvl_depth = 2
//						   |back|right|front|left|
var lvl_buffer = new Array(  0,   0,    0,    0  )
var level = new Array()
for (var i = 0; i < lvl_height; ++i) {
	level[i] = new Array()	
}

// this is the test level used. 
// To alter the test level you must alter this array. 
level[7] = [[0,0,0,0,0], [0,0,1,0,0]]	// top level
level[6] = [[0,0,0,0,0], [0,0,1,0,0]]
level[5] = [[0,0,0,0,0], [0,0,1,0,0]]
level[4] = [[0,0,0,0,0], [0,0,1,0,0]]
level[3] = [[0,0,0,0,0], [0,0,1,0,0]]
level[2] = [[0,0,0,0,0], [0,0,1,0,0]]
level[1] = [[0,0,0,1,1], [0,1,1,1,1]]
level[0] = [[1,1,1,1,1], [1,1,1,1,1]]	// bottom level


/*********************************************************************/
/*********************************************************************/
/********************			CODE			***********************/
// these are the 5 main function calls that controle everything
PrintLevel(level)
AddBuffer(1,1,1,level)
PrintLevel(level)
Remove(3, 2, 2, level)
PrintLevel(level)

/*********************************************************************/
/*********************************************************************/

// below this point is nothing but functions. 

function Remove(x, y, z, lvl) {
	if (!lvl[y][z][x]) {
		console.log("\t\t*************************");
		console.log("\t\t*** No block to remove***");
		console.log("\t\t*************************");
		return
	}
	
	// variables
	var falling = new Array
	
	// remove block at (x, y, z)
	lvl[y][z][x] = 0
	
	console.log("\t*** After removing block at ("+x+","+y+","+z+")***");
	PrintLevel(lvl)

	// an array that will store where the blocks moved to. 
	var fallen_blocks_new_locations = new Array

	// look at all blocks at level y + 1
	// looks at y values
	for (var h = y + 1; h < lvl.length; ++h) {
		// look at z values
		for (var i = 0; i < (lvl[0].length) ; i++) {
			// looks at x values
			for (var j = 0; j < (lvl[0][0].length); j++) {
				// is the current block falling?
				var temp = IsFalling(j,h,i,lvl)
				if (temp)
					fallen_blocks_new_locations.push(temp)
			}
		}
		
		// put in the new locations of the fallen blocks
		for (var itr = 0; 0 < fallen_blocks_new_locations.length; itr+=3) {
			//lvl[y][z][x]
			var x_new = fallen_blocks_new_locations[0][0]
			var y_new = fallen_blocks_new_locations[0][1]
			var z_new = fallen_blocks_new_locations[0][2]
			lvl[y_new][z_new][x_new] = 1
			fallen_blocks_new_locations.pop()
		}
	}
}

// this function checks to see if you are accessing an array element
// that is outside the scope of the array
function OutOfBounds(x, y, z, lvl){
	if (x < 0 || x > lvl_width){
		return true
	}
	else if (y < 0 || y > lvl_height) {
		return true
	}
	else if (z < 0 || z > lvl_depth){
		return true
	}
	else return false
}

// IsFalling determines if a particular block is falling. If a block
// is falling then the FallingHelper function will be called that will
// return the new location of the block. If a block is not falling
// the function returns false. 
function IsFalling(x, y, z, lvl){
	
	// if there is no block return immediately 
	if (lvl[y][z][x] == 0) {
		// no block that can fall
		return false
	}
	// if there is a block and that block already has a supporter,
	// then it was uneffected by the removal and does is not falling
	if (HasSupporter(x,y,z,lvl) != false) {
		return false
	}
	
	// if the above 2 are false, then the block at (x,y,z) is falling
	// remove the block that is falling
	lvl[y][z][x] = 0
	
	// The FallingHelper function will determine how far a falling 
	// block will fall and return its new location
	function FallingHelper(x, y, z) {
		var supporter =  HasSupporter(x, y, z, lvl)
		if (y > 0) {	
			if (supporter == false) {
				// still looking for supporter
				var answer = FallingHelper(x, y-1, z, lvl)
				return answer
			}
			else {		
				return [x,y,z]
			}
		}
		else{			
			// block has fallen off
			return false
		}
	}
	
	// call helper function
	var a = FallingHelper(x,y,z)
	return a
}

// HasSupporter determines if a block at location (x,y,z) is being 
// supported by another block. This function is used by IsFalling
// and its helper to determine the current state of a block. 
function HasSupporter(x, y, z, lvl){
	//nothing is supported at the bottom level. 
	if (y == 0) {
		return false
	}
	
	if (x>0)
		if (lvl[y-1][z][x-1]){
			return [x,y,z]
		}
	if (x<(lvl_width-1))
		if (lvl[y-1][z][x+1]){
			return [x,y,z]
		}
	if (z>0)
		if (lvl[y-1][z-1][x]){
			return [x,y,z]
		}
	if (z<lvl_depth-1)
		if (lvl[y-1][z+1][x]){
			return [x,y,z]
		}
	if (lvl[y-1][z][x]){
		return [x,y,z]
	}
	return false
}




/**********************************************************************

* Bellow are the Print functions that are needed to help display the  *
* current state of the level and for printing out level planes that   *
* are used for debugging.                                             *

**********************************************************************/

// print level from bottom up. 
// Note that in the array the bottom level is stored first, so we will 
// print the array from last elements to the first. 
function PrintLevel(lvl) {

	// create heater for level table
	var header_string 
	var header_string_depth_tabs = ""
	var spaces = ""
	for (var i = 0; i < lvl[0][0].length; i++) {
		spaces += " "	
	}
	for (var i = 0; i < lvl[0].length; i++) {
		header_string_depth_tabs = header_string_depth_tabs + spaces
	}
	// display header
	console.log("height\t|"+header_string_depth_tabs+"depth"+header_string_depth_tabs+"|");
	var depth_count = ""
	for (var j = 0; j < lvl_depth; ++j){
		for (var i = 0; i < (lvl_width*2 + 1); i++) {
			if (i == Math.floor(lvl_width))
				depth_count += j
			else
				depth_count += ' '
		}
		depth_count += ' '
	}
	var width_table = "--------"
	var loop_upper_limit = (lvl[0][0].length*2 + 1)*(lvl[0].length) + lvl[0].length - 1
	for (var i = 0; i < loop_upper_limit; i++) {
		width_table += '-'
	}
	width_table += "\nx-vals:\t"
	for (var j = 0; j < lvl_depth; ++j){
		for (var i = 0; i < lvl_width; i++) {
			width_table += '|'+i
		}
		width_table += '|'+' '
	}
	console.log("\t\t"+depth_count);

	// print level
	for (var y_val = 0; y_val < lvl.length; y_val++) {
		// set up all strings and variables. 
		lvl_string = lvl[lvl.length - y_val - 1].toString()
		lvl_z = lvl_string.slice(0, lvl_width*2-1)
		var lvl_string_array = new Array
		var y_lvl_string = ("lvl:"+(lvl.length - y_val - 1)+"\t")
		lvl_string_array.push(y_lvl_string)
		
		// add in 0's and 1's
		for (var z_val= 0; z_val< lvl[y_val].length; z_val++) {
			// slice apart the lvl_string_array by rows along the x-axis along the xz plane from front
			// to back. 
			lvl_string_array.push(lvl_string.slice(lvl_width*2*z_val, lvl_width*2*z_val + lvl_width*2), '')
		}
		// remove commas from string and print level string
		var print_string = lvl_string_array.toString()
		var re = /,/g
		print_string = print_string.replace(/,,/g, "| ")
		console.log(print_string.replace(re, "|"));
	}
	console.log(width_table);
	console.log("\n\n");
}
function PrintXZ(lvl, y){
	console.log("x-z plane: ");
	for (var i = lvl_depth - 1; i >= 0; --i) {
		console.log(lvl[y][i]);		
	}
}
function AddBuffer(x, y, z, lvl) {
	var buffer = 0

	if (x&&y || z&&y){
		if (z&&y) {
			lvl_buffer[0]++
			lvl_buffer[2]++
			for (var i = 0; i < lvl_height; i++) {

				// create buffer for the left and right sides. 
				for (var j = 0; j < lvl[0].length; j++) {
					lvl[i][j].splice(0,0,buffer)
					lvl[i][j].push(buffer)
				}
			}
			lvl_width = lvl[0][0].length
		}
		if (x&&y) {
			lvl_buffer[1]++
			lvl_buffer[3]++
			xy_buffer = new Array
			for (var i = 0; i < lvl_height; i++) {
				
				// create buffer for the front and back.
				for (var j = 0; j < lvl[0][0].length; j++) {
					xy_buffer[j] = buffer
				}
				lvl[i].push(xy_buffer)
				lvl[i].splice(0,0,xy_buffer)
			}
			
			lvl_depth = lvl[0].length
		}
	}
	else {
		throw new Error("Incorrect use of AddBuffer")
	}
}


/*********************************************************************
*					This is the end of the code                       *
 *********************************************************************/