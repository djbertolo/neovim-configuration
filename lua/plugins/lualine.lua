return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local custom_theme = require("lualine.themes.onedark")

		local colors = {
			pink = "#ff79c6", -- Normal
			blue = "#8be9fd", -- Insert
			purple = "#bd93f9", -- Visual
			brown = "#a67c52", -- Command
			black = "#282c34", -- Text inside mode boxes
			gray = "#abb2bf", -- Static text color for everything else
		}

		-- Helper to set mode colors while keeping middle text gray
		local function set_mode_colors(mode, mode_color)
			-- The Mode Box (Left)
			custom_theme[mode].a.bg = mode_color
			custom_theme[mode].a.fg = colors.black

			-- The Location Box (Right)
			if custom_theme[mode].z then
				custom_theme[mode].z.bg = mode_color
				custom_theme[mode].z.fg = colors.black
			end

			-- Static Gray for middle sections (b and c cover x and y as well)
			if not custom_theme[mode].b then
				custom_theme[mode].b = { fg = colors.gray }
			else
				custom_theme[mode].b.fg = colors.gray
			end

			-- Set line number color for the initial load
			vim.api.nvim_set_hl(0, "CursorLineNr", {
				fg = mode_color,
				bold = true,
			})
		end

		set_mode_colors("normal", colors.pink)
		set_mode_colors("insert", colors.blue)
		set_mode_colors("visual", colors.purple)
		set_mode_colors("command", colors.brown)

		require("lualine").setup({
			options = {
				theme = custom_theme,
				section_separators = { left = " ", right = " " },
				component_separators = { left = " ", right = " " },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
					"diff",
					{
						"diagnostics",
						always_visible = false,
						symbols = { error = " ", warn = " ", info = " ", hint = "󰌵 " },
					},
				},
				lualine_c = {
					-- Section 1: The Root -> ... -> Folder Path
					{
						function()
							local root = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
							local path = vim.fn.expand("%:h")

							if path == "." then
								return " " .. root
							end

							local parts = {}
							for part in string.gmatch(path, "([^/]+)") do
								table.insert(parts, part)
							end

							if #parts > 2 then
								return " " .. root .. "/…/…/" .. parts[#parts]
							elseif #parts == 2 then
								return " " .. root .. "/" .. parts[1] .. "/" .. parts[2]
							else
								return " " .. root .. "/" .. path
							end
						end,
						padding = { left = 1, right = 1 },
						separator = "",
					},
					-- The Bullet Point (The LaTeX \cdot style)
					{
						function()
							return "⋅"
						end,
						color = { fg = colors.gray }, -- Matches your static gray text
						padding = { left = 0, right = 0 },
						separator = "",
					},
					-- Section 2: The Filename
					{
						"filename",
						file_status = true,
						path = 0,
						symbols = { modified = " ●", readonly = " 󰌾", unnamed = "[No Name]" },
						color = { fg = colors.gray },
						padding = { left = 1, right = 1 },
					},
				},
				lualine_x = { "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
		-- Dynamic Line Number Color Switcher
		vim.api.nvim_create_autocmd("ModeChanged", {
			callback = function()
				local mode = vim.fn.mode()
				local mode_color = colors.pink -- Default (Normal)

				if mode == "i" then
					mode_color = colors.blue
				elseif mode:match("[vV\22]") then -- Visual, Visual Line, Visual Block
					mode_color = colors.purple
				elseif mode == "c" then
					mode_color = colors.brown
				end

				vim.api.nvim_set_hl(0, "CursorLineNr", { fg = mode_color, bold = true })
			end,
		})
	end,
}
