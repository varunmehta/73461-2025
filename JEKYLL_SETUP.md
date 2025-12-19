# Jekyll Website Setup Documentation

## Overview

This repository now includes a Jekyll-powered GitHub Pages website that automatically generates a beautiful single-page site from your README.md file. The Jekyll infrastructure is organized cleanly in the `.jekyll/` directory to minimize root-level clutter.

## What Was Implemented

### Files Created

**Jekyll Infrastructure (`.jekyll/` directory):**
- `.jekyll/_config.yml` - Jekyll site configuration
- `.jekyll/Gemfile` - Ruby dependencies for Jekyll
- `.jekyll/_layouts/default.html` - Page layout template with conditional navigation
- `.jekyll/assets/css/styles.css` - Base styling (from quick theme)
- `.jekyll/assets/css/base16.solarized.css` - Code syntax highlighting
- `.jekyll/assets/css/custom.css` - Empty file for your custom styles
- `.jekyll/assets/img/favicon.png` - Site favicon

**Root Level:**
- `index.md` - Homepage that includes your README.md content

**GitHub Actions:**
- `.github/workflows/jekyll-build.yml` - Automated Jekyll build and deployment workflow

**Modified Files:**
- `.gitignore` - Added Jekyll and Bundler exclusions

### Directory Structure

```
Repository Root:
├── .github/
│   └── workflows/
│       ├── extract-svg.yml          (existing - LEGO SVG extraction)
│       └── jekyll-build.yml         (NEW - Jekyll build and deploy)
├── .jekyll/                         (NEW - all Jekyll files)
│   ├── _config.yml
│   ├── Gemfile
│   ├── _layouts/
│   │   └── default.html
│   └── assets/
│       ├── css/
│       │   ├── styles.css
│       │   ├── base16.solarized.css
│       │   └── custom.css
│       └── img/
│           └── favicon.png
├── index.md                         (NEW - site homepage)
├── block/                           (existing - unchanged)
├── docs/                            (existing - unchanged)
├── README.md                        (existing - your content)
└── .gitignore                       (modified)
```

**Root Impact:** Only 2 additions to root level:
1. `.jekyll/` directory (all Jekyll infrastructure)
2. `index.md` file (site entry point)

## Manual Steps Required

### Step 1: Enable GitHub Pages

1. Go to your repository on GitHub
2. Click **Settings** → **Pages** (in left sidebar)
3. Under "Build and deployment":
   - **Source**: Select **"GitHub Actions"**
4. Save changes

### Step 2: Verify Configuration

Check that `.jekyll/_config.yml` has the correct repository name:
- Current setting: `baseurl: "/73461-2025"`
- This MUST match your repository name exactly
- If your repo name is different, update this value

### Step 3: Commit and Push Changes

```bash
# Stage all new files
git add .

# Commit the changes
git commit -m "Add Jekyll website setup

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>"

# Push to GitHub
git push origin main
```

### Step 4: Wait for Deployment

1. Go to **Actions** tab in your GitHub repository
2. Watch the "Build and Deploy Jekyll Site" workflow run
3. Once complete (green checkmark), your site is live!

### Step 5: Visit Your Website

Your site will be available at:
```
https://[your-github-username].github.io/73461-2025/
```

Replace `[your-github-username]` with your actual GitHub username.

## Testing Locally

To test the site on your computer before pushing:

### Prerequisites

Install Ruby and Bundler:
```bash
# On macOS (using Homebrew)
brew install ruby

# Install bundler
gem install bundler
```

### Run Local Server

```bash
# Navigate to Jekyll directory
cd .jekyll

# Install dependencies (first time only)
bundle install

# Start the Jekyll server
bundle exec jekyll serve --source ../ --config _config.yml --baseurl ""

# Open your browser to:
# http://localhost:4000/
```

Press `Ctrl+C` to stop the server.

## Features

### Current Features

1. **Single-Page Design**: Your README.md automatically becomes the website homepage
2. **Responsive Layout**: Looks great on desktop, tablet, and mobile
3. **Dark Theme**: Modern dark mode using Pico CSS
4. **Code Highlighting**: Syntax highlighting for code blocks (Solarized Dark theme)
5. **Beautiful Typography**: Uses Roboto Slab font for headings
6. **Automatic Deployment**: Pushes to `main` branch automatically rebuild the site

### Navigation Support (For Future)

The layout includes conditional navigation that:
- **Hides** when you have only one page (current state)
- **Shows automatically** when you add more pages
- Uses Pico CSS styling for clean, responsive navigation

## Adding Additional Pages

When you want to add more pages beyond the README homepage:

