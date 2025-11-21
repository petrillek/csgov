#!/bin/bash

echo "Checking migration execution issues..."
echo

# Check if Drush is available
if ! command -v drush &> /dev/null; then
    echo "❌ Drush not found in PATH"
    echo "Please run this from your Drupal root or ensure drush is available"
    exit 1
fi

echo "1. Current migration statuses:"
drush migrate:status --group=csgov_guides --fields=id,status,total,imported 2>&1 | grep -E "(csgov_migrate_node|Status|Id)"

echo
echo "2. Checking for stuck migrations:"
drush migrate:status --group=csgov_guides --fields=id,status 2>&1 | grep -i "importing"

echo
echo "3. Counting actual content created:"
echo "   Guide overviews in DB:"
drush sqlq "SELECT COUNT(*) FROM node_field_data WHERE type='csgov_guide_overview'" 2>/dev/null || echo "   (query failed)"

echo "   Guide steps in DB:"
drush sqlq "SELECT COUNT(*) FROM node_field_data WHERE type='csgov_guide'" 2>/dev/null || echo "   (query failed)"

echo "   Paragraphs in DB:"
drush sqlq "SELECT COUNT(*) FROM paragraphs_item_field_data" 2>/dev/null || echo "   (query failed)"

echo
echo "4. Checking if overviews have guide_items populated:"
drush sqlq "SELECT COUNT(*) as overviews_with_items FROM node__field_csgov_guide_items" 2>/dev/null || echo "   (query failed)"

echo
echo "5. Checking if guides have content_components populated:"
drush sqlq "SELECT COUNT(*) as guides_with_components FROM node__field_csgov_content_components" 2>/dev/null || echo "   (query failed)"

