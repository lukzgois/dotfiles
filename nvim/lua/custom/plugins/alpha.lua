return {
    'goolord/alpha-nvim',
    enabled = false,
    dependencies = { 'echasnovski/mini.icons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.theta'.config)
    end
}
