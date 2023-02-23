require'nvim-navic'.setup {
    icons = {
		Array			= " ",
		Boolean       = "◩ ",
		Class = "ﴯ",
		Color = "🎨",
		Constant      = " ",
		Constructor = " ",
		Default = " ",
		Enum = " ",
		EnumMember = " ",
		Event         = " ",
		Field = " ",
		File          = " ",
		Folder = " ",
		Function      = " ",
		Interface = " ",
		Key = " ",
		Method = " ",
		Module        = " ",
		Namespace     = " ",
		Null          = "ﳠ ",
		Number        = " ",
		Object        = " ",
		Operator      = " ",
		Package       = " ",
		Property = " ",
		Reference = " ",
		Snippet = " ",
		String        = " ",
		Struct = "🕸",
		Text = " ",
		TypeParameter = " ",
		Unit = "塞",
		Value = " ",
		Variable = " ",
    },
    highlight = true,
    separator = "  ",
    depth_limit = 0,
    depth_limit_indicator = "..",
}
vim.api.nvim_set_hl(0, "NavicIconsFile",          {default = true, bg = "#000000", fg = "#4c6e9c"})
vim.api.nvim_set_hl(0, "NavicIconsModule",        {default = true, bg = "#000000", fg = "#4c6e9c"})
vim.api.nvim_set_hl(0, "NavicIconsNamespace",     {default = true, bg = "#000000", fg = "#4c6e9c"})
vim.api.nvim_set_hl(0, "NavicIconsPackage",       {default = true, bg = "#000000", fg = "#4c6e9c"})
vim.api.nvim_set_hl(0, "NavicIconsClass",         {default = true, bg = "#000000", fg = "#4c6e9c"})
vim.api.nvim_set_hl(0, "NavicIconsMethod",        {default = true, bg = "#000000", fg = "#4c6e9c"})
vim.api.nvim_set_hl(0, "NavicIconsProperty",      {default = true, bg = "#000000", fg = "#4c6e9c"})
vim.api.nvim_set_hl(0, "NavicIconsField",         {default = true, bg = "#000000", fg = "#4c6e9c"})
vim.api.nvim_set_hl(0, "NavicIconsConstructor",   {default = true, bg = "#000000", fg = "#4c6e9c"})
vim.api.nvim_set_hl(0, "NavicIconsEnum",          {default = true, bg = "#000000", fg = "#4c6e9c"})
vim.api.nvim_set_hl(0, "NavicIconsInterface",     {default = true, bg = "#000000", fg = "#4c6e9c"})
vim.api.nvim_set_hl(0, "NavicIconsFunction",      {default = true, bg = "#000000", fg = "#4c6e9c"})
vim.api.nvim_set_hl(0, "NavicIconsVariable",      {default = true, bg = "#000000", fg = "#4c6e9c"})
vim.api.nvim_set_hl(0, "NavicIconsConstant",      {default = true, bg = "#000000", fg = "#4c6e9c"})
vim.api.nvim_set_hl(0, "NavicIconsString",        {default = true, bg = "#000000", fg = "#4c6e9c"})
vim.api.nvim_set_hl(0, "NavicIconsNumber",        {default = true, bg = "#000000", fg = "#4c6e9c"})
vim.api.nvim_set_hl(0, "NavicIconsBoolean",       {default = true, bg = "#000000", fg = "#4c6e9c"})
vim.api.nvim_set_hl(0, "NavicIconsArray",         {default = true, bg = "#000000", fg = "#4c6e9c"})
vim.api.nvim_set_hl(0, "NavicIconsObject",        {default = true, bg = "#000000", fg = "#4c6e9c"})
vim.api.nvim_set_hl(0, "NavicIconsKey",           {default = true, bg = "#000000", fg = "#4c6e9c"})
vim.api.nvim_set_hl(0, "NavicIconsNull",          {default = true, bg = "#000000", fg = "#4c6e9c"})
vim.api.nvim_set_hl(0, "NavicIconsEnumMember",    {default = true, bg = "#000000", fg = "#4c6e9c"})
vim.api.nvim_set_hl(0, "NavicIconsStruct",        {default = true, bg = "#000000", fg = "#4c6e9c"})
vim.api.nvim_set_hl(0, "NavicIconsEvent",         {default = true, bg = "#000000", fg = "#4c6e9c"})
vim.api.nvim_set_hl(0, "NavicIconsOperator",      {default = true, bg = "#000000", fg = "#4c6e9c"})
vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", {default = true, bg = "#000000", fg = "#4c6e9c"})
vim.api.nvim_set_hl(0, "NavicText",               {default = true, bg = "#000000", fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicSeparator",          {default = true, bg = "#000000", fg = "#f0f0f0"})
