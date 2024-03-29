require('winbar').setup({
	enabled = false,

	show_file_path = true,
	show_symbols = true,

	colors = {
		path = '#948eff', -- You can customize colors like #c946fd
		file_name = '',
		symbols = '#55ff7f',
	},

	icons = {
		file_icon_default = ' ',
		seperator = '',
		editor_state = '●',
		lock_icon = '',
	},

	exclude_filetype = {
		'help',
		'startify',
		'dashboard',
		'packer',
		'neogitstatus',
		'NvimTree',
		'Trouble',
		'alpha',
		'lir',
		'Outline',
		'spectre_panel',
		'toggleterm',
		'qf',
	}
})
