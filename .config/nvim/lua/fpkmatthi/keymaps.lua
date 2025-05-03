local opts = { noremap = true, silent = true }
local termopts = { silent = true }

-- shorten func name
local keymap = vim.api.nvim_set_keymap

-- remap space as leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--    normal = "n"
--    insert = "i"
--    visual = "v"
--    visual_block = "x"
--    term = "t"
--    command = "c"

-- Normal --
-- Better window nav
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- keymap("n", "<leader>e", ":Lex 30<cr>", opts)


-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<Cr>", opts)
keymap("n", "<C-Down>", ":resize +2<Cr>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<Cr>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<Cr>", opts)

-- Nav buffers
keymap("n", "<S-l>", ":bnext<Cr>", opts)
keymap("n", "<S-h>", ":bprevious<Cr>", opts)

-- Insert --
-- Press jk fast to esc
-- keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP"', opts)


-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move >+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move <-2<CR>gv-gv", opts)

-- Terminal --
-- Better term nav
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", termopts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", termopts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", termopts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", termopts)

-- Plugins --
-- Easy-motion
vim.g.EasyMotion_startofline = 0      -- keep cursor column when doing f/F motions
vim.g.EasyMotion_smartcase   = 1      -- smart-case searching
-- keymap('n', 's',                 '<Plug>(easymotion-overwin-f)',   opts)
keymap('n', '<leader><leader>l', '<Plug>(easymotion-lineforward)', opts)
keymap('n', '<leader><leader>j', '<Plug>(easymotion-j)',           opts)
keymap('n', '<leader><leader>k', '<Plug>(easymotion-k)',           opts)
keymap('n', '<leader><leader>h', '<Plug>(easymotion-linebackward)',opts)
keymap('n', '/',                 '<Plug>(easymotion-sn)',          opts)
keymap('n', 'n',                 '<Plug>(easymotion-next)',        opts)
keymap('n', 'N',                 '<Plug>(easymotion-prev)',        opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>f", ":Telescope<CR>", opts)
