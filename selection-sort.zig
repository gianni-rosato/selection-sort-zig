const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    // Get allocator
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    defer _ = gpa.deinit();

    // Parse args into string array (error union needs 'try')
    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    // Declare constant arraySize
    const arraySize: usize = (args.len - 1);

    // Allocate memory to a slice "sli"
    var sli = try allocator.alloc(usize, arraySize);
    defer allocator.free(sli);

    // For arguments 1 through last, & nums 0 through arraySize
    for (args[1..args.len], 0..arraySize) |arg, i| {
        sli[i] = try std.fmt.parseInt(usize, arg, 10); // Parse CLI args as ints & pass to every index in sli
    }

    // Sort the values using the selection sort algorithm
    sortVal(arraySize, sli);

    // Print the sorted values
    print("The sorted values are:", .{});
    for (0..(args.len - 1)) |i| {
        print(" {d}", .{sli[i]});
    }
    // Newline at the end
    print("\n", .{});
}

// Sorts an array of an arbitrary quantity of integers in ascending order
pub fn sortVal(len: usize, sli_sort: []usize) void { // parameters len (arraySize) and sli_sort (sli)
    var min_idx: usize = 0;
    var temp: usize = 0;

    // For every element in arr_sort
    for (0..(len - 1)) |i| {
        min_idx = i;
        var j: usize = i + 1;

        // Find the index of the minimum element in the unsorted portion of the array
        while (sli_sort.len > j) : (j += 1) {
            if (sli_sort[j] < sli_sort[min_idx]) {
                min_idx = j;
            }
        }

        // Swap the minimum element with the first element in the unsorted portion of the array
        temp = sli_sort[min_idx];
        sli_sort[min_idx] = sli_sort[i];
        sli_sort[i] = temp;
    }
}
