return {
	formatters = {
		lua = { require("formatter.filetypes.lua").stylua },
		rust = {
			function()
				return { exe = "rustfmt", stdin = true, args = { "--edition", 2021 } }
			end,
		},
		cpp = { require("formatter.filetypes.cpp").clangformat },
		c = { require("formatter.filetypes.c").clangforma },
		javascript = { require("formatter.filetypes.javascript").prettier },
		sh = {
			function()
				return { exe = "shfmt", stdin = true, args = { "-i", 2 } }
			end,
		},
	},
}
