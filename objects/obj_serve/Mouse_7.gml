// Find the cup (there should only be one)
var cup = instance_nearest(x, y, obj_cup);
var order = instance_nearest(x, y, obj_order);

// Debugging: Check if we actually found objects
if (cup == noone) {
    show_debug_message("🚨 Error: No cup found!");
    exit;
}
if (order == noone) {
    show_debug_message("🚨 Error: No order found!");
    exit;
}

// Make sure order_ingredients and cup.ingredients exist before using them
if (!variable_instance_exists(order, "order_ingredients")) {
    show_debug_message("🚨 Error: `order_ingredients` variable is missing!");
    exit;
}
if (!variable_instance_exists(cup, "ingredients")) {
    show_debug_message("🚨 Error: `ingredients` variable is missing!");
    exit;
}

// Now safely compare orders
if (compare_orders(order.order_ingredients, cup.ingredients)) {
    show_debug_message("✅ Correct Order! Served Successfully.");
} else {
    show_debug_message("❌ Wrong Order! Try Again.");
}

// Generate a new order after serving
with (order) {
    generate_new_order();
}

// Reset the cup
with (cup) {
    ingredients = [];
    image_index = 0; // Reset to empty cup sprite
}
