module.exports = {
    devServer: {
      open: process.platform === 'darwin',
      host: '0.0.0.0',
      port: 4000, 
      https: false,
      hotOnly: false,
      proxy: {
        '^/api': {
          target: 'http://127.0.0.1:8080/',
          ws: true,
          changeOrigin: true,
          pathRewrite: {
            '^/api': '/'
          }, 
        },
      }
    },  
}