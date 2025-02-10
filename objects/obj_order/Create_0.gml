// Define possible drink combinations
possible_orders = [
    ["milk", "boba"],
    ["tea", "boba"],
    ["milk", "tea"],
    ["milk", "tea", "boba"]
];

// Function to respawn all used ingredients
respawn_ingredients = function() {
    // List of all ingredient object types
    var ingredient_types = [obj_milk, obj_tea, obj_boba];
    
    for (var i = 0; i < array_length(ingredient_types); i++) {
        var ingredient_type = ingredient_types[i];

        // Check if any instances of this ingredient type exist
        if (instance_number(ingredient_type) == 0) {
            show_debug_message("🚨 No instances of " + string(ingredient_type) + " exist. Skipping respawn.");
            continue;
        }
        
        // Get all instances of this ingredient type
        var ingrCount = instance_number(ingredient_type);
        var ingrArray = instance_find(ingredient_type, ingrCount);
        
        for (var j = 0; j < array_length(ingrArray); j++) {
            with (ingrArray[j]) {
                // Debug: Log current and spawn positions before respawn
                show_debug_message("Before respawn of " + string(object_index) + ": current (" + string(x) + ", " + string(y) + "), spawn (" + string(spawn_x) + ", " + string(spawn_y) + ")");
                
                // Restore original spawn position
                x = spawn_x;
                y = spawn_y;
                visible = true;
                image_alpha = 1; // Ensure full opacity
                depth = -100;    // Bring the object to the front
                
                // Debug: Log new position after respawn
                show_debug_message("After respawn of " + string(object_index) + ": (" + string(x) + ", " + string(y) + ")");
            }
        }
        
        show_debug_message("✅ Respawned all instances of " + string(ingredient_type) + " successfully!");
    }
};

// Function to generate a new order
generate_new_order = function() {
    // Pick a random order from possible_orders
    order_ingredients = possible_orders[irandom(array_length(possible_orders) - 1)];
    show_debug_message("🔄 New Order: " + string(order_ingredients));
    
    // Respawn used ingredients so they can be used again
    respawn_ingredients();
};

// Delay the first order generation to ensure that all ingredient objects are created.
// (This sets alarm[0] to trigger after 5 steps.)
alarm[0] = 5;
