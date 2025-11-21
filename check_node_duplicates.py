#!/usr/bin/env python3
import json
import os
from collections import defaultdict

data_dir = "modules/csgov_guides/data"

# Node files to check
node_files = [
    "node_csgov_guide.json",
    "node_csgov_guide_overview.json",
    "node_csgov_component_guides.json",
    "node_shared_guides.json"
]

uuid_locations = defaultdict(list)

# Collect all UUIDs and their locations
for filename in node_files:
    filepath = os.path.join(data_dir, filename)
    if not os.path.exists(filepath):
        print(f"⚠️  File not found: {filename}")
        continue

    with open(filepath, 'r') as f:
        data = json.load(f)

    for item in data:
        uuid = item.get('uuid')
        if uuid:
            uuid_locations[uuid].append(filename)

# Find duplicates
duplicates = {uuid: files for uuid, files in uuid_locations.items() if len(files) > 1}

if duplicates:
    print(f"❌ Found {len(duplicates)} duplicate node UUIDs:\n")
    for uuid, files in sorted(duplicates.items()):
        print(f"  {uuid}")
        for f in files:
            print(f"    - {f}")
        print()
else:
    print("✅ No duplicate UUIDs found in node files!\n")

# Show summary
total_uuids = len(uuid_locations)
total_entries = sum(len(files) for files in uuid_locations.values())

print("Summary:")
print(f"  Total node files: {len(node_files)}")
print(f"  Total unique nodes: {total_uuids}")
print(f"  Total node entries: {total_entries}")
print()

# Show breakdown by file
print("By file:")
for filename in node_files:
    filepath = os.path.join(data_dir, filename)
    if os.path.exists(filepath):
        with open(filepath, 'r') as f:
            data = json.load(f)
        print(f"  {filename}: {len(data)} nodes")
