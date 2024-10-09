-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- themes
		{ "catppuccin/nvim", name = "catppuccin" },
		{
			"sainnhe/sonokai",
			lazy = false,
			config = function()
				vim.g.gonokai_style = "atlantis"
				vim.g.sonokai_enable_italic = false
			end,
		},
		{ "projekt0n/github-nvim-theme" },
		{ "rose-pine/neovim" },
		{ "folke/tokyonight.nvim" },
		{ "navarasu/onedark.nvim" },
		{ "askfiy/visual_studio_code" },
		{ "jacoborus/tender.vim" },
		{ "tanvirtin/monokai.nvim" },
		{ "marko-cerovac/material.nvim" },
		{ "ellisonleao/gruvbox.nvim" },
		{ "neanias/everforest-nvim" },
		{ "NLKNguyen/papercolor-theme" },
		{ "Shatur/neovim-ayu" },
		{ "ishan9299/nvim-solarized-lua" },

		-- lsp manager
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },

		-- base lsp
		{ "neovim/nvim-lspconfig" },

		-- completion and suggestions
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/nvim-cmp" },
		{
			"L3MON4D3/LuaSnip",
			dependencies = { "rafamadriz/friendly-snippets" },
		},
		{ "ray-x/lsp_signature.nvim" },
		{ "luckasRanarison/tailwind-tools.nvim" },
		{ "brenoprata10/nvim-highlight-colors" },

		-- formatter
		{ "stevearc/conform.nvim", opts = {} },

		-- tree-siter
		{ "nvim-treesitter/nvim-treesitter" },
		{ "nvim-treesitter/nvim-treesitter-context" },

		-- comment
		{ "numToStr/Comment.nvim", opts = {} },

		-- fuzzy finder
		{
			"nvim-telescope/telescope.nvim",
			tag = "0.1.8",
			dependencies = {
				"BurntSushi/ripgrep",
				"nvim-lua/plenary.nvim",
			},
		},

		-- diagnostcs finder
		{ "folke/trouble.nvim" },

		-- file manager
		-- { "stevearc/oil.nvim" },

		-- todo comments
		{ "folke/todo-comments.nvim" },

		-- icons
		{ "nvim-tree/nvim-web-devicons" },

		--scrolling
		{ "karb94/neoscroll.nvim" },

		--auto pairs
		{
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			config = true,
		},
		{ "windwp/nvim-ts-autotag" },

		-- file navigation harpoon
		{
			"ThePrimeagen/harpoon",
			branch = "harpoon2",
		},

		-- pair binds
		{ "tpope/vim-unimpaired" },

		-- collapse code
		{ "Wansmer/treesj" },

		-- better quick fix
		{ "kevinhwang91/nvim-bqf" },

		-- surround editing
		{ "kylechui/nvim-surround" },

		-- debugger
		-- { "mfussenegger/nvim-dap" },
		-- { "rcarriga/nvim-dap-ui" },

		-- persistence
		{
			"folke/persistence.nvim",
			event = "BufReadPre", -- this will only start session saving when an actual file was opened
			opts = {
				-- add any custom options here
			},
		},

		-- neotree
		{
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v3.x",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
				"MunifTanjim/nui.nvim",
				-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
			},
		},
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {},
		},
		-- Show match number and index for searching
		{
			"kevinhwang91/nvim-hlslens",
			branch = "main",
			keys = { "*", "#", "n", "N" },
			config = function()
			require("config.hlslens")
			end,
		},

		-- Show git change (change, delete, add) signs in vim sign column
		{
			"lewis6991/gitsigns.nvim",
			config = function()
			require("config.gitsigns")
			end,
		},
	},
	install = { colorscheme = { "habamax" } },
	checker = { enabled = false },
})

vim.g.catppuccin_flavour = "mocha"
require("catppuccin").setup()

vim.cmd([[colorscheme catppuccin]])

----------------------------------------------hlslens setup--------------------------------------------------
-- local api = vim.api
-- local keymap = vim.keymap

-- local hlslens = require("hlslens")

-- hlslens.setup {
--   calm_down = true,
--   nearest_only = true,
-- }

-- local activate_hlslens = function(direction)
--   local cmd = string.format("normal! %s%szzzv", vim.v.count1, direction)
--   local status, msg = pcall(vim.cmd, cmd)

--   -- Deal with the case that there is no such pattern in current buffer.
--   if not status then
--     local start_idx, _ = string.find(msg, 'E486', 1, true)
--     local msg_part = string.sub(msg, start_idx)
--     api.nvim_err_writeln(msg_part)
--     return
--   end

