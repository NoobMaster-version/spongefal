#!/usr/bin/env node
/**
 * Verify every internal link and asset in the built site resolves to a real
 * file in dist/. Catches the failure this repo has actually had before —
 * a page linking somewhere that 404s — which a successful build will not.
 *
 * Usage: node scripts/check-links.mjs [base]
 *   base is the deployed path prefix: "/spongefal" for GitHub Pages, "" for
 *   Vercel. Defaults to "", matching `astro build` with VERCEL=1.
 */
import { readdir, readFile } from 'node:fs/promises';
import { join, relative, extname } from 'node:path';

const DIST = 'dist';
const base = (process.argv[2] ?? '').replace(/\/$/, '');

async function walk(dir) {
  const out = [];
  for (const e of await readdir(dir, { withFileTypes: true })) {
    const p = join(dir, e.name);
    if (e.isDirectory()) out.push(...(await walk(p)));
    else out.push(p);
  }
  return out;
}

const files = await walk(DIST);
const present = new Set(files.map((f) => '/' + relative(DIST, f).split('\\').join('/')));
const pages = files.filter((f) => f.endsWith('.html'));

// href="..." / src="..." / srcset="a 1x, b 2x"
const ATTR = /(?:href|src)\s*=\s*["']([^"']+)["']/gi;
const SRCSET = /srcset\s*=\s*["']([^"']+)["']/gi;

const problems = [];

for (const page of pages) {
  const html = await readFile(page, 'utf8');
  const where = relative(DIST, page);
  const found = [];

  for (const m of html.matchAll(ATTR)) found.push(m[1]);
  for (const m of html.matchAll(SRCSET))
    for (const part of m[1].split(','))
      found.push(part.trim().split(/\s+/)[0]);

  for (const raw of found) {
    const link = raw.trim();
    // things that are not ours to resolve
    if (
      !link ||
      link.startsWith('#') ||
      link.startsWith('data:') ||
      link.startsWith('mailto:') ||
      link.startsWith('tel:') ||
      /^[a-z][a-z0-9+.-]*:/i.test(link) ||
      link.startsWith('//')
    )
      continue;
    const clean = link.split('#')[0].split('?')[0];
    if (!clean) continue;

    let path;
    if (clean.startsWith('/')) {
      // absolute: must carry the deployed base, and is checked without it
      if (base && !clean.startsWith(base + '/') && clean !== base) {
        problems.push(`${where}: "${link}" does not start with the base "${base}"`);
        continue;
      }
      path = base ? clean.slice(base.length) || '/' : clean;
    } else {
      // relative: resolve against this page's own URL. Base-agnostic by
      // construction, which is why it is the safe way to link between pages.
      path = new URL(clean, 'http://_/' + relative(DIST, page).split('\\').join('/')).pathname;
    }

    const candidates = path.endsWith('/')
      ? [path + 'index.html']
      : extname(path)
        ? [path]
        : [path, path + '/index.html', path + '.html'];

    if (!candidates.some((c) => present.has(c))) {
      problems.push(`${where}: "${link}" -> no file at ${candidates.join(' or ')}`);
    }
  }
}

const label = base || '/';
if (problems.length) {
  console.error(`\nBroken internal links with base "${label}":\n`);
  for (const p of [...new Set(problems)]) console.error('  ' + p);
  console.error(`\n${problems.length} problem(s) across ${pages.length} pages.`);
  process.exit(1);
}
console.log(`base "${label}": ${pages.length} pages, every internal link and asset resolves.`);
