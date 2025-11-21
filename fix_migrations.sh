#!/bin/bash
set -e

echo "=== Fixing CSGOV Guide Migrations ==="
echo

# Step 1: Reset all stuck migration statuses
echo "1. Resetting stuck migration statuses..."
drush migrate:reset-status --all

# Step 2: Rollback all guide migrations
echo
echo "2. Rolling back guide migrations..."
drush migrate:rollback --group=csgov_guides || true

# Step 3: Clear all caches
echo
echo "3. Clearing caches..."
drush cache:rebuild

# Step 4: Show migration list before import
echo
echo "4. Available migrations:"
drush migrate:status --group=csgov_guides --format=table

# Step 5: Import in correct order
echo
echo "5. Importing migrations..."
echo "   Phase 1: Paragraphs (all types)"
drush migrate:import csgov_migrate_paragraph_csgov_accordion_item --no-interaction
drush migrate:import csgov_migrate_paragraph_csgov_accordion --no-interaction
drush migrate:import csgov_migrate_paragraph_csgov_attachments --no-interaction
drush migrate:import csgov_migrate_paragraph_csgov_content --no-interaction
drush migrate:import csgov_migrate_paragraph_csgov_gallery --no-interaction
drush migrate:import csgov_migrate_paragraph_csgov_image --no-interaction
drush migrate:import csgov_migrate_paragraph_csgov_image_text --no-interaction
drush migrate:import csgov_migrate_paragraph_csgov_infopanel --no-interaction
drush migrate:import csgov_migrate_paragraph_csgov_node_list --no-interaction
drush migrate:import csgov_migrate_paragraph_csgov_tile_item --no-interaction
drush migrate:import csgov_migrate_paragraph_csgov_tiles --no-interaction

echo "   Phase 1b: Special paragraphs (editor guides, component guides, shared)"
drush migrate:import csgov_migrate_paragraph_csgov_accordion_editor_guide --no-interaction
drush migrate:import csgov_migrate_paragraph_csgov_accordion_item_editor_guide --no-interaction
drush migrate:import csgov_migrate_paragraph_csgov_content_editor_guide --no-interaction
drush migrate:import csgov_migrate_paragraph_csgov_image_editor_guide --no-interaction
drush migrate:import csgov_migrate_paragraph_csgov_infopanel_editor_guide --no-interaction
drush migrate:import csgov_migrate_paragraph_csgov_component_guides --no-interaction
drush migrate:import csgov_migrate_paragraph_shared_guides_accordion_items --no-interaction
drush migrate:import csgov_migrate_paragraph_shared_guides_accordion --no-interaction
drush migrate:import csgov_migrate_paragraph_shared_guides_content --no-interaction
drush migrate:import csgov_migrate_paragraph_shared_guides_images --no-interaction

echo "   Phase 2: Guide overviews (without items for now)"
drush migrate:import csgov_migrate_node_csgov_guide_overview --no-interaction

echo "   Phase 3: Guide steps (with parent references)"
drush migrate:import csgov_migrate_node_csgov_guide --no-interaction

echo "   Phase 3b: Special guide nodes (shared guides, component guides)"
drush migrate:import csgov_migrate_node_shared_guides --no-interaction || echo "     (skipped - migration not found)"
drush migrate:import csgov_migrate_node_csgov_component_guides --no-interaction || echo "     (skipped - migration not found)"

echo "   Phase 4: Update overviews with guide items"
drush migrate:import csgov_migrate_node_csgov_guide_overview --update --no-interaction

# Step 6: Show final status
echo
echo "6. Final migration status:"
drush migrate:status --group=csgov_guides --format=table

echo
echo "=== Migration Complete ==="
