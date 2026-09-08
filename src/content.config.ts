import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

/**
 * The case-study skeleton is enforced here: a fleet entry without dates,
 * status, or team attribution is a build error, not a silent gap.
 */
const fleet = defineCollection({
  loader: glob({ pattern: '*.mdx', base: './src/content/fleet' }),
  schema: z.object({
    title: z.string(),
    // Plain-language "what is this thing", shown in brackets after the title.
    // Nobody remembers a project's name; everyone knows what a quadruped is.
    what: z.string(),
    summary: z.string(),
    kind: z.enum(['case-study', 'cluster']),
    order: z.number(), // ascending difficulty — the fleet sort order
    status: z.enum(['deployed', 'validated', 'prototype', 'retired', 'teaching', 'wip']),
    dates: z.string(),
    team: z.string(), // "solo" | "team — role"
    location: z.string().optional(),
    tech: z.array(z.string()),
    repo: z.string().url().optional(),
    repoNote: z.string().optional(), // honest alternative when no repo, e.g. "code private — internship IP"
    links: z.array(z.object({ label: z.string(), url: z.string().url() })).default([]),
    poster: z.string(), // path relative to /assets/, e.g. "kdail/uwb-anchor.jpg"
    video: z.string().optional(), // looping wall footage, same convention
    // Spotlight-only override. The homepage reel wants the most watchable clip,
    // which isn't always the one that represents the project on the wall.
    homeVideo: z.string().optional(),
    homePoster: z.string().optional(),
    homeLabel: z.string().optional(), // when the reel clip isn't the titled thing
    featured: z.boolean().default(false),
    metric: z.string().optional(), // the one number this project earned, e.g. "315 m UWB range"
  }),
});

export const collections = { fleet };
