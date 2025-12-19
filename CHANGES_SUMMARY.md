# Jekyll Setup - Changes Summary & Manual Steps

## ✅ Issues Fixed

### Issue 1: Images Not Showing on GitHub Pages
**Problem:** Image paths had leading slashes (`/docs/image.jpg`) which don't work with GitHub Pages baseurl.

**Fix:** Updated README.md to use relative paths without leading slashes:
- Changed `/docs/RobotDesign.jpeg` → `docs/RobotDesign.jpeg`
- Changed `/docs/Robot.jpeg` → `docs/Robot.jpeg`
- Changed `/block/PantheraTech.svg` → `block/PantheraTech.svg`
- Changed `/docs/InnovationProject.jpeg` → `docs/InnovationProject.jpeg`

This works both on GitHub and GitHub Pages.

### Issue 2: Theme Not Switching with System Preference
**Problem:** Layout didn't properly respond to system theme changes when `bg_color: auto`.

**Fix:** Added JavaScript to `.jekyll/_layouts/default.html` that:
- Detects system color scheme preference (dark/light)
- Sets theme on page load
- Listens for system theme changes and updates automatically
- Uses `prefers-color-scheme` media query

Now your site will:
- Start with the correct theme based on system preference
- Automatically switch when you change system dark/light mode
- Update in real-time without page refresh

### Issue 3: Markdown Tables Not Rendering Properly
**Problem:** Tables in README.md weren't styled correctly.

**Fix:** Added comprehensive table styling to `.jekyll/assets/css/custom.css`:
- Proper borders and spacing
- Alternating row colors for readability
- Responsive design for mobile devices
- Uses Pico CSS variables for theme consistency
- Horizontal scrolling on small screens

## 📋 Manual Steps Required

### 1. Commit and Push Changes
```bash
# Navigate to your repository
cd "/Users/vmehta/Library/Mobile Documents/com~apple~CloudDocs/workspace/lego-spike-prime/73461-2025"

# Stage all changes
git add .

# Commit
git commit -m "Fix Jekyll site - images and theme

- Fixed image paths to work with GitHub Pages baseurl
- Updated layout to respect bg_color config setting
- Now using relative paths for all images

🤖 Generated with Claude Code
Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>"

# Push to GitHub
git push origin main
```

### 2. Monitor Deployment
1. Go to your repository on GitHub
2. Click **Actions** tab
3. Watch the "Build and Deploy Jekyll Site" workflow
4. Wait for green checkmark (usually 1-2 minutes)

### 3. Verify Your Site
Visit: **https://varunmehta.github.io/73461-2025/**

**Check that:**
- ✅ All images are now visible
- ✅ Theme respects system dark/light mode (auto)
- ✅ SVG program visualization shows
- ✅ All mission plan images display

### 4. Optional: Test Locally First
```bash
# Run the Docker-based local server
./serve-local.sh

# Visit http://localhost:4000/
# Verify images and theme work
```

## 🎨 Theme Customization

Your current config (`.jekyll/_config.yml`):
```yaml
theme_color: red       # Accent color (red, blue, azure, etc.)
bg_color: auto         # Background (dark, light, or auto)
```

**Available theme colors:**
red, pink, fuchsia, purple, violet, indigo, blue, azure, cyan, jade, green, lime, yellow, amber, pumpkin, orange, sand, grey, zinc, slate

**Background options:**
- `dark` - Always dark mode
- `light` - Always light mode
- `auto` - Follows system preference (recommended)

## 📁 Complete File Summary

### Files Created/Modified by Jekyll Setup

**Created:**
- `.jekyll/_config.yml` - Site configuration
- `.jekyll/Gemfile` - Ruby dependencies
- `.jekyll/_layouts/default.html` - Page layout template
- `.jekyll/assets/css/` - Styling files
- `.jekyll/assets/img/favicon.png` - Site icon
- `index.md` - Homepage (includes README)
- `.github/workflows/jekyll-build.yml` - Deployment workflow
- `serve-local.sh` - Local testing script
- `JEKYLL_SETUP.md` - Full documentation
- `CHANGES_SUMMARY.md` - This file

**Modified:**
- `.gitignore` - Added Jekyll exclusions
- `README.md` - Fixed image paths
- `.jekyll/_layouts/default.html` - Fixed theme setting

## 🚀 Next Steps After Deployment

### For This Repository (Current Team)
1. ✅ Verify site works at https://varunmehta.github.io/73461-2025/
2. Add more content to README as season progresses
3. Optional: Add additional pages for detailed content

### For Template Repository (Other Teams)
Follow the instructions in `JEKYLL_SETUP.md` section "Creating a Template Repository" to create a reusable template for other FLL teams.

## 🔧 Troubleshooting

### Images Still Not Showing
**Check the image files exist:**
```bash
ls docs/*.jpeg
ls docs/plans/*.png
ls block/*.svg
```

**Verify paths in README match actual file locations**

### Theme Not Changing
**Hard refresh your browser:**
- Chrome/Edge: `Cmd+Shift+R` (Mac) or `Ctrl+F5` (Windows)
- Safari: `Cmd+Option+E`, then reload

**Check your system dark/light mode setting** (when using `auto`)

### Deployment Failed
1. Check Actions tab for error messages
2. Verify `.jekyll/_config.yml` has correct `baseurl: "/73461-2025"`
3. Ensure GitHub Pages is set to "GitHub Actions" source

## 📖 Documentation

**Full documentation:** See `JEKYLL_SETUP.md` for:
- Local testing guide
- Adding new pages
- Advanced customization
- Template repository creation
- Complete troubleshooting guide

## ✨ What You Get

Your Jekyll site now includes:
- ✅ Beautiful single-page design from your README
- ✅ Responsive layout (works on all devices)
- ✅ Dark/light/auto theme support
- ✅ Code syntax highlighting
- ✅ Automatic deployment on push
- ✅ Custom navigation (appears when you add more pages)
- ✅ Professional typography and styling
- ✅ Fast loading from GitHub CDN

## 🎯 Quick Reference

**Local testing:**
```bash
./serve-local.sh
```

**Commit changes:**
```bash
git add .
git commit -m "Your message"
git push
```

**Live site:**
```
https://varunmehta.github.io/73461-2025/
```

**Change theme color:**
Edit `.jekyll/_config.yml`, change `theme_color` value, commit & push.

**Change background:**
Edit `.jekyll/_config.yml`, change `bg_color` to `dark`, `light`, or `auto`, commit & push.

---

**Setup Date:** 2025-12-19
**Generated by:** Claude Code (Sonnet 4.5)
