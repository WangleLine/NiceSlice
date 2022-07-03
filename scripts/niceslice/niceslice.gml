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
/// @pure
function draw_niceslice(sprite,subimg,x,y,width,height,border_width,border_height,internal_scale,color=c_white,alpha=1)
{
	var scale = internal_scale;
	var sprite_w = sprite_get_width(sprite);
	var sprite_h = sprite_get_height(sprite);
	var side_length_raw_w = sprite_w-(border_width*2);
	var side_length_raw_h = sprite_h-(border_height*2);
	var side_scale_factor_w = (1/side_length_raw_w)*(width-((border_width*scale)*2));
	var side_scale_factor_h = (1/side_length_raw_h)*(height-((border_height*scale)*2));
	
	// Top Left
	draw_sprite_part_ext(sprite,subimg,0,0,border_width,border_height,x,y,scale,scale,color,alpha);
	
	// Top Right
	draw_sprite_part_ext(sprite,subimg,sprite_w-border_width,0,border_width,border_height,x+width-(border_width*scale),y,scale,scale,color,alpha);
	
	// Bottom Left
	draw_sprite_part_ext(sprite,subimg,0,sprite_h-border_height,border_width,border_height,x,y+height-(border_height*scale),scale,scale,color,alpha);
	
	// Bottom Right
	draw_sprite_part_ext(sprite,subimg,sprite_w-border_width,sprite_h-border_height,border_width,border_height,x+width-(border_width*scale),y+height-(border_height*scale),scale,scale,color,alpha);
	
	// Left
	draw_sprite_part_ext(sprite,subimg,0,border_height,border_width,side_length_raw_h,x,y+(border_height*scale),scale,side_scale_factor_h,color,alpha);
	
	// Right
	draw_sprite_part_ext(sprite,subimg,sprite_w-border_width,border_height,border_width,side_length_raw_h,x+width-(border_width*scale),y+(border_height*scale),scale,side_scale_factor_h,color,alpha);
	
	// Top
	draw_sprite_part_ext(sprite,subimg,border_width,0,side_length_raw_w,border_height,x+(border_width*scale),y,side_scale_factor_w,scale,color,alpha);
	
	// Bottom
	draw_sprite_part_ext(sprite,subimg,border_width,sprite_h-border_height,side_length_raw_w,border_height,x+(border_width*scale),y+height-(border_height*scale),side_scale_factor_w,scale,color,alpha);
	
	// Inside
	draw_sprite_part_ext(sprite,subimg,border_width,border_height,side_length_raw_w,side_length_raw_h,x+(border_width*scale),y+(border_height*scale),side_scale_factor_w,side_scale_factor_h,color,alpha);
}