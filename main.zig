const std = @import("std");
const print = std.debug.print;
const sdl = @cImport({
    @cInclude("SDL3/SDL.h");
});

pub fn main() !void {
    _ = sdl.SDL_Init(sdl.SDL_INIT_VIDEO);
    defer sdl.SDL_Quit();

    const window = sdl.SDL_CreateWindow("trtl", 400, 400, sdl.SDL_WINDOW_RESIZABLE);
    defer sdl.SDL_DestroyWindow(window);

    // if (window == null) {
    //     std.debug.print("Window could not be created: {s}\n", .{sdl.SDL_GetError()});
    //     sdl.SDL_Quit();
    //     return;
    // }

    const renderer = sdl.SDL_CreateRenderer(window, null);
    defer sdl.SDL_DestroyRenderer(renderer);

    //var quit = false;
    while (true) {
        _ = sdl.SDL_SetRenderDrawColor(renderer, 255, 125, 200, 255);
        _ = sdl.SDL_RenderClear(renderer);

        _ = sdl.SDL_SetRenderDrawColor(renderer, 0, 125, 100, 255);
        var rect = sdl.SDL_FRect{ .x = 200, .y = 150, .w = 400, .h = 300 };
        _ = sdl.SDL_RenderRect(renderer, rect);

        var event: sdl.SDL_Event = undefined;
        var running = true;
        while (running) {
            while (sdl.SDL_PollEvent(&event) != false) {
                if (event.type == sdl.SDL_EVENT_QUIT)
                    running = false;
            }
        }
    }
}
