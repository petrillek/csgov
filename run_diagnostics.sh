#!/bin/bash
# Please run this script and share the output

echo "=== Quick Diagnostics ==="
echo

echo "1. How many entities were created?"
drush sqlq "SELECT type, COUNT(*) as count FROM node_field_data WHERE type LIKE 'csgov_guide%' GROUP BY type"

echo
echo "2. Are content_components populated?"
drush sqlq "SELECT COUNT(DISTINCT entity_id) as guides_with_components FROM node__field_csgov_content_components"
drush sqlq "SELECT COUNT(*) as total_guides FROM node_field_data WHERE type='csgov_guide'"

echo
echo "3. Are guide_items populated?"
drush sqlq "SELECT COUNT(DISTINCT entity_id) as overviews_with_items FROM node__field_csgov_guide_items"
drush sqlq "SELECT COUNT(*) as total_overviews FROM node_field_data WHERE type='csgov_guide_overview'"

echo
echo "4. Check one specific guide:"
drush sqlq "SELECT n.nid, n.title, n.uuid FROM node_field_data n WHERE n.type='csgov_guide' AND n.uuid='a1007000-0001-0000-0000-000000000001'"

echo
echo "5. Does this guide have components?"
drush sqlq "SELECT field_csgov_content_components_target_id FROM node__field_csgov_content_components WHERE entity_id IN (SELECT nid FROM node_field_data WHERE uuid='a1007000-0001-0000-0000-000000000001')"

echo
echo "6. Check migrate mapping:"
drush sqlq "SELECT COUNT(*) FROM migrate_map_csgov_migrate_paragraph_csgov_content"
drush sqlq "SELECT sourceid1, destid1 FROM migrate_map_csgov_migrate_paragraph_csgov_content WHERE sourceid1='a1007001-0001-0000-0000-000000000001'"

echo
echo "7. Does the paragraph exist with that UUID?"
drush sqlq "SELECT id, uuid, type FROM paragraphs_item_field_data WHERE uuid='a1007001-0001-0000-0000-000000000001'"