--   hlslens.start()
-- end

-- keymap.set("n", "n", "", {
--   callback = function()
--     activate_hlslens("n")
--   end,
-- })

-- keymap.set("n", "N", "", {
--   callback = function()
--     activate_hlslens("N")
--   end,
-- })

-- keymap.set("n", "*", "", {
--   callback = function()
--     vim.fn.execute("normal! *N")
--     hlslens.start()
--   end,
-- })
-- keymap.set("n", "#", "", {
--   callback = function()
--     vim.fn.execute("normal! #N")
--     hlslens.start()
--   end,
-- })

----------------------------------------------gitsigns setup--------------------------------------------------
-- local gs = require("gitsigns")

-- gs.setup {
--   signs = {
--     add = { hl = "GitSignsAdd", text = "+", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
--     change = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
--     delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
--     topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
--     changedelete = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
--   },
--   word_diff = false,
--   on_attach = function(bufnr)
--     local function map(mode, l, r, opts)
--       opts = opts or {}
--       opts.buffer = bufnr
--       vim.keymap.set(mode, l, r, opts)
--     end

--     -- Navigation
--     map("n", "]h", function()
--       if vim.wo.diff then
--         return "]h"
--       end
--       vim.schedule(function()
--         gs.next_hunk()
--       end)
--       return "<Ignore>"
--     end, { expr = true, desc = "next hunk" })

--     map("n", "[h", function()
--       if vim.wo.diff then
--         return "[h"
--       end
--       vim.schedule(function()
--         gs.prev_hunk()
--       end)
--       return "<Ignore>"
--     end, { expr = true, desc = "previous hunk" })

--     -- Actions
--     map('n', '<leader>hs', gs.stage_hunk, { desc = "stage this hunk" })
--     map('n', '<leader>hS', gs.stage_buffer, { desc = "stage entire buffer"})
--     map("n", "<leader>hp", gs.preview_hunk, { desc = "preview hunk" })
--     map("n", "<leader>hb", function()
--       gs.blame_line { full = true }
--     end, { desc = "blame line" })
--     map('n', '<leader>hr', gs.reset_hunk, { desc = "reset hunk" })
--     map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end,
--         { desc = "reset hunk" })
--     map('n', '<leader>htd', gs.toggle_deleted, { desc = "toggle deleted" })
--     map('n', '<leader>hd', gs.diffthis, { desc = "diff this" })

--   end,
-- }

-- vim.api.nvim_create_autocmd('ColorScheme', {
--   pattern = "*",
--   callback = function()
--     vim.cmd [[
--       hi GitSignsChangeInline gui=reverse
--       hi GitSignsAddInline gui=reverse
--       hi GitSignsDeleteInline gui=reverse
--     ]]
--   end
-- })

----------------------------------------------lsp setup--------------------------------------------------
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }
		vim.keymap.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
		vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
		vim.keymap.set("n", "gh", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		-- vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
		-- vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
		vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
		vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
		vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
	end,
})

-- make hover rounded window
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

vim.diagnostic.config({
	virtual_text = false,
	-- virtual_text = {
	-- 	prefix = "▲",
	-- 	severity = {
	-- 		min = vim.diagnostic.severity.ERROR,
	-- 	},
	-- },
	signs = {
		severity = {
			min = vim.diagnostic.severity.WARN,
		},
	},
	virtual_lines = false,
	-- underline = false,
	underline = {
		severity = {
			min = vim.diagnostic.severity.WARN,
		},
	},
	update_in_insert = false,
	float = { border = "rounded" },
})

vim.fn.sign_define("DiagnosticSignError", { text = "●", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "●", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignHint", { text = "●", texthl = "DiagnosticSignHint" })

require("tailwind-tools").setup({})

----------------------------------------------mason setup--------------------------------------------------
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {},
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
	},
})

----------------------------------------------suggestion setup--------------------------------------------------
local cmp = require("cmp")
local ls = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()
ls.filetype_extend("javascript", { "javascriptreact", "html", "css" }) -- Extending for CSS

require("nvim-highlight-colors").setup({})

cmp.setup({
	formatting = {
		format = require("nvim-highlight-colors").format,
	},
	snippet = {
		expand = function(args)
			ls.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = {
		["<C-n>"] = cmp.config.disable,
		["<C-p>"] = cmp.config.disable,
		["<C-e>"] = cmp.config.disable,
		["<Tab>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-j>"] = cmp.mapping.select_next_item(),
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	performance = {
		debounce = 60,
		throttle = 30,
		fetching_timeout = 200,
		max_view_entries = 4,
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
})

require("lsp_signature").setup({
	floating_window = true,
	floating_window_above_cur_line = true,
	max_height = 3,
	hint_enable = false,
})

-------------------------------------------tree-sitter setup--------------------------------------------
require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})

require("treesitter-context").setup({
	max_lines = 2,
})

vim.keymap.set("n", "[c", function()
	require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true })

