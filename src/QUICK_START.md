# ⚡ Quick Start Guide

## 🎯 Deploy in 5 Minutes

### Step 1: Add Images (REQUIRED)
```bash
# Add all 22 images to public/images/
# See public/images/README.md for the full list
```

### Step 2: Push to GitHub
```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPO.git
git push -u origin main
```

### Step 3: Deploy to Netlify
1. Go to [app.netlify.com](https://app.netlify.com)
2. Click "Add new site" → "Import an existing project"
3. Select GitHub → Choose your repository
4. Click "Deploy site"
5. **Done!** 🎉

---

## 🛠️ Local Development

```bash
# Install dependencies
npm install --legacy-peer-deps

# Start dev server
npm run dev

# Open http://localhost:5173
```

---

## 📝 Common Commands

```bash
# Development
npm run dev              # Start dev server

# Production
npm run build            # Build for production
npm run preview          # Preview production build

# Type checking (optional)
npm run type-check       # Check TypeScript types

# Linting (optional)
npm run lint             # Run ESLint
```

---

## 🚨 Quick Fixes

### Build errors?
```bash
rm -rf node_modules package-lock.json
npm install --legacy-peer-deps
npm run build
```

### Images not loading?
- Check all 22 images are in `/public/images/`
- Verify filenames use underscores: `cz_orbital.png`
- Check filenames match exactly (case-sensitive)

### Styles not working?
- Make sure `postcss.config.js` exists
- Rebuild: `npm run build`

---

## 📚 Full Documentation

- **Deployment Guide**: See `DEPLOYMENT.md`
- **Full README**: See `README.md`
- **Image List**: See `public/images/README.md`

---

**That's it! Your HOLD website is ready to launch! 🚀**
