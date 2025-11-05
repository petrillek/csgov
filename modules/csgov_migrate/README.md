# CSGOV Migrate

Modul pro migraci výchozího obsahu do CSGOV distribuce.

## Obsah

Tento modul obsahuje migrace pro:

- **Výchozí obsah webu**: Taxonomie, média, stránky, novinky, události, atd.
- **Editorská dokumentace**: Kompletní návod "Jak vytvořit novinku"

## Editorská dokumentace

### Obsah migrace

- **Overview stránka**: Úvodní stránka typu "Krok za krokem - přehled"
- **9 kroků**: Jednotlivé kroky s detailní dokumentací
- **Content paragraphs**: HTML obsahové bloky s formátovaným textem

### Spuštění migrace editorské dokumentace

```bash
# 1. Zapnout modul (pokud ještě není)
drush en csgov_migrate -y

# 2. Spustit migrace v pořadí
drush migrate:import csgov_migrate_paragraph_csgov_content_editor_guide
drush migrate:import csgov_migrate_node_csgov_step_by_step_overview
drush migrate:import csgov_migrate_node_csgov_step_by_step

# Nebo všechny najednou s tagem
drush migrate:import --tag=csgov_migrate_editor_guide
```

### Výsledek

Po úspěšné migraci bude na webu dostupná stránka:
**URL**: `/jak-vytvorit-novinku-navod-pro-editory`

S těmito kroky:
1. Příprava a přihlášení
2. Záložka Úvodník - Základní informace
3. Záložka Obsah - Hero sekce
4. Záložka Obsah - Obsahové komponenty
5. Záložka Obsah - Související odkazy
6. Záložka Extra
7. Pokročilé nastavení
8. Kontrola a publikování
9. Co dál?

## Spuštění všech migrací

Pro import všeho výchozího obsahu:

```bash
drush en csgov_migrate -y
drush migrate:import --tag=csgov_migrate
```

## Rollback (odstranění migrovaného obsahu)

```bash
# Pouze editorská dokumentace
drush migrate:rollback csgov_migrate_node_csgov_step_by_step
drush migrate:rollback csgov_migrate_node_csgov_step_by_step_overview
drush migrate:rollback csgov_migrate_paragraph_csgov_content_editor_guide

# Nebo všechny migrace
drush migrate:rollback --tag=csgov_migrate
```

## Resetování migrace

Pokud potřebujete aktualizovat již migrovaný obsah:

```bash
drush migrate:reset-status csgov_migrate_paragraph_csgov_content_editor_guide
drush migrate:reset-status csgov_migrate_node_csgov_step_by_step_overview
drush migrate:reset-status csgov_migrate_node_csgov_step_by_step
```

A pak znovu spustit import.

## Struktura souborů

- `data/` - JSON soubory s daty pro migraci
- `migrations/` - YML konfigurace migrací
- `src/` - PHP třídy pro zpracování migrací
- `config/install/` - Views pro export dat
