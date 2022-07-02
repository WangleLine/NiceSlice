// NiceSlice Examples
draw_niceslice(s_example,0,100,100,140,100,6,internal_scale);
draw_niceslice(s_example,0,260,100,300,300,6,internal_scale);
draw_niceslice(s_example,0,100,220,80,300,6,internal_scale);

// Text
draw_set_halign(fa_right);
draw_text(room_width-20,20,"Press [Arrow Up] to increase internal scale");
draw_text(room_width-20,40,"Press [Arrow Down] to decrease internal scale");
draw_text(room_width-20,60,"Current internal scale: "+string(internal_scale));