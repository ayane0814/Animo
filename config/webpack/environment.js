require("dotenv").config();

const { environment } = require('@rails/webpacker')

module.exports = environment

const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery/src/jquery',
    Popper: 'popper.js'
  })
)
// jQuery: のところをjqueryだけにしたら、地図が表示されたのですがこれを変えた事でいいねなどの非同期化ができなくなった。
// なので、前のようにもどし非同期化ができるようになり、何故か普通にマップも表示されていたのでこのままでいく。