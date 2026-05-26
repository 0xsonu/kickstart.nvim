-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

vim.keymap.set('n', '\\', '<Cmd>Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })

require('neo-tree').setup {
  filesystem = {
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
    },
    filtered_items = {
      -- when true, they will just be displayed differently than normal items
      visible = false,
      -- whether children of filtered parents should inherit their parent's highlight group
      children_inherit_highlights = true,
      hide_dotfiles = true,
      hide_gitignored = true,
      hide_ignored = true, -- hide files that are ignored by other gitignore-like files
      -- other gitignore-like files, in descending order of precedence.
      ignore_files = {
        '.neotreeignore',
        '.ignore',
        -- ".rgignore"
      },
      hide_hidden = true, -- only works on Windows for hidden files/directories
      hide_by_name = {
        '.DS_Store',
        'thumbs.db',
        'node_modules',
      },
      hide_by_pattern = {
        --"*.meta",
        --"*/src/*/tsconfig.json",
      },
      always_show = { -- remains visible even if other settings would normally hide it
        -- '.gitignored',
      },
      always_show_by_pattern = { -- uses glob style patterns
        --".env*",
      },
      never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
        --".DS_Store",
        --"thumbs.db",
      },
      never_show_by_pattern = { -- uses glob style patterns
        --".null-ls_*",
      },
    },
  },
}
