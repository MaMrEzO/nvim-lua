require("orgmode").setup({
	org_agenda_files = { "~/Documents/org/*" },
	org_default_notes_file = "~/Documents/org/refile.org",
	mappings = {
		global = {
			org_agenda = "<leader>o",
			org_capture = "<leader>oc",
		},
	},
})
