const std = @import("std");

pub fn build(b: *std.Build) void {
    const exe = b.addExecutable(.{
        .name = "trtl",
        .root_source_file = b.path("main.zig"),
        .target = b.graph.host,
        .link_libc = true,
    });
    exe.linkSystemLibrary("SDL3");

    b.installArtifact(exe);
}
