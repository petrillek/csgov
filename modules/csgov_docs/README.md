# CS Gov Documentation Module

This module provides comprehensive editor documentation and step-by-step guides for creating and managing content in the CS Gov Drupal distribution.

## What's Included

### Content Type Guides

Step-by-step guides for creating different types of content:

- **News (Novinka)** - How to create and publish news articles
- Event (Událost) - *(Coming soon)*
- Page (Stránka) - *(Coming soon)*
- Landing Page (Vstupní stránka) - *(Coming soon)*
- Board (Zápis ze zasedání) - *(Coming soon)*

### Component Documentation

Detailed guides for using individual content components:

- Text (Content)
- Image
- Gallery
- Accordion
- Infopanel
- Tiles
- And more... *(See csgov_migrate module component guides)*

## Installation

Enable the module:

```bash
drush en csgov_docs -y
```

Import the documentation:

```bash
drush migrate:import --group=csgov_migrate --tag=csgov_migrate_docs
```

## Structure

Each content type guide follows a consistent structure:

1. **Overview page** - Introduction and navigation to all steps
2. **Step-by-step pages** - Detailed instructions with:
   - Screenshots (placeholder images)
   - Detailed explanations
   - Interactive checklists (accordions)
   - Important warnings (infopanels)
   - FAQ sections (accordions)

## Dependencies

- `migrate` - Core Drupal migration system
- `migrate_plus` - Extended migration functionality
- `csgov_migrate` - CS Gov migration module with helper functions

## Purpose

This module is designed to:

- Provide in-context documentation for editors
- Demonstrate proper usage of CS Gov components
- Serve as a reference implementation
- Be optionally installable (users may want default content without documentation)

## Development

To add new documentation:

1. Create data files in `data/` directory
2. Create migration YAML files in `migrations/` directory
3. Use proper UUID scheme for consistency
4. Follow the established structure and patterns

## Separation from Default Content

This module is separate from `csgov_migrate` to allow sites to:
- Install default content without documentation
- Install documentation without default content
- Choose what they need for their specific use case
