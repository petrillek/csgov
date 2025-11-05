# Návod pro editory: Jak vytvořit novinku

## Úvod

Tento návod vás provede procesem vytváření nového obsahu typu **Novinka** v redakčním systému CS Gov. Novinky slouží k přidávání aktuálních informací neformálního charakteru, jako jsou oznámení, aktuality, tiskové zprávy a další informace určené pro veřejnost.

## Jak začít

1. Přihlaste se do administračního rozhraní
2. V hlavním menu přejděte na **Obsah** → **Přidat obsah** → **Novinka**
3. Otevře se formulář pro vytvoření novinky se třemi hlavními záložkami:
   - **Úvodník** - základní informace a náhledový obrázek
   - **Obsah** - hlavní obsah novinky a obsahové komponenty
   - **Extra** - doplňkové informace

---

## Záložka 1: Úvodník

### Název (povinné pole)

Zadejte výstižný název novinky. Název by měl být:
- Stručný a jasný
- Popisný - měl by čtenáři hned říct, o čem novinka je
- Optimálně do 60 znaků (kvůli zobrazení ve vyhledávání)

**Příklad:** "Nová autobusová linka spojí centrum s nemocnicí"

### Jazyk

Vyberte jazyk, ve kterém píšete obsah novinky. Výchozí je čeština.

### Datum publikování

Zadejte datum a čas, kdy byla novinka publikována nebo kdy má být zveřejněna. Toto datum se zobrazí u novinky na webu a používá se pro řazení novinek od nejnovější k nejstarší.

**Formát:** Den.Měsíc.Rok Hodina:Minuta

### Úvodník (Teaser)

Krátký text, který shrnuje obsah novinky. Úvodník se zobrazuje:
- Na přehledových stránkách novinek
- Ve výsledcích vyhledávání
- Při sdílení na sociálních sítích
- V kartách a dalších přehledech

**Doporučení:**
- Délka: do 320 znaků
- Měl by zaujmout čtenáře a motivovat ho k přečtení celé novinky
- Neměl by obsahovat HTML značky
- Pište stručně a výstižně

**Příklad:** "Od příštího měsíce bude v provozu nová autobusová linka číslo 25, která spojí hlavní náměstí s oblastní nemocnicí. Autobusy budou jezdit každých 30 minut od 6 do 22 hodin."

### Hlavní obrázek

Sekce pro přidání hlavního obrázku novinky. Obrázek se zobrazí:
- V náhledech novinky v seznamech
- V hlavičce detailu novinky
- Při sdílení na sociálních sítích

#### Jak přidat hlavní obrázek:

1. Klikněte na tlačítko **"Přidat médium"**
2. V otevřeném okně můžete:
   - Vybrat již existující obrázek z knihovny médií
   - Nahrát nový obrázek
3. Vyberte obrázek a klikněte na **"Vložit vybrané"**

**Doporučení pro obrázky:**
- Formát: JPG nebo PNG
- Minimální rozměry: 1200 × 630 px
- Poměr stran: 16:9 nebo 4:3
- Maximální velikost souboru: 2 MB
- Obrázek by měl být kvalitní a relevantní k obsahu novinky

#### Popisek hlavního obrázku

Krátký text popisující obrázek. Popisek se zobrazí pod obrázkem a slouží také pro přístupnost (screen readery).

**Příklad:** "Nová autobusová linka u zastávky Nemocnice"

---

## Záložka 2: Obsah

### Zobrazit hero sekci

Zaškrtněte, pokud chcete na začátku novinky zobrazit velkou výraznou hero sekci (hlavičku s obrázkem nebo videem).

### Hero

Pokud jste zaškrtli "Zobrazit hero sekci", zde můžete přidat hero komponentu. Hero je velká vizuálně výrazná sekce, která se zobrazí na začátku stránky s novinkou.

**Jak přidat hero:**
1. Klikněte na tlačítko pro přidání hero
2. Vyplňte obsah hero sekce (obrázek, nadpis, text)

### Typ novinky

Vyberte kategorii/typ novinky z předem definovaného seznamu. Typy novinek slouží pro kategorizaci a filtrování.

