#!/bin/bash
# Check migration mapping tables

echo "=== Checking Migration Map Tables ==="
echo

echo "1. Paragraph content migration map:"
drush sqlq "SELECT COUNT(*) as total_mapped FROM migrate_map_csgov_migrate_paragraph_csgov_content"
echo "   Sample mappings:"
drush sqlq "SELECT sourceid1 as source_uuid, destid1 as paragraph_id FROM migrate_map_csgov_migrate_paragraph_csgov_content LIMIT 3"

echo
echo "2. Guide migration map:"
drush sqlq "SELECT COUNT(*) as total_mapped FROM migrate_map_csgov_migrate_node_csgov_guide"
echo "   Sample mappings:"
drush sqlq "SELECT sourceid1 as source_uuid, destid1 as node_id FROM migrate_map_csgov_migrate_node_csgov_guide LIMIT 3"

echo
echo "3. Guide overview migration map:"
drush sqlq "SELECT COUNT(*) as total_mapped FROM migrate_map_csgov_migrate_node_csgov_guide_overview"
echo "   Sample mappings:"
drush sqlq "SELECT sourceid1 as source_uuid, destid1 as node_id FROM migrate_map_csgov_migrate_node_csgov_guide_overview LIMIT 3"

echo
echo "4. Testing a specific lookup:"
echo "   Looking for paragraph UUID: a1007001-0001-0000-0000-000000000001"
drush sqlq "SELECT 'In migrate_map:', sourceid1, destid1 FROM migrate_map_csgov_migrate_paragraph_csgov_content WHERE sourceid1='a1007001-0001-0000-0000-000000000001'"
echo "   Does this paragraph exist?"
drush sqlq "SELECT 'In paragraphs table:', id, uuid FROM paragraphs_item_field_data WHERE uuid='a1007001-0001-0000-0000-000000000001'"

echo
echo "5. Check if ANY guide has components populated:"
drush sqlq "SELECT n.nid, n.title, COUNT(c.delta) as component_count FROM node_field_data n LEFT JOIN node__field_csgov_content_components c ON n.nid = c.entity_id WHERE n.type='csgov_guide' GROUP BY n.nid, n.title HAVING component_count > 0 LIMIT 3"

echo
echo "6. Check if ANY overview has guide_items populated:"
drush sqlq "SELECT n.nid, n.title, COUNT(g.delta) as item_count FROM node_field_data n LEFT JOIN node__field_csgov_guide_items g ON n.nid = g.entity_id WHERE n.type='csgov_guide_overview' GROUP BY n.nid, n.title HAVING item_count > 0 LIMIT 3"
