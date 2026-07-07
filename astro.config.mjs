// @ts-check
import { defineConfig } from 'astro/config';
import mdx from '@astrojs/mdx';
import sitemap from '@astrojs/sitemap';

// Two hosts, two base paths:
//  - GitHub Pages serves at a project subpath → base '/spongefal'
//  - Vercel (and any custom root domain) serves at '/' → base '/'
// Vercel sets the VERCEL env var during its build, so we detect it.
// When you add a custom domain later, set SITE_URL in Vercel's env vars
// (e.g. https://kartikey.xyz) and it flows into canonical URLs + sitemap.
const onVercel = !!process.env.VERCEL;
const site = onVercel
  ? process.env.SITE_URL || 'https://spongefal.vercel.app'
  : 'https://noobmaster-version.github.io';

export default defineConfig({
  site,
  base: onVercel ? '/' : '/spongefal',
  trailingSlash: 'ignore',
  integrations: [mdx(), sitemap()],
  build: {
    inlineStylesheets: 'auto',
  },
});
