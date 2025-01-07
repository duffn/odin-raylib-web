package main_desktop

import "core:log"
import "core:os"
import "core:path/filepath"
import rl "vendor:raylib"
import game ".."

main :: proc() {
	// Set working dir to dir of executable.
	exe_path := os.args[0]
	exe_dir := filepath.dir(string(exe_path), context.temp_allocator)
	os.set_current_directory(exe_dir)

	context.logger = log.create_console_logger()
	
	game.init()

	for !rl.WindowShouldClose() {
		game.update()
	}

	game.shutdown()
}