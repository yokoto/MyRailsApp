const { environment } = require('@rails/webpacker')
const typescript =  require('./loaders/typescript')

environment.loaders.prepend('typescript', typescript)
module.exports = {
  test: /\.(ts|tsx)?(\.erb)?$/,
  use: [{
    loader: 'awesome-typescript-loader'
}]
}