local null_ls = require("null-ls")

null_ls.setup {
  sources = {
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.completion.spell,
    --null_ls.builtins.code_actions.gitsigns
  }
}

--local eslint = require("eslint")
--
--null_ls.setup()
--
--eslint.setup({
--  bin = 'eslint', -- or `eslint_d`
--  code_actions = {
--    enable = true,
--    apply_on_save = {
--      enable = true,
--      types = { "problem" }, -- "directive", "problem", "suggestion", "layout"
--    },
--    disable_rule_comment = {
--      enable = true,
--      location = "separate_line", -- or `same_line`
--    },
--  },
--  diagnostics = {
--    enable = true,
--    report_unused_disable_directives = false,
--    run_on = "type", -- or `save`
--  },
--})
--
--null_ls.register(eslint)
