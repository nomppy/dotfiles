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

-- Window 
nmap('q', '<Cmd>q<CR>')


-- Pane Navigation
nmap("<Left>", ":vertical resize +1<CR>")
nmap("<Right>", ":vertical resize -1<CR>")
nmap("<Up>", ":resize -1<CR>")
nmap("<Down>", ":resize +1<CR>")

-- Misc.
nmap(';', ':')
nmap('<ESC>', ':let @/ = ""<CR>')
imap('<C-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u')
