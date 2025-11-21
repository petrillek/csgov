#!/bin/bash

echo "=== Diagnosing Entity Reference Issues ==="
echo

echo "1. Checking if entities were created with correct UUIDs..."
echo
echo "   Paragraph UUIDs from data file (first 3):"
head -20 modules/csgov_guides/data/paragraph_csgov_content.json | grep '"uuid"' | head -3

echo
echo "   Paragraph UUIDs in database (first 3):"
drush sqlq "SELECT uuid, type FROM paragraphs_item_field_data LIMIT 3" 2>/dev/null || echo "   (query failed - check table name)"

echo
echo "2. Checking guide node UUIDs..."
echo
echo "   Guide UUIDs from data file (first 2):"
head -20 modules/csgov_guides/data/node_csgov_guide.json | grep '"uuid"' | head -2

echo
echo "   Guide UUIDs in database (first 2):"
drush sqlq "SELECT uuid, title FROM node_field_data WHERE type='csgov_guide' LIMIT 2" 2>/dev/null || echo "   (query failed)"

echo
echo "3. Checking if content_components field is populated..."
echo
echo "   Total guides:"
drush sqlq "SELECT COUNT(*) as total FROM node_field_data WHERE type='csgov_guide'" 2>/dev/null || echo "   (query failed)"

echo
echo "   Guides WITH components:"
drush sqlq "SELECT COUNT(DISTINCT entity_id) as with_components FROM node__field_csgov_content_components" 2>/dev/null || echo "   (query failed)"

echo
echo "   Sample guide with components:"
drush sqlq "SELECT n.nid, n.title, COUNT(c.field_csgov_content_components_target_id) as component_count FROM node_field_data n LEFT JOIN node__field_csgov_content_components c ON n.nid = c.entity_id WHERE n.type='csgov_guide' GROUP BY n.nid, n.title LIMIT 5" 2>/dev/null || echo "   (query failed)"

echo
echo "4. Checking if guide_items field is populated..."
echo
echo "   Total overviews:"
drush sqlq "SELECT COUNT(*) as total FROM node_field_data WHERE type='csgov_guide_overview'" 2>/dev/null || echo "   (query failed)"

echo
echo "   Overviews WITH guide items:"
drush sqlq "SELECT COUNT(DISTINCT entity_id) as with_items FROM node__field_csgov_guide_items" 2>/dev/null || echo "   (query failed)"

echo
echo "5. Checking migration mapping tables..."
echo
echo "   Paragraphs in migrate_map_csgov_migrate_paragraph_csgov_content:"
drush sqlq "SELECT COUNT(*) as count FROM migrate_map_csgov_migrate_paragraph_csgov_content" 2>/dev/null || echo "   (table doesn't exist or query failed)"

echo
echo "   Sample paragraph mapping (source UUID → destination ID):"
drush sqlq "SELECT sourceid1 as source_uuid, destid1 as dest_id FROM migrate_map_csgov_migrate_paragraph_csgov_content LIMIT 3" 2>/dev/null || echo "   (query failed)"

echo
echo "6. Testing if lookup would work..."
echo "   First guide components field value:"
python3 << 'PYTHON'
import json
with open('modules/csgov_guides/data/node_csgov_guide.json') as f:
    guide = json.load(f)[0]
print(f"   Components: {guide['field_csgov_content_components']}")
uuids = [u.strip() for u in guide['field_csgov_content_components'].split(',')]
print(f"   First UUID: {uuids[0]}")
PYTHON

