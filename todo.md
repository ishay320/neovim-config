# TODO

## markdown

- [ ] in normal mode - make the cursor line show the original line

## better search

- [ ] find way to grep files the best way

## better terminal

- [ ] create my own pop-up terminal / add more options to the installed one
- [ ] multi terminal

## netrw

- [ ] show git info on file - U M R

---

## future

- [ ] distant

---

## checkout

## remote work

https://github.com/nosduco/remote-sshfs.nvim
https://github.com/Chayanon-Ninyawee/remote-lsp.nvim

- treesitter-context

## cleanup

Pass on each one and write:

- removed [r]
- passed [p]

Check for each:

- lazy load
- key map
- needed?
- upgrades
  - someone do it better?
  - there is better way to do it?
  - cleanup

│ lazy_init.lua [p]
│
├───core
│ autocommands.lua [p]
│ configurations.lua [p]
│ keymaps.lua [p]
│ neovide.lua [p]
│
├───plugins
│ conform.lua
│ lazydev.lua
│ marks.lua
│ mini.lua
│ neogen.lua
│ nvim-autopairs.lua
│ nvim-cmp.lua
│ nvim-dap.lua
│ nvim-lspconfig.lua
│ nvim-treesitter.lua [p]
│ remote-nvim.lua
│ telescope.lua [p]
│ toggleterm.lua [p]
│ treewalker.lua
│ undotree.lua [p]
│ venv.lua [p]
│ vim-abolish.lua
│ vim-sleuth.lua
│
│├───ai
││ copilot.lua [p]
││ copilotChat.lua [p]
││
│├───git
││ gitsigns.lua [p]
││ vim-fugitive.lua
││
│├───ui
││ catppuccin.lua [p]
││ indent-blankline.lua
││ lsp_signature.lua
││ lualine.lua
││ markview.lua
││ netrw.lua [p]
││ nvim-notify.lua
││ rainbow-delimiters.lua
││ smear-cursor.lua
││ todo-comments.lua [p]
││ trouble.lua
││ which-key.lua

## errors

- when pressing gd it connect the same lsp twice
