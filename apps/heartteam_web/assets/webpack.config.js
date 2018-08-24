const path = require('path');
const OptimizeCssAssetsPlugin = require('optimize-css-assets-webpack-plugin');
const UglifyJsPlugin = require('uglifyjs-webpack-plugin');
const CopyWebpackPlugin = require('copy-webpack-plugin');
const ExtractTextPlugin = require("extract-text-webpack-plugin");

module.exports = function(env) {
    const production = process.env.NODE_ENV === 'production';
    return {
        devtool: production ? 'source-maps' : 'eval',
        optimization: {
            minimizer: [
                new UglifyJsPlugin({ cache: true, parallel: true, sourceMap: false }),
                new OptimizeCssAssetsPlugin({
                    cssProcessorOptions: { discardComments: { removeAll: true } }
                })
            ]
        },
        entry: './js/app.js',
        module: {
            rules: [
                {
                    test: /\.js$/,
                    exclude: /node_modules/,
                    use: {
                        loader: 'babel-loader',
                    },
                },
               {
                   test:/\.(s*)css$/, 
                   use: ExtractTextPlugin.extract({
                       fallback: 'style-loader',
                       use: [
                           'css-loader',
                           'sass-loader'
                       ]
                   })
                }
            ],
        },
        plugins: [
            new ExtractTextPlugin('css/app.css'),
            new CopyWebpackPlugin([{ from: 'static/', to: './' }])
        ],
        resolve: {
            modules: ['node_modules', path.resolve(__dirname, 'js')],
            extensions: ['.js'],
        },
        output: {
            path: path.resolve(__dirname, '../priv/static'),
            filename: 'js/app.js',
            publicPath: '/'
        }
    };
};
