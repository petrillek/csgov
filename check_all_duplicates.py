#!/usr/bin/env python3
import json
import os
from collections import defaultdict

data_dir = "modules/csgov_guides/data"

# Get all JSON files
all_files = [f for f in os.listdir(data_dir) if f.endswith('.json')]

uuid_locations = defaultdict(list)

# Collect all UUIDs and their locations
for filename in all_files:
    filepath = os.path.join(data_dir, filename)

    with open(filepath, 'r') as f:
        data = json.load(f)

    for item in data:
        uuid = item.get('uuid')
        if uuid:
            uuid_locations[uuid].append(filename)

# Find duplicates
duplicates = {uuid: files for uuid, files in uuid_locations.items() if len(files) > 1}

if duplicates:
    print(f"❌ Found {len(duplicates)} duplicate UUIDs across ALL files:\n")
    for uuid, files in sorted(duplicates.items()):
        print(f"  {uuid}")
        for f in files:
            print(f"    - {f}")
        print()
else:
    print("✅ No duplicate UUIDs found! All entities are unique.\n")

# Show summary
total_uuids = len(uuid_locations)
total_entries = sum(len(files) for files in uuid_locations.values())

print("Summary:")
print(f"  Total JSON files: {len(all_files)}")
print(f"  Total unique entities: {total_uuids}")
print(f"  Total entity entries: {total_entries}")
print()

# Categorize files
node_files = [f for f in all_files if f.startswith('node_')]
paragraph_files = [f for f in all_files if f.startswith('paragraph_')]

print(f"By category:")
print(f"  Node files: {len(node_files)}")
print(f"  Paragraph files: {len(paragraph_files)}")
