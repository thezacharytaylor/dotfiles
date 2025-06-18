-- Colemak Keymap Swap
-- ===================
-- Undo Operations
-- vim.keymap.set("n", "l", "u")

-- Insert Key
-- vim.keymap.set("n", "k", "i")
-- vim.keymap.set("n", "K", "I")

-- Cursor movement
-- ===============
--
--
--
-- vim.keymap.set("n", "u", "k", { silent = true })
-- vim.keymap.set("n", "i", "l", { silent = true })
-- vim.keymap.set("n", "e", "j", { silent = true })
-- vim.keymap.set("n", "n", "h", { silent = true })

-- Other
-- =====
-- Easy insertion of a trailing ; or , from insert mode.
vim.keymap.set("n", ";;", "<Esc>A;<Esc>")
vim.keymap.set("i", ",,", "<Esc>A,<Esc>")
