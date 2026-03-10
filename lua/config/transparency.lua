local M = {}
function M.enable()
  local groups = {
    "Normal",
    "NormalFloat",
    "FloatBorder",
    "SignColumn",
    "EndOfBuffer",
    "StatusLine",
    "StatusLineNC",
    "WinBar",
    "WinBarNC",
    "Pmenu",
    "PmenuSel",
    "CursorLine",
    "CursorLineNr",
  }

  local modes = { "normal", "insert", "visual", "replace", "command", "terminal", "inactive" }
  local sections = { "a", "b", "c", "x", "y", "z" }

  -- Section groups
  for _, section in ipairs(sections) do
    for _, mode in ipairs(modes) do
      table.insert(groups, "lualine_" .. section .. "_" .. mode)
    end
  end

  -- Transitional groups (separators between sections)
  for _, s1 in ipairs(sections) do
    for _, s2 in ipairs(sections) do
      for _, mode in ipairs(modes) do
        table.insert(
          groups,
          "lualine_transitional_lualine_" .. s1 .. "_" .. mode .. "_to_lualine_" .. s2 .. "_" .. mode
        )
      end
    end
  end

  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = "NONE" })
  end
end
return M
