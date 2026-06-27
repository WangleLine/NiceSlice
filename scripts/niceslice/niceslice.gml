// Draw Sprite Nine Sliced
/// @arg {Asset.GMSprite} sprite
/// @arg {Real} subimg
/// @arg {Real} x
/// @arg {Real} y
/// @arg {Real} width
/// @arg {Real} height
/// @arg {Real} border_width
/// @arg {Real} border_height
/// @arg {Real} internal_scale
/// @arg {Asset.GMColor} color
/// @arg {Real} alpha
function draw_niceslice(sprite,subimg,x,y,width,height,border_width,border_height,internal_scale,color=c_white,alpha=1)
{
	var scale    = internal_scale;
	var sprite_w = sprite_get_width(sprite);
	var sprite_h = sprite_get_height(sprite);

	var mid_w = sprite_w - border_width  * 2;	// stretchable middle (source px)
	var mid_h = sprite_h - border_height * 2;

	// On-screen border size, clamped so opposing borders never overlap
	var bw = min(border_width  * scale, width  * 0.5);
	var bh = min(border_height * scale, height * 0.5);

	// Per-axis corner scale (= scale unless clamped); guard zero-width borders
	var csx = (border_width  > 0) ? bw / border_width  : scale;
	var csy = (border_height > 0) ? bh / border_height : scale;

	// Stretch factors for the middle; guard fully-bordered sprites (mid == 0)
	var fx = (mid_w > 0) ? (width  - bw * 2) / mid_w : 0;
	var fy = (mid_h > 0) ? (height - bh * 2) / mid_h : 0;

	var sx_r = sprite_w - border_width;		// source x of right column
	var sy_b = sprite_h - border_height;	// source y of bottom row
	var x_r  = x + width  - bw;				// screen x of right column
	var y_b  = y + height - bh;				// screen y of bottom row
	var x_m  = x + bw;						// screen x of middle column
	var y_m  = y + bh;						// screen y of middle row

	// Corners
	draw_sprite_part_ext(sprite,subimg, 0,    0,    border_width, border_height, x,   y,   csx, csy, color, alpha);	// Top Left
	draw_sprite_part_ext(sprite,subimg, sx_r, 0,    border_width, border_height, x_r, y,   csx, csy, color, alpha);	// Top Right
	draw_sprite_part_ext(sprite,subimg, 0,    sy_b, border_width, border_height, x,   y_b, csx, csy, color, alpha);	// Bottom Left
	draw_sprite_part_ext(sprite,subimg, sx_r, sy_b, border_width, border_height, x_r, y_b, csx, csy, color, alpha);	// Bottom Right

	// Edges
	draw_sprite_part_ext(sprite,subimg, 0,            border_height, border_width, mid_h,         x,   y_m, csx, fy,  color, alpha);	// Left
	draw_sprite_part_ext(sprite,subimg, sx_r,         border_height, border_width, mid_h,         x_r, y_m, csx, fy,  color, alpha);	// Right
	draw_sprite_part_ext(sprite,subimg, border_width, 0,             mid_w,        border_height, x_m, y,   fx,  csy, color, alpha);	// Top
	draw_sprite_part_ext(sprite,subimg, border_width, sy_b,          mid_w,        border_height, x_m, y_b, fx,  csy, color, alpha);	// Bottom

	// Inside
	draw_sprite_part_ext(sprite,subimg, border_width, border_height, mid_w,        mid_h,         x_m, y_m, fx,  fy,  color, alpha);
}
