#!/bin/bash

echo "🚀 HOLD Memecoin Website - Deployment Script"
echo "=============================================="
echo ""

# Check if images exist
if [ ! -d "public/images" ] || [ -z "$(ls -A public/images 2>/dev/null | grep -v README)" ]; then
    echo "⚠️  WARNING: No images found in /public/images/"
    echo "Please add all 22 required images before deploying."
    echo ""
    read -p "Continue anyway? (y/N): " continue
    if [[ ! $continue =~ ^[Yy]$ ]]; then
        echo "Deployment cancelled."
        exit 1
    fi
fi

echo ""
echo "📦 Installing dependencies..."
npm install --legacy-peer-deps

if [ $? -ne 0 ]; then
    echo "❌ Failed to install dependencies"
    exit 1
fi

echo ""
echo "🔨 Building project..."
npm run build

if [ $? -ne 0 ]; then
    echo "❌ Build failed"
    exit 1
fi

echo ""
echo "✅ Build successful!"
echo ""
echo "📤 Ready to deploy!"
echo ""
echo "Choose deployment method:"
echo "  1) Netlify (recommended)"
echo "  2) Vercel"
echo "  3) Test locally (preview build)"
echo ""
read -p "Enter choice (1-3): " choice

case $choice in
    1)
        echo ""
        echo "Deploying to Netlify..."
        if command -v netlify &> /dev/null; then
            netlify deploy --prod
        else
            echo "⚠️  Netlify CLI not found. Installing..."
            npm install -g netlify-cli
            netlify deploy --prod
        fi
        ;;
    2)
        echo ""
        echo "Deploying to Vercel..."
        if command -v vercel &> /dev/null; then
            vercel --prod
        else
            echo "⚠️  Vercel CLI not found. Installing..."
            npm install -g vercel
            vercel --prod
        fi
        ;;
    3)
        echo ""
        echo "Starting preview server..."
        npm run preview
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

echo ""
echo "🎉 Done!"
