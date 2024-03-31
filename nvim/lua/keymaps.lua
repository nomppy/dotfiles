local opts = {
	noremap = true,
	silent = true,
}

function map(mode, shortcut, command)
  vim.keymap.set(mode, shortcut, command, opts)
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

function vmap(shortcut, command)
  map('v', shortcut, command)
end

-- nnoremap <leader> :WhichKey ','<CR>
-- set timeoutlen=500

-----------------
-- Normal mode --
-----------------

-- Re-map normal movement
-- nmap j gj
-- nmap k gk
-- vmap j gj
-- vmap k gk

nmap('H', '^')
nmap('L', '$')
vmap('H', '^')
vmap('L', '$')

-- Move selected
map('x', 'K', ":move '<-2<CR>gv-gv")
map('x', 'J', ":move '>+1<CR>gv-gv")

-- Better indent
vmap('<', '<gv')
vmap('>', '>gv')

-- Window Navigation
nmap('q', '<Cmd>q<CR>')

-- Buffer Navigation
nmap('Q', ':bd!<CR>')
nmap('<Leader>b', '<Cmd>ls<CR>:b')
nmap('<C-b>j', ':bn!<CR>')
nmap('<C-b>k', ':bp!<CR>')

-- Tab Navigation
vim.cmd [[
nnoremap <C-t>l <Cmd>tabn<CR>
nnoremap <C-t>n :tabs:tab<Space>
nnoremap <C-t>t <Cmd>tabnew<CR>
nnoremap <C-t>h <Cmd>tabp<CR>
nnoremap <C-t>k <Cmd>tabc<CR>
]]

-- Pane Navigation
nmap("<Left>", ":vertical resize +1<CR>")
nmap("<Right>", ":vertical resize -1<CR>")
nmap("<Up>", ":resize -1<CR>")
nmap("<Down>", ":resize +1<CR>")

-- NERDTree Mappings
vim.cmd [[
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>
nnoremap <Leader>nc :NERDTreeCWD<CR>
]]

-- Git gutter mappings
-- nmap ]h <Plug>(GitGutterNextHunk)
-- nmap [h <Plug>(GitGutterPrevHunk)

-- Misc.
nmap(';', ':')
nmap('<Leader>s', '<Cmd>write<CR>')
nmap('<Leader>r', '<Cmd>redraw!<CR>')
nmap('<ESC>', ':let @/ = ""<CR>')
imap('<C-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u')
