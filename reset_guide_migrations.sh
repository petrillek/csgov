#!/bin/bash
# Script to reset and rerun CSGOV guide migrations

echo "=== Resetting Guide Migrations ==="
echo

# Reset stuck migrations
echo "1. Resetting migration status..."
drush migrate:reset-status csgov_migrate_node_csgov_guide
drush migrate:reset-status csgov_migrate_node_csgov_guide_overview

# Rollback all guide migrations (in reverse order)
echo
echo "2. Rolling back existing migrations..."
drush migrate:rollback --group=csgov_guides --no-interaction

# Clear Drupal cache
echo
echo "3. Clearing cache..."
drush cache:rebuild

# Import migrations (they will run in dependency order)
echo
echo "4. Running migrations..."
drush migrate:import --group=csgov_guides --no-interaction

# Show status
echo
echo "5. Migration status:"
drush migrate:status --group=csgov_guides

echo
echo "=== Done ==="
