vim.cmd [[
function! g:MkdpBrowserfunc(url)
    call jobstart(['sh', '-c', 'qutebrowser --qt-arg name mkdp --target private-window -T -C ~/.config/qutebrowser/config.py ' . shellescape(a:url)])
endfunction
]]

vim.g.mkdp_browserfunc = 'g:MkdpBrowserfunc'
