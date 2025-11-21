#!/usr/bin/env python3
import json
import os

data_dir = "modules/csgov_guides/data"

# Files to check
component_guides_file = os.path.join(data_dir, "node_csgov_component_guides.json")
main_guide_file = os.path.join(data_dir, "node_csgov_guide.json")
shared_guides_file = os.path.join(data_dir, "node_shared_guides.json")

# Step 1: Collect UUIDs from special files (component_guides and shared_guides)
special_uuids = set()

print("Step 1: Collecting UUIDs from special files...")

if os.path.exists(component_guides_file):
    with open(component_guides_file, 'r') as f:
        component_guides = json.load(f)
    component_uuids = {item['uuid'] for item in component_guides}
    special_uuids.update(component_uuids)
    print(f"  - component_guides: {len(component_uuids)} UUIDs")

if os.path.exists(shared_guides_file):
    with open(shared_guides_file, 'r') as f:
        shared_guides = json.load(f)
    shared_uuids = {item['uuid'] for item in shared_guides}
    special_uuids.update(shared_uuids)
    print(f"  - shared_guides: {len(shared_uuids)} UUIDs")

print(f"\nTotal special UUIDs to remove: {len(special_uuids)}")

# Step 2: Remove those UUIDs from main guide file
print("\nStep 2: Removing special UUIDs from main guide file...")

with open(main_guide_file, 'r') as f:
    main_guides = json.load(f)

original_count = len(main_guides)
print(f"  Original count: {original_count}")

# Filter out items with UUIDs that exist in special files
filtered_guides = [item for item in main_guides if item['uuid'] not in special_uuids]

removed_count = original_count - len(filtered_guides)
print(f"  Removed: {removed_count}")
print(f"  Remaining: {len(filtered_guides)}")

# Step 3: Write back to file
with open(main_guide_file, 'w') as f:
    json.dump(filtered_guides, f, indent=2)

print(f"\n✅ Updated {main_guide_file}")
print(f"   {original_count} → {len(filtered_guides)} nodes")