-------------------------------------------conform setup--------------------------------------------------
local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		cpp = { "clang-format" },
		python = { "ruff_format" },
		javascript = { "prettierd", "prettier" },
		html = { "prettierd", "prettier" },
		["*"] = { "codespell" },
		["_"] = { "trim_whitespace" },
	},
	default_format_opts = {
		lsp_format = "fallback",
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})
vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

vim.api.nvim_set_keymap("n", "==", "gqq", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "=", "gq", { noremap = true, silent = true })

-------------------------------------------comment setup--------------------------------------------------
require("Comment").setup({
	toggler = {
		line = "<C-s>",
	},
	opleader = {
		line = "<C-s>",
	},
})

-------------------------------------------file manager setup--------------------------------------------
-- local oil = require("oil")
-- oil.setup({
-- 	view_options = {
-- 		show_hidden = true,
-- 	},
-- 	skip_confirm_for_simple_edits = true,
-- })
--
-- vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-------------------------------------------fuzzy finder setup--------------------------------------------
local telescope = require("telescope")
telescope.setup({
	defaults = {
		layout_config = {
			horizontal = {
				width = 0.90,
				height = 0.95,
				preview_cutoff = 0,
				preview_width = 0.55,
			},
		},
		file_ignore_patterns = {
			".git/",
			"%.o",
			"%.out",
			"%.dSYM/",
		},
	},
})

local builtin = require("telescope.builtin")
local utils = require("telescope.utils")
vim.keymap.set("n", "<leader>r", builtin.buffers)
vim.keymap.set("n", "<leader>f", builtin.find_files)
vim.keymap.set("n", "<leader>g", builtin.live_grep)

require("trouble").setup({
	win = {
		size = 5,
	},
	filter = {
		severity = {
			min = vim.diagnostic.severity.ERROR,
			max = vim.diagnostic.severity.ERROR,
		},
	},
})

vim.keymap.set("n", "<leader>we", "<cmd>Trouble diagnostics toggle<CR>")
vim.keymap.set("n", "<leader>wq", "copen 8")
-------------------------------------------todo setup--------------------------------------------
local todo = require("todo-comments").setup({
	signs = false,
})

vim.keymap.set("n", "]t", function()
	todo.jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
	todo.jump_prev()
end, { desc = "Previous todo comment" })

-------------------------------------------scrolling setup--------------------------------------------

neoscroll = require("neoscroll")

neoscroll.setup({
	easing = "linear",
	cursor_scrolls_alone = false,
	mappings = {},
})

local keymap = {
	["<C-u>"] = function()
		neoscroll.ctrl_u({ duration = 50 })
	end,
	["<A-Right>"] = function()
		neoscroll.ctrl_d({ duration = 50 })
	end,
	["<M-f>"] = function()
		neoscroll.ctrl_d({ duration = 50 })
	end,
	["<C-b>"] = function()
		neoscroll.ctrl_b({ duration = 600 })
	end,
	["<C-f>"] = function()
		neoscroll.ctrl_f({ duration = 600 })
	end,
}
local modes = { "n", "v", "x" }
for key, func in pairs(keymap) do
	vim.keymap.set(modes, key, func)
end

-------------------------------------------autopairs setup--------------------------------------------
local autopairs = require("nvim-autopairs")
autopairs.remove_rule("{")

