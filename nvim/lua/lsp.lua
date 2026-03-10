-- Diagnostic signs
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "✗",
			[vim.diagnostic.severity.WARN] = "⚠",
			[vim.diagnostic.severity.INFO] = "ℹ",
			[vim.diagnostic.severity.HINT] = "●",
		},
	},
	virtual_text = true,
	update_in_insert = false,
	severity_sort = true,
})

-- lua_ls
-- Shamelessly copied from https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lua_ls
vim.lsp.config("lua_ls", {
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if
				path ~= vim.fn.stdpath("config")
				and (vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc"))
			then
				return
			end
		end
		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				version = "LuaJIT",
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
				},
			},
		})
	end,
	settings = {
		Lua = {},
	},
})

-- ruff
vim.lsp.config("ruff", {})

-- Disable ruff's hover so pyright handles it exclusively
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client == nil then
			return
		end
		if client.name == "ruff" then
			client.server_capabilities.hoverProvider = false
		end
	end,
	desc = "LSP: Disable hover capability from Ruff",
})

-- bashls
vim.lsp.config("bashls", {
	filetypes = { "sh", "bash" },
})

-- cssls
vim.lsp.config("cssls", {})

-- gopls
vim.lsp.config("gopls", {
	settings = {
		gopls = {
			analyses = { unusedparams = true },
			staticcheck = true,
			gofumpt = false, -- we let conform + gofmt handle formatting
		},
	},
})

-- html
vim.lsp.config("html", {})

-- marksman (Markdown)
vim.lsp.config("marksman", {})

-- texlab (LaTeX)
vim.lsp.config("texlab", {
	settings = {
		texlab = {
			build = {
				onSave = false, -- vimtex handles compilation
			},
			chktex = {
				onOpenAndSave = true,
			},
		},
	},
})

-- ts_ls (TypeScript / JavaScript)
vim.lsp.config("ts_ls", {})

-- Enable all servers
vim.lsp.enable({
	"bashls",
	"clangd",
	"cssls",
	"gopls",
	"html",
	"lua_ls",
	"marksman",
	"pyright",
	"ruff",
	"rust_analyzer",
	"taplo",
	"texlab",
	"ts_ls",
	"typos_lsp",
})
