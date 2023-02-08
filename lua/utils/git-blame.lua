-- https://teukka.tech/vimtip-gitlens.html

local M = {}
local api = vim.api
local nsId = api.nvim_create_namespace('gitblame')

function M.blameVirtText()
  local ft = vim.fn.expand('%:h:t')
  if ft == '' then
    return
  end
  if ft == 'bin' then
    return
  end
  api.nvim_buf_clear_namespace(0, 2, 0, -1)
  local currFile = vim.fn.expand('%')
  local line = api.nvim_win_get_cursor(0)
  local blame = vim.fn.system(string.format('git blame -c -L %d,%d %s', line[1], line[1], currFile))
  local hash = vim.split(blame, '%s')[1]
  local cmd = string.format("git show %s ", hash).."--format='%an | %ar | %s'"
  local text = ''
  if hash == '00000000' then
    text = 'Not Committed Yet'
  else
    text = vim.fn.system(cmd)
    text = vim.split(text, '\n')[1]
    if text:find("fatal") then
      text = 'Not Committed Yet'
    end
  end

  api.nvim_buf_set_extmark(vim.fn.bufnr('%'), nsId, line[1] - 1, 0, {
    id=1,
    virt_text={{ text,'GitLens' }},
    virt_text_pos='right_align'
  })
end

function M.clearBlameVirtText()
  api.nvim_buf_del_extmark(vim.fn.bufnr('%'), nsId, 1)
end

return M


