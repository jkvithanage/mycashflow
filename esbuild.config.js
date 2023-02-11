#!/usr/bin/env node

const { build } = require('esbuild')
const { copy } = require('esbuild-plugin-copy')
const rails = require('esbuild-rails')
const path = require('path')
const { sassPlugin } = require('esbuild-sass-plugin')

build({
  entryPoints: [
    'application.js'
  ],
  bundle: true,
  sourcemap: process.argv.includes('--sourcemap'),
  minify: true,
  resolveExtensions: ['.ts', '.js'],
  logLevel: 'info',
  outdir: path.join(process.cwd(), "app/assets/builds"),
  absWorkingDir: path.join(process.cwd(), "app/javascript"),
  watch: process.argv.includes('--watch'),
  metafile: true,
  entryNames: '[name]',
  external: ['*.css', '*.woff', '*.png', '*.svg'],
  loader: {
    '.png': 'dataurl',
    '.woff': 'dataurl',
    '.woff2': 'dataurl',
    '.eot': 'dataurl',
    '.ttf': 'dataurl',
    '.svg': 'dataurl'
  },
  define: {
    'process.env.NODE_ENV': JSON.stringify(process.env.NODE_ENV || 'production'),
    'process.env.RELEASE_STAGE': JSON.stringify(process.env.RAILS_ENV || 'production'),
    'process.env.BUILD_AT': JSON.stringify(process.env.BUILD_AT || Date.now()),
    global: 'window'
  },
  plugins: [
    rails(),
    copy({
      resolveFrom: path.join(process.cwd(), 'public/assets'),
      assets: [
        {
          from: [
            './node_modules/tinymce/**/*.js',
            './node_modules/tinymce/**/*.css'
          ],
          to: ['./tinymce'],
          keepStructure: true
        }
      ]
    }),
    sassPlugin({ cssImports: true })
  ]
})
  .then(() => console.log('⚡ Build complete! ⚡'))
  .catch(error => {
    console.error(error)
    process.exit(1)
  })