### Step 1: Create a New Markdown File

Create a file at the repository root (e.g., `team-bio.md`):

```markdown
---
layout: default
title: "Team Biography"
---

# Our Team

Meet the members of PantheraTech...

[Your content here]
```

### Step 2: Commit and Push

```bash
git add team-bio.md
git commit -m "Add team biography page"
git push
```

### Step 3: Navigation Appears Automatically

Once you have 2+ pages, a navigation menu will appear at the top of every page with links to:
- Home (your README)
- All other pages (sorted by title)

### Supported Page Locations

You can create pages:
- At repository root: `team-bio.md`
- In any directory: `docs/strategy.md`

Just make sure each page has YAML front matter with `layout: default` and a `title`.

## Customization

### Changing Colors

Edit `.jekyll/_config.yml`:

```yaml
# Theme colors (azure, red, blue, pink, purple, etc.)
theme_color: azure

# Background theme
bg_color: dark  # or "light" or "auto"
```

Available theme colors: red, pink, fuchsia, purple, violet, indigo, blue, azure, cyan, jade, green, lime, yellow, amber, pumpkin, orange, sand, grey, zinc, slate.

### Custom Styling

Add your custom CSS to `.jekyll/assets/css/custom.css`:

```css
/* Example: Change heading color */
h1 {
  color: #ff6b35;
}

/* Example: Add team logo to header */
header {
  background-image: url('/docs/panthera_logo.png');
  background-size: contain;
  background-repeat: no-repeat;
  height: 100px;
}
```

### Updating Site Title

Edit `.jekyll/_config.yml`:

```yaml
title: "Your Team Name #12345"
description: "Your custom description"
```

## Creating a Template Repository

To create a reusable template for other FLL teams:

### Step 1: Create New Repository

1. On GitHub, create a new repository: `fll-team-website-template`
2. Clone it to your computer

### Step 2: Copy Files

Copy these files/directories from your current repo:
- `.jekyll/` (entire directory)
- `.github/workflows/` (both workflow files)
- `index.md`
- `.gitignore`
- `LICENSE`

Create empty directories with `.gitkeep` files:
- `block/.gitkeep`
- `docs/.gitkeep`
- `docs/plans/.gitkeep`

### Step 3: Create Template README

Create `README.md` in the template with placeholders:

```markdown
# Team [TEAM_NAME] #[TEAM_NUMBER]

> **Note**: This is a template repository. Replace all `[PLACEHOLDERS]` with your team's information.

## FIRST LEGO League Challenge [SEASON] - [CHALLENGE_NAME]

### Robot Game

#### Robot Design
![Robot Design](/docs/RobotDesign.jpeg)
![Robot](/docs/Robot.jpeg)

**About our robot**: [Describe your robot design here]

#### Codebase
Our code is located in the [`/block`](/block) folder.

Main program: [YourProgram.llsp3](/block/YourProgram.llsp3)

**Program visualization**:
![Program Flow](/block/YourProgram.svg)

### Mission Plans
[Add your mission strategy here]

### Innovation Project
![Innovation Project](/docs/InnovationProject.jpeg)

**Project description**: [Describe your innovation project]

### Competition Results

#### [Competition Name] - [Date]
**Location**: [City, State]

**Awards**:
- [List awards here]

**Robot Game Scores**:
- High Score: [XXX]
- Match 1: [XXX]
- Match 2: [XXX]
- Match 3: [XXX]

---

## Using This Template

1. Click "Use this template" button on GitHub
2. Name your repository (e.g., `73461-2025`)
3. Replace all `[PLACEHOLDERS]` in README.md with your team info
4. Add your LEGO code files to `/block` directory
5. Add your images to `/docs` directory
6. Update `.jekyll/_config.yml`:
   - Change `title` to your team name
   - Change `baseurl` to your repository name
   - Change `description` to your season/challenge
7. Enable GitHub Pages: Settings → Pages → Source: GitHub Actions
8. Commit and push changes
9. Your site will be available at `https://[username].github.io/[repo-name]/`
```

### Step 4: Create Setup Guide

Create `TEMPLATE_SETUP.md`:

```markdown
# FLL Team Website Template Setup Guide

## Quick Start

1. Click "Use this template" → "Create a new repository"
2. Name it after your team/season (e.g., `73461-2025`)
3. Clone to your computer
4. Follow customization steps below

## Customization Checklist

- [ ] Update `README.md`: Replace all `[PLACEHOLDERS]`
- [ ] Update `.jekyll/_config.yml`: Change title, baseurl, description
- [ ] Add code files to `/block/` directory
- [ ] Add images to `/docs/` directory
- [ ] Enable GitHub Pages in Settings
- [ ] Commit and push
- [ ] Visit your site!

