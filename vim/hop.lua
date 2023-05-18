lua require'hop'.setup()
nnoremap <C-c> :HopChar1<CR>
nnoremap <silent><leader>cc :HopChar1<CR>
nnoremap <silent><leader>s :HopChar2<CR>
nnoremap <silent><leader>j :HopLineStartAC<CR>
nnoremap <silent><leader>k :HopLineStartBC<CR>
nnoremap <silent><leader>l :HopWordCurrentLine<CR>
nnoremap <silent><leader>h :HopWordCurrentLine<CR>

vnoremap <silent><leader>cc :HopChar1<CR>
vnoremap <silent><leader>s :HopChar2({ 'extend_visual' }, { 'true' })<CR>
vnoremap <silent><leader>j :HopLineStartAC<CR>
vno

local hop = require('hop')
local directions = require('hop.hint').HintDirection
hop.setup()

vim.keymap.set('', '<leader>cc', function()
  hop.hint_char1({ direction = directions.BOTH_CURSOR, current_line_only = false })
end, {remap=true})

vim.keymap.set('', '<leader>s', function()
  hop.hint_char2({ direction = directions.BOTH_CURSOR, current_line_only = false })
end, {remap=true})

vim.keymap.set('', '<leader>j', function()
  hop.hint_lines_skip_whitespace({direction = directions.AFTER_CURSOR
