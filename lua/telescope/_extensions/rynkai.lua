local function colorscheme_switcher(opts)
	local pickers, finders, previewers, actions, action_state, utils, conf
	if pcall(require, "telescope") then
		pickers = require("telescope.pickers")
		finders = require("telescope.finders")
		previewers = require("telescope.previewers")
		actions = require("telescope.actions")
		action_state = require("telescope.actions.state")
		utils = require("telescope.utils")
		conf = require("telescope.config").values
	else
		error("Cannot find telescope!")
	end

	local before_color = require("rynkai.config").options.theme
	local need_restore = true

	local themes = require("rynkai.fn").list_themes()
	local colors = { before_color }

  themes = vim.list_extend(
    colors,
    vim.tbl_filter(function(color)
      return color ~= before_color
    end, themes)
  )

	local previewer

	-- define previewer
	local bufnr = vim.api.nvim_get_current_buf()
	local p = vim.api.nvim_buf_get_name(bufnr)

	-- don't need previewer
	if vim.fn.buflisted(bufnr) ~= 1 then
		local deleted = false
		local function del_win(win_id)
			if win_id and vim.api.nvim_win_is_valid(win_id) then
				utils.buf_delete(vim.api.nvim_win_get_buf(win_id))
				pcall(vim.api.nvim_win_close, win_id, true)
			end
		end

		previewer = previewers.new({
			preview_fn = function(_, entry, status)
				if not deleted then
					deleted = true
					del_win(status.preview_win)
					del_win(status.preview_border_win)
				end
				require("rynkai.fn").change(entry.value)
			end,
		})
	else
		-- show current buffer content in previewer
		previewer = previewers.new_buffer_previewer({
			get_buffer_by_name = function()
				return p
			end,
			define_preview = function(self, entry)
				if vim.loop.fs_stat(p) then
					conf.buffer_previewer_maker(p, self.state.bufnr, { bufname = self.state.bufname })
				else
					local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
					vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, lines)
				end
				require("rynkai.fn").change(entry.value)
			end,
		})
	end

	local picker = pickers.new(opts, {
		prompt_title = "Change color style",
		finder = finders.new_table({
			results = colors,
		}),
		sorter = conf.generic_sorter(opts),
		previewer = previewer,
		attach_mappings = function(prompt_bufnr)
			actions.select_default:replace(function()
				local selection = action_state.get_selected_entry()
				if selection == nil then
					print("[telescope] Nothing currently selected")
					return
				end

				actions.close(prompt_bufnr)
				need_restore = false
				require("rynkai.fn").change(selection[1])
				require("rynkai.fn").change_theme(before_color, selection[1])
			end)
			return true
		end,
	})

	-- rewrite picker.close_windows. restore color if needed
	local close_windows = picker.close_windows
	picker.close_windows = function(status)
		close_windows(status)
		if need_restore then
			require("rynkai.fn").change(before_color)
		end
	end

	picker:find()
end

-- register theme swticher as local present, telescope = pcall(require, "telescope")
local present, telescope = pcall(require, "telescope")
if present then
	return telescope.register_extension({
		exports = {
			rynkai = colorscheme_switcher,
		},
	})
else
	error("Cannot find telescope!")
end
