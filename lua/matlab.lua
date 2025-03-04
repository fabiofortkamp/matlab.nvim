local M = {}

--- Find the line number that contains the function definition for the current scope
---@param current_line_index integer The 1-based line index of the current line
---@return integer? # The 1-based line above current_line that contains a function definition, or nil if none found
M.find_function_line_number = function(current_line_index)
	local function_line_number = nil
	local previous_lines = vim.api.nvim_buf_get_lines(0, 0, current_line_index + 1, false)
	vim.print(previous_lines)
	for i = #previous_lines, 1, -1 do
		local function_definition_pattern = "%s*function"
		if string.find(previous_lines[i], function_definition_pattern) then
			function_line_number = i
      break
		end
	end
	return function_line_number
end

M.f = function(opts)
	local line = vim.api.nvim_win_get_cursor(0)[1]
	vim.print(M.find_function_line_number(line))
end
M.setup = function(_) end

return M
