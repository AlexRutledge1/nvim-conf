-- LSP config
local luasnip_fix_augroup = vim.api.nvim_create_augroup("MyLuaSnipHistory", { clear = true })
vim.api.nvim_create_autocmd("ModeChanged", {
    pattern = "*",
    callback = function()
        if
            ((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
            and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
            and not require("luasnip").session.jump_active
        then
            require("luasnip").unlink_current()
        end
    end,
    group = luasnip_fix_augroup,
})

local no_opts = {}

return {
    unpack(no_opts),
    {
        "mfussenegger/nvim-dap",
    },
    {
        "rcarriga/nvim-dap-ui",
    },
    {
        "mfussenegger/nvim-dap-python",
        opts = { python3_cmd = "python3.11" },
    },
    {
        "HiPhish/debugpy.nvim",
        dependencies = true,
        config = function()
            require("dap-python").setup({
                python3_cmd = "python3.11",
            })
        end,
    },
    {
        "willambowman/mason.nvim",
        opts = {
            ensure_installed = {
                "isort",
                "pyright",
                "debugpy",
            },
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
        },
        -- change some options
        opts = {
            defaults = {
                layout_strategy = "horizontal",
                layout_config = { prompt_position = "top" },
                sorting_strategy = "ascending",
                winblend = 0,
            },
        },
    },
}
