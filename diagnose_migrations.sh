#!/bin/bash

echo "=== Diagnosing Migration Issues ==="
echo

echo "1. Checking paragraph creation:"
drush sqlq "SELECT type, COUNT(*) as count FROM paragraphs_item_field_data GROUP BY type" 2>/dev/null || \
drush sqlq "SELECT type, COUNT(*) as count FROM paragraph__field_csgov_p_title GROUP BY type LIMIT 1; SELECT 'Total paragraphs:', COUNT(*) FROM paragraphs_item_field_data" 2>/dev/null || \
echo "Could not query paragraphs directly, trying entity count..."

echo
echo "2. Checking guide nodes created:"
drush sqlq "SELECT type, COUNT(*) as count FROM node_field_data WHERE type LIKE 'csgov_guide%' GROUP BY type"

echo
echo "3. Checking paragraph UUIDs in database:"
drush sqlq "SELECT uuid, type FROM paragraphs_item_field_data LIMIT 5"

echo
echo "4. Checking guide content_components field:"
drush sqlq "SELECT entity_id, field_csgov_content_components_target_id, field_csgov_content_components_target_revision_id FROM node__field_csgov_content_components LIMIT 5"

echo
echo "5. Checking guide_overview guide_items field:"
drush sqlq "SELECT entity_id, field_csgov_guide_items_target_id FROM node__field_csgov_guide_items LIMIT 5"

echo
echo "6. Migration status:"
drush migrate:status --group=csgov_guides --fields=id,status,imported,unprocessed,last-imported

echo
echo "7. Sample paragraph UUID from data file:"
head -20 modules/csgov_guides/data/paragraph_csgov_content.json | grep uuid

echo
echo "8. Sample guide with components field:"
head -30 modules/csgov_guides/data/node_csgov_guide.json | grep -A 2 field_csgov_content_components

