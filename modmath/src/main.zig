const std = @import("std");
const mem = std.mem;
const testing = std.testing;

pub fn main() void {
    const res = gcd(66528, 52920);
    std.debug.print("{d}\n", .{res});
}

/// A function using [euclid's algorithm](https://en.wikipedia.org/wiki/Euclidean_algorithm)
/// only takes positive integers, order does not matter.
/// returns a usize integer representing gcd(a,b)
fn gcd(a: usize, b: usize) usize {
    var mut_a = a;
    var mut_b = b;
    if (a < b) {
        mut_a = b;
        mut_b = a;
    }

    while (mut_b != 0) {
        const temp = mut_b;
        mut_b = mut_a % mut_b;
        mut_a = temp;
    }

    return mut_a;
}

test "gcd simple" {
    const res = gcd(12, 8);
    try testing.expectEqual(4, res);
}

test "gcd simple reverse" {
    const res = gcd(8, 12);
    try testing.expectEqual(4, res);
}

test "gcd medium" {
    const res = gcd(66528, 52920);
    try testing.expectEqual(1512, res);
}
