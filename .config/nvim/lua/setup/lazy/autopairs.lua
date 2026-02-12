return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup({
            check_ts = true, -- Aktifkan Treesitter integration
            ts_config = {
                lua = {'string'},-- Jangan pasangkan kurung di dalam string di lua
                javascript = {'template_string'},
            },
        })

        -- Jika kamu pakai nvim-cmp, tambahkan ini agar kurung otomatis muncul
        -- setelah kamu memilih fungsi dari completion
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local cmp = require('cmp')
        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end
}
