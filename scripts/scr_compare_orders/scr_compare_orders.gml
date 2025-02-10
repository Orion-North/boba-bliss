function compare_orders(order_list, cup_list) {
    // Sort both arrays alphabetically (order doesn't matter)
    array_sort(order_list, function (a, b) {
        return a > b;
    });
    array_sort(cup_list, function (a, b) {
        return a > b;
    });

    // Compare the two arrays
    return array_equals(order_list, cup_list);
}
