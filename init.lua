require("config.lazy")
require("config.options")
require("config.keymaps")
vim.cmd.colorscheme "monokai_pro"
vim.api.nvim_create_user_command(
    'InitLua',
    function()
        vim.cmd.edit(vim.fn.stdpath('config'))
    end,
    {}
)

-- 起動するshellをbashに設定する
vim.o.shell = "/bin/bash"
