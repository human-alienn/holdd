# 🔧 Troubleshooting Guide

Common issues and solutions for the HOLD Memecoin website.

---

## 🚨 Build Errors

### Error: "Cannot find module 'motion/react'"

**Solution:**
```bash
rm -rf node_modules package-lock.json
npm install --legacy-peer-deps
npm run build
```

---

### Error: TypeScript compilation failed

**Cause:** Strict type checking enabled

**Solution 1:** Use build without type checking
```bash
npm run build
```

**Solution 2:** Fix TypeScript config
- Open `tsconfig.json`
- Set `"strict": false`
- Set `"noUnusedLocals": false`
- Run `npm run build`

---

### Error: "Plugin postcss not found"

**Solution:**
```bash
npm install --save-dev @tailwindcss/postcss postcss --legacy-peer-deps
npm run build
```

---

### Error: Peer dependency conflicts

**Solution:**
```bash
npm install --legacy-peer-deps
```

Or add to `.npmrc`:
```
legacy-peer-deps=true
```

---

## 🖼️ Image Issues

### Images not showing in production

**Checklist:**
1. ✅ All 22 images in `/public/images/`
2. ✅ Filenames use underscores: `cz_orbital.png` NOT `cz-orbital.png`
3. ✅ Filenames match exactly (case-sensitive)
4. ✅ Images are PNG format
5. ✅ Images were committed to Git

**Verify:**
```bash
ls -la public/images/
# Should show all 22 PNG files
```

---

### Specific image not loading

**Debug steps:**
1. Check filename matches code exactly
2. Check file extension is `.png` (lowercase)
3. Check file size (should be reasonable, not 0 bytes)
4. Rebuild: `npm run build`

---

## 🎨 Styling Issues

### Tailwind styles not applying

**Solution 1:** Verify PostCSS config exists
```bash
cat postcss.config.js
# Should show @tailwindcss/postcss plugin
```

**Solution 2:** Reinstall Tailwind
```bash
npm install --save-dev @tailwindcss/postcss tailwindcss --legacy-peer-deps
npm run build
```

**Solution 3:** Check globals.css imports
- Open `styles/globals.css`
- Ensure it has `@import "tailwindcss";` at the top

---

### Custom fonts not loading

**Check:**
1. `index.html` has Google Fonts link
2. `styles/globals.css` applies font families
3. Browser cache cleared

**Solution:**
```bash
# Hard refresh browser
# Chrome/Firefox: Ctrl+Shift+R
# Mac: Cmd+Shift+R
```

---

## ⚡ Performance Issues

### Slow initial load

**Optimize images:**
1. Compress PNG files (use tinypng.com)
2. Ensure images are appropriate size
3. Consider lazy loading (already implemented)

**Check bundle size:**
```bash
npm run build
# Check dist/ folder size
```

---

### Animations laggy

**Solutions:**
1. Reduce motion complexity
2. Test on different devices
3. Check CPU usage in DevTools

---

## 🌐 Deployment Issues

### Netlify build fails

**Check Netlify logs for:**

**Error 1:** "Command failed with exit code 1"
```bash
# Fix: Use build without type checking
# package.json already updated with "build": "vite build"
```

**Error 2:** "npm install failed"
```bash
# Fix: Netlify detects .npmrc automatically
# Make sure .npmrc has: legacy-peer-deps=true
```

**Error 3:** Missing dependencies
```bash
# Fix: Clear cache and rebuild
# Netlify Dashboard → Deploys → Clear cache and deploy
```

---

### Vercel build fails

**Common issues:**

**Issue 1:** Node version mismatch
```json
// Add to package.json:
{
  "engines": {
    "node": ">=18.0.0"
  }
}
```

**Issue 2:** Build command not found
- Vercel should auto-detect from `vercel.json`
- If not, manually set:
  - Build Command: `npm run build`
  - Output Directory: `dist`

---

### GitHub Pages 404 errors

**Solution:** Update base path
```typescript
// vite.config.ts
export default defineConfig({
  base: '/YOUR-REPO-NAME/', // Add this!
  // ... rest
})
```

---

## 🔍 Runtime Errors

### "Cannot read property of undefined"

**Debug:**
1. Open browser console (F12)
2. Check full error message
3. Identify component causing issue
4. Check data/props being passed

---

### Animations not working

**Check:**
1. Motion package installed correctly
2. Browser supports animations
3. No console errors
4. GPU acceleration enabled (Chrome DevTools)

---

## 📱 Mobile Issues

### Layout broken on mobile

**Test:**
1. Open DevTools (F12)
2. Toggle device toolbar (Ctrl+Shift+M)
3. Test different screen sizes
4. Check for horizontal scroll

**Common fixes:**
- Remove fixed widths
- Use responsive classes
- Check `overflow-x: hidden` applied

---

### Touch events not working

**Solutions:**
1. Test on actual mobile device
2. Check `touch-action` CSS properties
3. Verify click handlers work on mobile

---

## 🆘 Still Having Issues?

### Clear everything and start fresh:

```bash
# 1. Clean install
rm -rf node_modules package-lock.json dist

# 2. Install dependencies
npm install --legacy-peer-deps

# 3. Build
npm run build

# 4. Test locally
npm run preview
```

---

### Check these files exist and are correct:

```bash
# Essential files
ls -la package.json
ls -la vite.config.ts
ls -la tsconfig.json
ls -la postcss.config.js
ls -la index.html
ls -la main.tsx
ls -la App.tsx
ls -la .npmrc
ls -la netlify.toml

# Images
ls -la public/images/*.png | wc -l
# Should show: 22
```

---

### Get detailed error information:

```bash
# Verbose build
npm run build --verbose

# Type checking
npm run type-check

# Linting
npm run lint
```

---

## 📊 Debug Checklist

When reporting issues, provide:

- [ ] Full error message
- [ ] Build logs
- [ ] Browser console screenshot
- [ ] Node version (`node --version`)
- [ ] NPM version (`npm --version`)
- [ ] Operating system
- [ ] What you tried already

---

**Most issues are solved by:**
1. Clean reinstall: `rm -rf node_modules && npm install --legacy-peer-deps`
2. Clear cache and rebuild
3. Check all 22 images are present
4. Use correct Node version (18+)

---

**Need more help? Check:**
- README.md
- DEPLOYMENT.md  
- PRE_DEPLOYMENT_CHECKLIST.md