**Příklady typů:**
- Tisková zpráva
- Oznámení
- Pozvánka
- Aktualita

Pokud potřebný typ neexistuje, můžete ho vytvořit přímo z tohoto pole napsáním názvu a potvrzením.

### Obsahové komponenty

Zde vytvořte hlavní obsah novinky pomocí předpřipravených komponent. Komponenty vám umožňují vytvářet strukturovaný a vizuálně přitažlivý obsah bez znalosti HTML.

#### Dostupné komponenty:

1. **Obsah (Content)**
   - Základní textový editor
   - Použití: běžný text s formátováním, nadpisy, seznamy, odkazy
   - Nejčastěji používaná komponenta

2. **Seznam odkazů na obsah (Node list)**
   - Automaticky generovaný seznam odkazů na jiný obsah
   - Použití: odkazy na související články, dokumenty

3. **Dlaždice (Tiles)**
   - Vizuální dlaždice s ikonami a textem
   - Použití: přehled služeb, kategorií, tematických oblastí

4. **Akordeón (Accordion)**
   - Skládací sekce s nadpisy
   - Použití: FAQ, dlouhé texty rozdělené do témat

5. **Informační panel (Infopanel)**
   - Zvýrazněný box s důležitou informací
   - Použití: upozornění, důležité poznámky, výstrahy

6. **Vložený pohled (Embed view)**
   - Vložení předkonfigurovaného seznamu obsahu
   - Použití: seznam novinek, událostí podle kritérií

7. **Statistický pruh (Statsbar)**
   - Pruh s číselnými statistikami
   - Použití: zobrazení číselných údajů, výsledků

8. **Galerie (Gallery)**
   - Fotogalerie s obrázky
   - Použití: více fotografií z události

9. **Obrázek (Image)**
   - Samostatný obrázek
   - Použití: ilustrační fotografie v textu

10. **Obrázek s textem (Image text)**
    - Kombinace obrázku a textu vedle sebe
    - Použití: perex s fotografií, citace s portrétem

11. **Přílohy (Attachments)**
    - Seznam souborů ke stažení
    - Použití: PDF dokumenty, formuláře, přílohy

12. **Krok za krokem (Step by step)**
    - Postupný návod
    - Použití: průvodce procesem, instrukce

#### Jak přidat komponentu:

1. Klikněte na tlačítko **"Přidat Komponentu"**
2. Vyberte typ komponenty z nabídky
3. Vyplňte pole dané komponenty
4. Komponentu můžete:
   - **Duplikovat** - vytvoří kopii komponenty
   - **Přesunout** - změnit pořadí komponent přetažením
   - **Smazat** - odstranit komponentu

**Tip:** Nejčastěji začnete komponentou "Obsah" pro napsání hlavního textu novinky.

### Odkazy

Sekce pro přidání seznamu odkazů souvisejících s novinkou.

#### Název odkazů
Nadpis sekce s odkazy (např. "Související informace", "Užitečné odkazy", "Více informací")

