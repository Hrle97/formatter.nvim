-- NOTE: this script exports mapping of module names in this folder to their contents

-- TODO: extract a function from this for filetypes and defaults?

local M = {}

local this_script_path = vim.fn.expand("%")
local this_script_dir = vim.fn.fnamemodify(this_script_path, ":h")
local this_script_dir_script_paths = vim.fn.split(vim.fn.glob(this_script_dir .. "/*.lua"), "\n")

for _, script_path in ipairs(this_script_dir_script_paths) do
	local script_name = vim.fn.fnamemodify(script_path, ":t:r")
	if not (script_name == "init") then
		M[script_name] = require("formatter.filetypes." .. script_name)
	end
end

return M
