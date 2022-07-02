// Draw Sprite Nine Sliced
function draw_niceslice(sprite,subimg,x,y,width,height,border,internal_scale,color=c_white,alpha=1)
{
	var scale = internal_scale;
	var sprite_w = sprite_get_width(sprite);
	var sprite_h = sprite_get_height(sprite);
	var side_length_raw_w = sprite_h-(border*2);
	var side_length_raw_h = sprite_w-(border*2);
	var side_scale_factor_w = (1/side_length_raw_w)*(width-((border*scale)*2));
	var side_scale_factor_h = (1/side_length_raw_h)*(height-((border*scale)*2));
	
	// Top Left
	draw_sprite_part_ext(sprite,subimg,0,0,border,border,x,y,scale,scale,color,alpha);
	
	// Top Right
	draw_sprite_part_ext(sprite,subimg,sprite_w-border,0,border,border,x+width-(border*scale),y,scale,scale,color,alpha);
	
	// Bottom Left
	draw_sprite_part_ext(sprite,subimg,0,sprite_h-border,border,border,x,y+height-(border*scale),scale,scale,color,alpha);
	
	// Bottom Right
	draw_sprite_part_ext(sprite,subimg,sprite_w-border,sprite_h-border,border,border,x+width-(border*scale),y+height-(border*scale),scale,scale,color,alpha);
	
	// Left
	draw_sprite_part_ext(sprite,subimg,0,border,border,side_length_raw_h,x,y+(border*scale),scale,side_scale_factor_h,color,alpha);
	
	// Right
	draw_sprite_part_ext(sprite,subimg,sprite_w-border,border,border,side_length_raw_h,x+width-(border*scale),y+(border*scale),scale,side_scale_factor_h,color,alpha);
	
	// Top
	draw_sprite_part_ext(sprite,subimg,border,0,side_length_raw_w,border,x+(border*scale),y,side_scale_factor_w,scale,color,alpha);
	
	// Bottom
	draw_sprite_part_ext(sprite,subimg,border,sprite_h-border,side_length_raw_w,border,x+(border*scale),y+height-(border*scale),side_scale_factor_w,scale,color,alpha);
	
	// Inside
	draw_sprite_part_ext(sprite,subimg,border,border,side_length_raw_w,side_length_raw_h,x+(border*scale),y+(border*scale),side_scale_factor_w,side_scale_factor_h,color,alpha);
}