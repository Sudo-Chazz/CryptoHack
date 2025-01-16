const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // exe
    const exe = b.addExecutable(.{
        .name = "modmath",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    b.installArtifact(exe);

    // run step
    const run_exe = b.addRunArtifact(exe);
    const run_step = b.step("run", "Run the application");
    run_step.dependOn(&run_exe.step);

    // test step
    const exe_unit_tests = b.addTest(.{
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    const run_exe_unit_tests = b.addRunArtifact(exe_unit_tests);

    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_exe_unit_tests.step);

    // docs step
    const install_docs = b.addInstallDirectory(.{
        .source_dir = exe.getEmittedDocs(),
        .install_dir = .prefix,
        .install_subdir = "docs",
    });

    const docs_step = b.step("docs", "Install docs into docs/");
    docs_step.dependOn(&install_docs.step);
}
