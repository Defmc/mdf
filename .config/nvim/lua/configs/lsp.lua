return {
	formatters = {
		lua = { require("formatter.filetypes.lua").stylua },
		rust = { require("formatter.filetypes.rust").rustfmt },
		cpp = { require("formatter.filetypes.cpp").clangformat },
		c = { require("formatter.filetypes.c").clangforma },
		javascript = { require("formatter.filetypes.javascript").prettier },
	},
}
