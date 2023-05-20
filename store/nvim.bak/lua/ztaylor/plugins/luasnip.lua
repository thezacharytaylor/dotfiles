return {{
    'L3MON4D3/LuaSnip',
    lazy = false,
    version = "<CurrentMajor>.*",
    build = "make install_jsregexp",
    config = function()
        require('luasnip').config.set_config({
            history = true,
            updateevents = 'TextChanged,TextChangedI'
        })
        require('luasnip').add_snippets('php',
            {require('luasnip').parser.parse_snippet('class', 'class $1\n{\n    $0\n}'),
             require('luasnip').parser.parse_snippet('pubf', 'public function $1($2): $3\n{\n    $0\n}'),
             require('luasnip').parser.parse_snippet('prif', 'private function $1($2): $3\n{\n    $0\n}'),
             require('luasnip').parser.parse_snippet('prof', 'protected function $1($2): $3\n{\n    $0\n}'),
             require('luasnip').parser.parse_snippet('testt', 'public function test_$1()\n{\n    $0\n}'),
             require('luasnip').parser.parse_snippet('testa', '/** @test */\npublic function $1()\n{\n    $0\n}')})

        require('luasnip').add_snippets('typescript',
            {require('luasnip').parser.parse_snippet('import', "import $1 from '$0'")})
    end
} -- local ls = require('luasnip')
-- require("luasnip.loaders.from_snipmate").lazy_load()
-- require('luasnip').add_snippets('vue', {
--   require('luasnip').parser.parse_snippet('defineProps', 'defineProps<{\n  $0\n}>()'),
-- })
}
