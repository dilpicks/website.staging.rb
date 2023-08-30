import { defineConfig } from 'vite';
import RubyPlugin from 'vite-plugin-ruby';
// import EnvironmentPlugin from 'vite-plugin-environment'
// import basicSsl from '@vitejs/plugin-basic-ssl'
import fs from 'fs';
import vue from '@vitejs/plugin-vue';

import path from 'path';

export default defineConfig(({ command, mode, ssrBuild }) => {
  let config = {
    resolve: {
      alias: [
        {
          find: '@',
          replacement: path.resolve(__dirname, 'app', 'javascript'),
        },
      ],
      extensions: ['.mjs', '.js', '.ts', '.jsx', '.tsx', '.json', '.vue'],
    },
    plugins: [
      vue(),
      RubyPlugin(),
      // EnvironmentPlugin(),
    ],
    css: {
      preprocessorOptions: {
        scss: {
          sourceMap: false,
          additionalData(source: any, fp: any) {
            if (fp.endsWith('variables.scss')) return source;

            return `@import "@/assets/css/_variables.scss"; ${source}`;
          },
        },
      },
    }
  }

  if (mode === 'development') {
    return {
      ...config,
      server: {
        https: {
          key: fs.readFileSync('./config/certs/localhost/localhost.key'),
          cert: fs.readFileSync('./config/certs/localhost/localhost.crt'),
        }
      }
    }
  } else {
    return config
  }
});