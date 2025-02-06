if (place_meeting(x, y, other)) {
    // Add the ingredient to the cup
    show_debug_message("Ingredient added: " + string(other.object_index));
    with (other) instance_destroy();
}