## Support

For issues with the template, open an issue in the template repository.
```

### Step 5: Mark as Template

1. Go to repository **Settings** → **General**
2. Under "Template repository", check the box
3. Add description: "Template for FIRST LEGO League team websites with Jekyll and GitHub Pages"
4. Save

### Step 6: Share

Your template is now available at:
```
https://github.com/[your-username]/fll-team-website-template
```

Other teams can click "Use this template" to create their own site!

## Troubleshooting

### Build Fails

**Check GitHub Actions logs:**
1. Go to **Actions** tab
2. Click on failed workflow
3. Read error messages

**Common issues:**
- `baseurl` doesn't match repository name
- Missing Gemfile dependencies (should auto-install)
- Invalid YAML front matter in markdown files

### Images Not Showing

**Check image paths in README:**
- Use absolute paths: `/docs/image.jpg`
- Or use relative URL filter: `{{ '/docs/image.jpg' | relative_url }}`

**Verify files exist:**
```bash
ls docs/
```

### Navigation Not Appearing

Navigation only appears when you have **2 or more pages**.

**Verify pages have:**
- YAML front matter with `layout: default`
- `title` field in front matter

### Site Not Updating

**Check deployment:**
1. Actions tab → Latest workflow
2. Verify it completed successfully
3. Wait 1-2 minutes for CDN to update
4. Hard refresh browser (Cmd+Shift+R or Ctrl+F5)

**Clear browser cache:**
- Chrome/Edge: Cmd/Ctrl + Shift + Delete
- Safari: Cmd + Option + E

### Local Server Issues

**Bundle install fails:**
```bash
# Update bundler
gem update bundler

# Try again
cd .jekyll
bundle install
```

**Server won't start:**
```bash
# Check Ruby version
ruby --version  # Should be 2.7 or higher

# Reinstall dependencies
cd .jekyll
rm -rf vendor/
bundle install
```

## Architecture Details

### How It Works

1. **index.md** at root uses `{% include_relative README.md %}` to pull in README content
2. **Jekyll builds from root** with `--source ../` relative to `.jekyll/`
3. **Config in `.jekyll/`** keeps all Jekyll files organized in one place
4. **GitHub Actions** handles build and deployment automatically
5. **Assets served** from `.jekyll/assets/` with proper relative URLs

### Build Process

```
1. Push to main branch
   ↓
2. GitHub Actions triggered
   ↓
3. Checkout repository
   ↓
4. Setup Ruby & Bundler
   ↓
5. Install Jekyll dependencies
   ↓
6. Build site from root using .jekyll/_config.yml
   ↓
7. Generate _site/ directory
   ↓
8. Upload to GitHub Pages
   ↓
9. Deploy to https://[user].github.io/[repo]/
```

### Directory Layout During Build

```
Working Directory: .jekyll/
Source Directory: ../ (repository root)
Config File: _config.yml (in .jekyll/)
Output Directory: ../_site (at repository root)
Layouts: .jekyll/_layouts/
Assets: .jekyll/assets/
```

## Resources

### Documentation

- [Jekyll Documentation](https://jekyllrb.com/docs/)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [Pico CSS Documentation](https://picocss.com/docs)
- [Liquid Template Language](https://shopify.github.io/liquid/)

### Useful Commands

```bash
# Build site locally
cd .jekyll && bundle exec jekyll build --source ../ --config _config.yml

# Serve site locally
cd .jekyll && bundle exec jekyll serve --source ../ --config _config.yml --baseurl ""

# Check for errors
cd .jekyll && bundle exec jekyll doctor

# Update dependencies
cd .jekyll && bundle update
```

### Theme Customization

The site uses [Pico CSS](https://picocss.com/) - a minimal, classless CSS framework:
- No CSS classes needed in your markdown
- Semantic HTML automatically styled
- Dark/light themes built-in
- Fully responsive
- Accessibility-friendly

## Support

### Getting Help

1. **Check this documentation** first
2. **Review GitHub Actions logs** for build errors
3. **Test locally** to isolate issues
4. **Check Jekyll docs** at jekyllrb.com
5. **Open an issue** in your repository for team-specific problems

### Reporting Issues

When reporting issues, include:
- Error messages from GitHub Actions
- Local build output (if testing locally)
- Browser console errors (F12 → Console)
- Steps to reproduce

---

**Last Updated**: 2025-12-19
**Jekyll Version**: 4.3
**Pico CSS Version**: 2.0
**Theme**: Based on "quick" theme, adapted for FLL teams
