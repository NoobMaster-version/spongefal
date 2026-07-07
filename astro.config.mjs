// @ts-check
import { defineConfig } from 'astro/config';
import mdx from '@astrojs/mdx';

// Served from GitHub Pages project site: noobmaster-version.github.io/spongefal/
export default defineConfig({
  site: 'https://noobmaster-version.github.io',
  base: '/spongefal',
  trailingSlash: 'ignore',
  integrations: [mdx()],
  build: {
    inlineStylesheets: 'auto',
  },
});
