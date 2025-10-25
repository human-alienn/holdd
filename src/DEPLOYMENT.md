# 🚀 Deployment Guide - HOLD Memecoin Website

## ✅ Pre-Deployment Checklist

Before deploying, make sure:

1. ✅ All 22 images are in `/public/images/` folder
2. ✅ Code is committed to GitHub
3. ✅ No build errors locally

## 🌐 Deployment Options

### Option 1: Netlify (Recommended) ⭐

#### Deploy via Netlify Dashboard

1. **Push to GitHub**
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPO.git
   git push -u origin main
   ```

2. **Connect to Netlify**
   - Go to [app.netlify.com](https://app.netlify.com)
   - Click "Add new site" → "Import an existing project"
   - Choose "Deploy with GitHub"
   - Select your repository
   - Build settings will auto-detect from `netlify.toml`:
     - **Build command**: `npm install && npm run build`
     - **Publish directory**: `dist`
   - Click "Deploy site"

3. **Wait for deployment** (usually 2-3 minutes)

4. **Your site is live!** 🎉

#### Deploy via Netlify CLI

```bash
# Install Netlify CLI
npm install -g netlify-cli

# Login to Netlify
netlify login

# Build the project
npm run build

# Deploy
netlify deploy --prod
```

---

### Option 2: Vercel

#### Deploy via Vercel Dashboard

1. **Push to GitHub** (if not already done)
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPO.git
   git push -u origin main
   ```

2. **Connect to Vercel**
   - Go to [vercel.com](https://vercel.com)
   - Click "Add New Project"
   - Import your GitHub repository
   - Build settings will auto-detect from `vercel.json`
   - Click "Deploy"

3. **Your site is live!** 🎉

#### Deploy via Vercel CLI

```bash
# Install Vercel CLI
npm install -g vercel

# Login to Vercel
vercel login

# Deploy
vercel --prod
```

---

### Option 3: GitHub Pages

1. **Install gh-pages**
   ```bash
   npm install --save-dev gh-pages
   ```

2. **Update package.json** - Add these fields:
   ```json
   {
     "homepage": "https://YOUR-USERNAME.github.io/YOUR-REPO-NAME",
     "scripts": {
       "predeploy": "npm run build",
       "deploy": "gh-pages -d dist"
     }
   }
   ```

3. **Update vite.config.ts** - Add base path:
   ```typescript
   export default defineConfig({
     base: '/YOUR-REPO-NAME/',
     // ... rest of config
   })
   ```

4. **Deploy**
   ```bash
   npm run deploy
   ```

5. **Enable GitHub Pages**
   - Go to your repository settings
   - Navigate to "Pages"
   - Select branch: `gh-pages`
   - Click "Save"

---

## 🔧 Troubleshooting

### Build Fails

**Issue**: TypeScript errors during build

**Solution**:
```bash
# Use build without type checking
npm run build
```

**Issue**: Dependency conflicts

**Solution**:
```bash
# Clean install with legacy peer deps
rm -rf node_modules package-lock.json
npm install --legacy-peer-deps
npm run build
```

### Missing Images

**Issue**: Images not loading in production

**Solution**:
- Ensure all 22 images are in `/public/images/`
- Check that filenames match exactly (case-sensitive)
- Use underscore naming: `cz_orbital.png` not `cz-orbital.png`

### Tailwind Styles Not Working

**Issue**: Styles not applied in production

**Solution**:
- Make sure `postcss.config.js` exists
- Verify `@tailwindcss/postcss` is in devDependencies
- Rebuild:
  ```bash
  npm run build
  ```

---

## 📊 Build Verification

Before deploying, test the production build locally:

```bash
# Build for production
npm run build

# Preview production build
npm run preview
```

Open [http://localhost:4173](http://localhost:4173) to test.

---

## 🎯 Post-Deployment

After deployment, verify:

1. ✅ All images load correctly
2. ✅ Animations work smoothly
3. ✅ Mobile responsive design works
4. ✅ All sections scroll properly
5. ✅ No console errors

---

## 🔄 Updating the Site

After making changes:

```bash
# Commit changes
git add .
git commit -m "Your update message"
git push origin main
```

Netlify/Vercel will automatically rebuild and redeploy! 🚀

---

## 📝 Custom Domain (Optional)

### On Netlify

1. Go to "Domain settings"
2. Click "Add custom domain"
3. Follow the DNS configuration steps

### On Vercel

1. Go to "Settings" → "Domains"
2. Add your custom domain
3. Configure DNS as instructed

---

## 🆘 Need Help?

- **Netlify Docs**: [docs.netlify.com](https://docs.netlify.com)
- **Vercel Docs**: [vercel.com/docs](https://vercel.com/docs)
- **Vite Docs**: [vitejs.dev](https://vitejs.dev)

---

**Ready to deploy? Let's go! 🚀**
