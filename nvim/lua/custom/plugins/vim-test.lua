-- Testing helper

return {
  'vim-test/vim-test',
  keys = {
    { '<Leader>tn', ':TestNearest<CR>' },
    { '<Leader>tf', ':TestFile<CR>' },
    { '<Leader>ts', ':TestSuite<CR>' },
    { '<Leader>tl', ':TestLast<CR>' },
    { '<Leader>tv', ':TestVisit<CR>' },
  },
  dependencies = {
    'voldikss/vim-floaterm',
    "preservim/vimux"
  },
  config = function()
    vim.cmd [[
      let test#php#phpunit#options = '--colors=always'
      let test#php#pest#options = '--colors=always'

      function! FloatermStrategy(cmd)
        execute 'silent FloatermSend q'
        execute 'silent FloatermKill'
        execute 'FloatermNew! '.a:cmd.' |less -X'
      endfunction

      function! EscapeSpecialChars(path)
        let l:escaped = a:path
        let l:escaped = substitute(l:escaped, '\[', '\\[', 'g')
        let l:escaped = substitute(l:escaped, '\]', '\\]', 'g')
        let l:escaped = substitute(l:escaped, '(', '\\(', 'g')
        let l:escaped = substitute(l:escaped, ')', '\\)', 'g')
        return l:escaped
      endfunction

      let g:test#custom_transformations = {'escape_special': function('EscapeSpecialChars')}
      let g:test#transformation = 'escape_special'
      let g:test#custom_strategies = {'floatermcustom': function('FloatermStrategy')}
      let g:test#strategy = 'vimux'
    ]]
  end,
}
