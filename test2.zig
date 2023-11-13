const std = @import("std");
pub extern fn printf([*c]const u8, ...) c_int;
pub extern fn scanf(noalias [*c]const u8, ...) c_int;
// const print = std.debug.print;

pub fn main() !void {
    // Initialize "val" variables
    var val1: u8 = 0;
    var val2: u8 = 0;
    var val3: u8 = 0;
    var val4: u8 = 0;
    var val5: u8 = 0;
    var val6: u8 = 0;

    // Prompt for user input
    _ = printf("Please enter 6 values.\n");

    // Read the values from the user
    _ = scanf("%d %d %d %d %d %d", &val1, &val2, &val3, &val4, &val5, &val6);

    // Array of values from user
    var arr = [_]u8{ val1, val2, val3, val4, val5, val6 };
    _ = arr;

    // Sort the values using the selection sort algorithm
    _ = sortVal(&val1, &val2, &val3, &val4, &val5, &val6);
    // sortVal(arr[_]);

    // Print the sorted values
    _ = printf("The sorted values are: %d, %d, %d, %d, %d, %d\n", val1, val2, val3, val4, val5, val6);
}

pub fn sortVal(p1: *u8, p2: *u8, p3: *u8, p4: *u8, p5: *u8, p6: *u8) void {
    // fn sortVal(slice: [_]arr[1..end]) void {
    // Initialize an array of six integers, represented by the dereferenced pointers
    var arr = [_]u8{ p1.*, p2.*, p3.*, p4.*, p5.*, p6.* };

    // n is the size of the array
    const n: u8 = 6;

    // Initialize our minimum index variable & temp variable
    var min_idx: u8 = 0;
    var temp: u8 = 0;
    var i: u8 = 0;

    // While i < 2, increment i
    while (n - 1 > i) : (i += 1) {
        min_idx = i; // set min_idx to i initially
        var j: u8 = i + 1;

        // While j < 3, increment j. If the item at index j of the array is less than the item at index min_idx, change min_idx to j
        while (n > j) : (j += 1) {
            if (arr[j] < arr[min_idx]) {
                min_idx = j; // set min_idx to j. this is then compared to the item at arr[j] while this loops
            }
        }

        // Swap the values if min_idx is j, otherwise they stay the same
        temp = arr[min_idx];
        arr[min_idx] = arr[i];
        arr[i] = temp;
    }

    p1.* = arr[0];
    p2.* = arr[1];
    p3.* = arr[2];
    p4.* = arr[3];
    p5.* = arr[4];
    p6.* = arr[5];
}
