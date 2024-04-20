local no_ops = {
  "mhartington/oceanic-next",
}

return {
  unpack(no_ops),
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "OceanicNext",
    },
  },
  {
    "tell-k/vim-autopep8",
    config = function(opts)
      opts.max_line_length = 160
    end,
  },
}
