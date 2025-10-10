# TODO

Find a way to reload the plugins

## better search

- [ ] find way to grep files the best way

## better terminal

- [ ] create my own pop-up terminal / add more options to the installed one

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
│ conform.lua [p]
│ lazydev.lua [p]
│ marks.lua [r]
│ mini.lua
│ neogen.lua [p]
│ nvim-autopairs.lua
│ nvim-cmp.lua [p]
│ nvim-dap.lua
│ nvim-lspconfig.lua [p]
│ nvim-treesitter.lua [p]
│ remote-nvim.lua [p]
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
││ vim-fugitive.lua [p]
││
│├───ui
││ catppuccin.lua [p]
││ indent-blankline.lua [p]
││ lsp_signature.lua [p]
││ lualine.lua [p]
││ markview.lua [p]
││ netrw.lua [p]
││ nvim-notify.lua [p]
││ rainbow-delimiters.lua [p]
││ smear-cursor.lua [r]
││ todo-comments.lua [p]
││ trouble.lua [p]
││ which-key.lua [p]

## errors

- when pressing gd it connect the same lsp twice

## lsp

- in python when creating new file it need lsp update to find it
<!-- - in python when using `from x import` then the autocomplete needs to be stuff from the import -->

## ideas

- function that format only git changed - get the list of ranges, then call the formatter on them
- on the grep function - add option for regex, exact search and capital letters; and show the selected options in the title
