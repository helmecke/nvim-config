local utils = {}

function utils.create_augroup(definitions)
  for _, definition in pairs(definitions) do
    vim.cmd 'autocmd!'
    for _, def in ipairs(definition) do
      vim.cmd('autocmd ' .. def)
    end
    vim.cmd 'augroup END'
  end
end

function utils.is_buffer_empty()
  -- Check whether the current buffer is empty
  return vim.fn.empty(vim.fn.expand '%:t') == 1
end

function utils.has_width_gt(cols)
  -- Check if the windows width is greater than a given number of columns
  return vim.fn.winwidth(0) / 2 > cols
end

return utils
