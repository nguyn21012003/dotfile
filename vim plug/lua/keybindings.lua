-- Leader và localleader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Formatter cho Python
vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		map("n", "<C-s>", ":w<CR>:!black --line-length 250 %<CR>:e<CR>", opts)
	end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.py",
	command = "silent! !black --line-length 250 %",
})

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", opts)
map("n", "<leader>e", "<cmd>lua require('telescope').extensions.file_browser.file_browser()<CR>", opts)

-- SearchBox
map("n", "<C-f>", "<cmd>SearchBoxIncSearch<CR>", opts)
map("n", "<C-r>", "<cmd>SearchBoxReplace<CR>", opts)

-- Format
map("n", "<leader>fm", function()
	vim.lsp.buf.format()
end, opts)

-- Hover
map("n", "K", function()
	vim.lsp.buf.hover()
end, opts)

-- Alpha
map("n", "<A-q>", "<cmd>Alpha<CR>", opts)

-- Tabs & Buffers
map("n", "<leader>tn", "<cmd>tabnew<CR>", opts)
map("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", opts)
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", opts)

for i = 1, 9 do
	map("n", "<A-" .. i .. ">", "<cmd>BufferLineGoToBuffer " .. i .. "<CR>", opts)
end

-- Close buffer
map("n", "W", "<cmd>bd<CR>", opts)

-- Floaterm
map("n", "<localleader>lt", "<cmd>FloatermNew<CR>", opts)

-- Markdown preview
map("n", "<leader>mm", "<cmd>MarkdownPreview<CR>", opts)

-- Word wrap toggle
map("n", "<A-z>", "<cmd>set wrap!<CR>", opts)

-- Redo
map("n", "U", "<cmd>redo<CR>", opts)

-- Neoformat
map("n", "<leader>vf", "<cmd>Neoformat<CR>", opts)

-- Di chuyển dòng trong visual mode
map("v", "K", ":m '<-2<CR>gv=gv", opts)
map("v", "J", ":m '>+1<CR>gv=gv", opts)

-- Tự động bật wrap cho markdown, tex, python
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "tex", "python" },
	command = "setlocal wrap linebreak",
})

map("n", "<leader>gg", "<cmd>LazyGit<CR>", opts)
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>")

