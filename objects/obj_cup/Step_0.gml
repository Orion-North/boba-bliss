// Function to add an ingredient to the cup:
function add_ingredient(ing_type) {
    // Add the ingredient type to the array.
    ingredients[array_length(ingredients)] = ing_type;
    show_debug_message("Ingredient added: " + ing_type);
    
    // Update the cup's sprite based on the new combination.
    update_cup_sprite();
}

// Function to update the cup sprite
function update_cup_sprite() {
    var hasBoba = false;
    var hasMilk = false;
    var hasTea  = false;

    // Check what's inside
    for (var i = 0; i < array_length(ingredients); i++) {
        var ing = ingredients[i];
        if (ing == "boba") hasBoba = true;
        if (ing == "milk") hasMilk = true;
        if (ing == "tea")  hasTea  = true;
    }

    // Set the correct sprite frame
    if (!hasBoba && !hasMilk && !hasTea) {
        image_index = 0;  // Empty cup
    } else if (hasBoba && !hasMilk && !hasTea) {
        image_index = 1;  // Cup with boba
    } else if (hasMilk && !hasBoba && !hasTea) {
        image_index = 2;  // Cup with milk
    } else if (hasTea && !hasBoba && !hasMilk) {
        image_index = 3;  // Cup with tea
    } else if (hasMilk && hasTea && !hasBoba) {
        image_index = 4;  // Cup with milk and tea
    } else if (hasMilk && hasBoba && !hasTea) {
        image_index = 5;  // Cup with milk and boba
    } else if (hasTea && hasBoba && !hasMilk) {
        image_index = 6;  // Cup with tea and boba
    } else if (hasMilk && hasTea && hasBoba) {
        image_index = 7;  // Cup with milk, tea, and boba
    }
}