-- better { rules
vim.keymap.set("i", "{", "{}<left>", { noremap = true, silent = true })
vim.keymap.set("i", "{<CR>", "{<CR>}<ESC>O", { noremap = true, silent = true })
vim.keymap.set("i", "{;<CR>", "{<CR>};<ESC>O", { noremap = true, silent = true })
vim.keymap.set("i", "{,<CR>", "{<CR>},<ESC>O", { noremap = true, silent = true })
vim.keymap.set("i", "{ ", "{}<Left><Space><Left><Space>", { noremap = true, silent = true })

require("nvim-ts-autotag").setup({
	opts = {
		-- Defaults
		enable_close = true, -- Auto close tags
		enable_rename = true, -- Auto rename pairs of tags
		enable_close_on_slash = false, -- Auto close on trailing </
	},
})

-------------------------------------------harpoon setup--------------------------------------------
local harpoon = require("harpoon")

harpoon.setup({})

vim.keymap.set("n", ";a", function()
	harpoon:list():add()
end)
vim.keymap.set("n", ";w", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", ";1", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", ";2", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", ";3", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", ";4", function()
	harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", ";q", function()
	harpoon:list():prev()
end)
vim.keymap.set("n", ";e", function()
	harpoon:list():next()
end)

-------------------------------------------collapse setup--------------------------------------------
local tsj = require("treesj")
tsj.setup({})
vim.keymap.set("n", "<C-j>", tsj.toggle)
vim.keymap.set("n", "<leader>j", function()
	tsj.toggle({ split = { recursive = true } })
end)
-------------------------------------------better quick fix setup--------------------------------------------
require("bqf").setup({})

-------------------------------------------surround setup--------------------------------------------
require("nvim-surround").setup({})

-------------------------------------------debugger setup--------------------------------------------
-- local dap = require("dap")
-- dap.adapters.gdb = {
-- 	type = "executable",
-- 	command = "gdb",
-- 	args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
-- }
--
-- vim.keymap.set("n", "<C-l>w", function()
-- 	dap.continue()
-- end)
-- vim.keymap.set("n", "<C-l>q", function()
-- 	dap.step_over()
-- end)
-- vim.keymap.set("n", "<C-l>i", function()
-- 	dap.step_into()
-- end)
-- vim.keymap.set("n", "<C-l>o", function()
-- 	dap.step_out()
-- end)
-- vim.keymap.set("n", "<C-l>k", function()
-- 	dap.toggle_breakpoint()
-- end)
-- vim.keymap.set("n", "<C-l>j", function()
-- 	dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
-- end)
-- vim.keymap.set("n", "<C-l>r", function()
-- 	dap.repl.open()
-- end)
-- vim.keymap.set("n", "<C-l>l", function()
-- 	dap.run_last()
-- end)
-- vim.keymap.set({ "n", "v" }, "<C-l>n", function()
-- 	require("dap.ui.widgets").hover()
-- end)
-- vim.keymap.set({ "n", "v" }, "<C-l>m", function()
-- 	require("dap.ui.widgets").preview()
-- end)
-- vim.keymap.set("n", "<Leader>df", function()
-- 	local widgets = require("dap.ui.widgets")
-- 	widgets.centered_float(widgets.frames)
-- end)
-- vim.keymap.set("n", "<Leader>ds", function()
-- 	local widgets = require("dap.ui.widgets")
-- 	widgets.centered_float(widgets.scopes)
-- end)

-------------------------------------------persistence setup--------------------------------------------
-- load the session for the current directory
vim.keymap.set("n", ";s", function()
	require("persistence").load()
end)

-------------------------------------------neotree setup--------------------------------------------
local neotree = require("neo-tree")
neotree.setup({
	filesystem = {
		hijack_netrw_behavior = "open_current",
		filtered_items = {
			visible = true,
		},
	},
})
vim.keymap.set("n", "-", ":Neotree toggle float reveal<CR>", { silent = true })
vim.keymap.set("n", "<leader>t", ":Neotree show toggle right reveal<CR>", { silent = true })

-------------------------------------------neotree setup--------------------------------------------
require("render-markdown").setup({})

-------------------------------------------theme setup--------------------------------------------
require("tokyonight").setup({
	style = "storm", -- "night" or "storm"
	on_highlights = function(hl, c)
		hl.DiagnosticUnderlineWarn.undercurl = nil
		hl.DiagnosticUnderlineWarn.underline = true
		hl.DiagnosticUnderlineError.undercurl = nil
		hl.DiagnosticUnderlineError.underline = true
		hl.DiagnosticUnderlineHint.undercurl = nil
		hl.DiagnosticUnderlineHint.underline = true
	end,
})
require("visual_studio_code").setup({
	mode = "light", -- light | dark
})

require("onedark").setup({
	highlights = {
		["@operator"] = { fg = "#89BEFA" },
	},
	diagnostics = {
		undercurl = false,
	},
})

require("everforest").setup({
	background = "hard",
})

--remove italics always
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		-- Remove italic from all highlight groups
		for _, group in ipairs(vim.fn.getcompletion("", "highlight")) do
			local highlight = vim.api.nvim_get_hl_by_name(group, true)
			if highlight and highlight.italic then
				highlight.italic = nil
				vim.api.nvim_set_hl(0, group, highlight)
			end
		end
	end,
})

--dont change cursor color on themes
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.cmd("highlight Cursor guifg=NONE guibg=NONE")
	end,
})
