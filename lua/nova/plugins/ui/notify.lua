return {
	{
		"rcarriga/nvim-notify",
		config = function()
			local notify = require("notify")

			notify.setup({
				-- Minimum level to show
				level = "info",

				-- Animation style fade | slide | fade_in_slide_out
				stages = "slide",

				-- Function called when a new window is opened, use for changing win settings/config
				on_open = nil,

				-- Function called when a window is closed
				on_close = nil,

				-- Render function for notifications. See notify-render()
				render = "default",

				-- Default timeout for notifications
				timeout = 5000,

				-- Max number of columns for messages
				max_width = nil,
				-- Max number of lines for a message
				max_height = nil,

				-- For stages that change opacity this is treated as the highlight behind the window
				-- Set this to either a highlight group, an RGB hex value e.g. "#000000" or a function returning an RGB code for dynamic values
				background_colour = "Normal",

				-- Minimum width for notification windows
				minimum_width = 50,

				-- Icons for the different levels
				icons = {
					ERROR = "",
					WARN = "",
					INFO = "",
					DEBUG = "",
					TRACE = "✎",
				},
			})

			vim.notify = notify
		end,
	},
}
