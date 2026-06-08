#!/usr/bin/env bash
# ============================================
# Build-script: maakt een schone dist/ map
# klaar om naar public_html/ te uploaden.
# ============================================

set -e

PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"
DIST_DIR="$PROJECT_DIR/dist"

echo "🧹 Oude dist/ map opruimen..."
rm -rf "$DIST_DIR"
mkdir -p "$DIST_DIR"

echo "📄 HTML bestanden kopiëren..."
cp "$PROJECT_DIR"/*.html "$DIST_DIR/"

echo "🎨 CSS map kopiëren..."
cp -R "$PROJECT_DIR/css" "$DIST_DIR/"

echo "⚙️  JS map kopiëren..."
cp -R "$PROJECT_DIR/js" "$DIST_DIR/"

# Verwijder eventuele macOS systeembestanden
find "$DIST_DIR" -name ".DS_Store" -delete 2>/dev/null || true

echo ""
echo "✅ Klaar! De map dist/ staat klaar om te uploaden:"
echo "   $DIST_DIR"
echo ""
echo "📦 Inhoud:"
ls -la "$DIST_DIR"
echo ""
echo "👉 Upload de INHOUD van dist/ naar public_html/ van uw hosting."
