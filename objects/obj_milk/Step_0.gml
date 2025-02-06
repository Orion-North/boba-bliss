if (dragging) {
    x = mouse_x;
    y = mouse_y;

    if (mouse_check_button_released(mb_left)) {
        dragging = false;
        show_debug_message("Dragging stopped");
    }
}