#### Odkazy
Přidejte jeden nebo více odkazů:
- **Text odkazu:** Popisný text, na který se bude klikat
- **URL:** Webová adresa
  - Externí odkazy: zadejte celou URL (https://...)
  - Interní odkazy: můžete zadat relativní cestu (/stranka)

**Příklad:**
- Text: "Jízdní řád městské dopravy"
- URL: "https://doprava.mesto.cz/jizdni-rady"

---

## Záložka 3: Extra

### Odkaz na osobu

Volitelné pole pro propojení novinky s konkrétní osobou (např. autor, kontaktní osoba, mluvčí).

Začněte psát jméno osoby a systém vám nabídne existující záznamy osob. Pokud osoba neexistuje, musí být nejprve vytvořena v sekci Osoby.

---

## Pokročilé nastavení

### Nastavení publikování

V postranním panelu najdete další důležitá nastavení:

#### Stav publikování
- **Publikováno:** Novinka je viditelná na veřejném webu
- **Nepublikováno:** Novinka je skrytá, uložená jako koncept

#### Naplánované publikování (Scheduler)

Můžete naplánovat automatické publikování nebo skrytí novinky:
- **Publikovat dne:** Zadejte datum a čas, kdy má být novinka automaticky zveřejněna
- **Skrýt dne:** Zadejte datum a čas, kdy má být novinka automaticky skryta

**Použití:** Ideální pro novinky, které chcete připravit předem a zveřejnit v konkrétní čas.

#### Propagovat na titulní stránku
Zaškrtnutím této možnosti se novinka může zobrazit na titulní stránce webu (závisí na konfiguraci webu).

#### Připnout na začátek seznamů
Zaškrtnutím bude novinka vždy zobrazena na začátku seznamu novinek, bez ohledu na datum publikování.

### URL adresa (Path)

Můžete ručně změnit URL adresu novinky. Pokud pole nevyplníte, URL se vygeneruje automaticky podle názvu novinky.

**Automaticky:** `/novinka/nova-autobusova-linka-spoji-centrum-s-nemocnici`

### Přesměrování URL (URL redirects)

Pokud měníte URL adresu existující novinky, můžete nastavit přesměrování ze staré URL na novou, aby nebyly přerušeny externí odkazy.

---

## Uložení a publikování

Po vyplnění všech polí:

1. **Náhled:** Klikněte na "Náhled" pro zobrazení, jak bude novinka vypadat na webu
2. **Uložit jako koncept:** Klikněte "Uložit" s vypnutou volbou "Publikováno" - novinka se uloží, ale nebude veřejná
3. **Publikovat:** Zaškrtněte "Publikováno" a klikněte "Uložit" - novinka bude okamžitě zveřejněna

---

## Checklist před publikováním

Před publikováním novinky zkontrolujte:

- [ ] Název je výstižný a do 60 znaků
- [ ] Datum publikování je správně nastaveno
- [ ] Úvodník je vyplněný a do 320 znaků
- [ ] Hlavní obrázek je přidán a má dobrá kvalitu
- [ ] Hlavní obsah je vytvořen pomocí obsahových komponent
- [ ] Text neobsahuje gramatické chyby
- [ ] Všechny odkazy fungují
- [ ] Náhled vypadá správně
- [ ] Je zaškrtnuto "Publikováno" (pokud chcete zveřejnit okamžitě)

---

## Často kladené otázky

**Kolik komponent mohu přidat?**
Můžete přidat libovolný počet obsahových komponent. Doporučujeme však strukturovat obsah přehledně a nedělat stránku příliš dlouhou.

**Mohu upravit již publikovanou novinku?**
Ano, v seznamu obsahu najděte novinku, klikněte na "Upravit", proveďte změny a uložte. Změny se projeví okamžitě.

**Co když udělám chybu?**
Systém ukládá revize (verze) obsahu. Můžete se vrátit k předchozí verzi pomocí záložky "Revize" při úpravě novinky.

**Jak smažu novinku?**
V seznamu obsahu najděte novinku a v rozbalovacím menu vyberte "Smazat". Pozor: smazání je nevratné!

**Mohu novinku nejprve uložit a dokončit později?**
Ano, vypněte volbu "Publikováno" a klikněte "Uložit". Novinka se uloží jako nepublikovaný koncept, který můžete kdykoliv dokončit a zveřejnit.

---

## Tipy pro kvalitní novinky

1. **Pište jasně a srozumitelně** - Používejte krátké věty a odstavce
2. **Začněte tím nejdůležitějším** - Klíčové informace dejte na začátek
3. **Používejte mezititulky** - Strukturujte delší texty pomocí nadpisů
4. **Přidávejte vizuální obsah** - Fotografie, infografiky zvyšují čtivost
5. **Kontrolujte před publikováním** - Překlepů a chyb si čtenáři všimnou
6. **Buďte aktuální** - Pravidelně kontrolujte a aktualizujte starší novinky
7. **Myslte na mobilní zařízení** - Většina návštěvníků čte na telefonech

---

## Potřebujete pomoc?

Pokud máte otázky nebo narazíte na problém, kontaktujte správce webu nebo technickou podporu.
