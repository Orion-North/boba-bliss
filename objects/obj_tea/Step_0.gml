if (dragging) {
    // Follow the mouse
    x = mouse_x;
    y = mouse_y;

    // If mouse is released
    if (mouse_check_button_released(mb_left)) {
        dragging = false;

        // Check if released over a cup
        var cup = instance_place(x, y, obj_cup);
        if (cup != noone) {
            // Pass the ingredient type to the cup
            with (cup) {
                add_ingredient(other.ingredient_type);
                update_cup_sprite(); // Refresh sprite frame
            }

            // Instead of hiding, return to original position
            x = spawn_x;
            y = spawn_y;
        } else {
            // If not placed in cup, reset to original position anyway
            x = spawn_x;
            y = spawn_y;
        }
    }
}
