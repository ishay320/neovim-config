return {
	-- This plugin enhances text substitution and abbreviations
	-- Snake Case: crs
	--Camel Case: crc
	--Mixed Case: crm
	--Upper Case: cru
	--Dash Case: cr-
	--Dot Case: cr.

	event = { "BufReadPre", "BufNewFile" },
	"tpope/vim-abolish",
}
