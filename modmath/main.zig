const std = @import("std");
const testing = std.testing;

pub fn main() void {
    const res = euclid_algo(12, 8);
    std.debug.print("{d}\n", .{res});
}

fn euclid_algo(a: usize, b: usize) usize {}

test "euclid_algo simple" {
    const res = euclid_algo(12, 8);
    testing.expectEqual(4, res);
}
