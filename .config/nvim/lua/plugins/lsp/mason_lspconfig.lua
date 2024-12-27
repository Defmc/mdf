return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
	after = "williamboman/mason.nvim",
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup()

		require("mason-lspconfig").setup_handlers({
			-- The first entry (without a key) will be the default handler
			-- and will be called for each installed server that doesn't have
			-- a dedicated handler.
			function(server_name) -- default handler (optional)
				require("lspconfig")[server_name].setup({})
				require("vim").lsp.inlay_hint.enable(true)
			end,
			-- Next, you can provide a dedicated handler for specific servers.
			-- For example, a handler override for the `rust_analyzer`:
		})
	end,
}
