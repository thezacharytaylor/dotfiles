-- Code Companion Stuff
vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ac", "<cmd>CodeCompanion<CR>")
vim.keymap.set("n", "<leader>aa", "<cmd>CodeCompanionActions<CR>")
vim.keymap.set("n", "<leader>at", "<cmd>CodeCompanionChat Toggle<CR>")
vim.keymap.set("v", "<leader>ae", "<cmd>CodeCompanion /explain<CR>")
vim.keymap.set("v", "<leader>ad", "<cmd>CodeCompanion Can you write a docstring for this function?<CR>")
vim.keymap.set(
  "v",
  "<leader>ai",
  "<cmd>CodeCompanion Can you review this function for best practices and possible improvements?<CR>"
)
