local keymap = vim.keymap

-- File Save
keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save File" })
keymap.set("i", "<C-s>", "<Esc>:w<CR>a", { desc = "Save File (Insert Mode)" })

-- Notification History
keymap.set("n", "<leader>sn", function()
  require("snacks").notifier.show_history()
end, { desc = "Notification History" })

-- File Search
keymap.set("n", "<C-p>", "<leader><leader>", { remap = true, desc = "File Search" })

keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { desc = "Go to Definition" })
keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, { desc = "Go to Declaration" })
keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, { desc = "Go to Implementation" })
keymap.set("n", "gr", function() vim.lsp.buf.references() end, { desc = "Go to References" })
keymap.set("n", "gy", function() vim.lsp.buf.type_definition() end, { desc = "Go to Type Definition" })
keymap.set("n", "K", function() vim.lsp.buf.hover() end, { desc = "Hover Documentation" })
keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, { desc = "Rename Symbol" })
keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, { desc = "Code Action" })
keymap.set("n", "gl", function() vim.diagnostic.open_float() end, { desc = "Show Line Diagnostics" })
