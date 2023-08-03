const { environment } = require('@rails/webpacker')

//jQuery導入時の変更
const webpack = require('webpack')
environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery/src/jquery',
        jQuery: 'jquery/src/jquery'
    })
)
//ここまで
module.exports = environment
