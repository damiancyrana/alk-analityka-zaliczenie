# Projekt Zaliczeniowy - Analityka Biznesowa dla Menedżerów

## Podsumowanie Danych (z analizy bazy)

| Metryka | Wartość |
|---------|---------|
| Okres danych | 2005-07 do 2008-07 |
| Suma sprzedaży | **$29,358,677** |
| Suma kosztów | $17,277,794 |
| **Marża** | **$12,080,884 (41.1%)** |
| Średnia transakcja | $486 |
| Liczba transakcji | 60,398 |
| Liczba klientów | 18,484 |
| Liczba produktów | 401 |

### Kategorie produktów:
1. Rowery
2. Części
3. Odzież
4. Akcesoria

### Obszary sprzedaży (10 regionów):
- **Ameryka Północna:** USA (5 regionów), Kanada
- **Europa:** Francja, Niemcy, Wielka Brytania
- **Australia**

### Sprzedaż wg roku:
| Rok | Sprzedaż | Transakcje | Trend |
|-----|----------|------------|-------|
| 2005 | $3,266,374 | 1,013 | - |
| 2006 | $6,530,344 | 2,677 | +100% |
| 2007 | $9,791,060 | 24,443 | +50% |
| 2008 | $9,770,900 | 32,265 | ~0% |

### TOP 5 produktów:
1. Góra-200 Czarny, 46 - $1,373,470
2. Góra-200 Czarny, 42 - $1,363,142
3. Góra-200 Srebrny, 38 - $1,339,463
4. Góra-200 Srebrny, 46 - $1,301,100
5. Góra-200 Czarny, 38 - $1,294,866

---

## Koncepcja Storytellingu

### Tytuł raportu:
**"Adventure Works - Analiza Sprzedaży Internetowej 2005-2008: Od Startupu do Globalnej Ekspansji"**

### Narracja:
> *"W ciągu 3 lat Adventure Works przekształciło się z lokalnego gracza w globalną firmę e-commerce.
> Sprzedaż wzrosła 3-krotnie, ale w 2008 roku tempo wzrostu wyhamowało.
> Gdzie tkwi potencjał dalszego rozwoju? Które rynki i produkty wymagają uwagi?"*

### Struktura raportu (5 stron):

| # | Strona | Pytanie biznesowe | Główne wizualizacje |
|---|--------|-------------------|---------------------|
| 1 | **Executive Summary** | Jak nam idzie? | KPI Cards, Trend roczny |
| 2 | **Analiza Czasowa** | Kiedy sprzedajemy? | Linia trendu, sezonowość |
| 3 | **Produkty** | Co sprzedajemy? | Słupki, Drill-through |
| 4 | **Geografia** | Gdzie sprzedajemy? | Mapa, Top regiony |
| 5 | **Klienci** | Komu sprzedajemy? | Segmentacja, demografia |

---

## Struktura Tabel (rzeczywiste nazwy kolumn)

### FactInternetSales (60,398 rekordów)
| Kolumna | Typ |
|---------|-----|
| Klucz produktu | float → INT |
| Klucz klienta | float → INT |
| Klucz obszaru sprzedaży | float → INT |
| Ilość | float |
| Cena jednostkowa | money |
| Koszt | money |
| Wartość sprzedaży | money |
| Podatek | money |
| Data zamówienia | datetime |
| Data płatności | datetime |
| Data dostawy | datetime |

### DimKategoria (4 rekordy)
| Kolumna | Typ |
|---------|-----|
| Klucz kategorii | float → INT |
| Nazwa Kategorii | nvarchar |

### DimPodkategoria (37 rekordów)
| Kolumna | Typ |
|---------|-----|
| Klucz podkategorii | float → INT |
| Nazwa podkategorii | nvarchar |
| Opis | nvarchar |
| Klucz kategorii | float → INT |

### DimProdukt (401 rekordów)
| Kolumna | Typ |
|---------|-----|
| Klucz produktu | float → INT |
| Klucz podkategorii | nvarchar → INT |
| Nazwa produktu | nvarchar |
| Standardowy koszt | float |
| Kolor | nvarchar |
| Cena katalogowa | float |
| Rozmiar | nvarchar |

### DimKlient (18,484 rekordów)
| Kolumna | Typ |
|---------|-----|
| Klucz klienta | float → INT |
| Klucz Geograficzny | float → INT |
| Imię | nvarchar |
| Nazwisko | nvarchar |
| Data urodzenia | datetime |
| Stan cywilny | nvarchar |
| Płeć | nvarchar |
| Ilość dzieci | float → INT |

### DimObszarSprzedazy (10 rekordów)
| Kolumna | Typ |
|---------|-----|
| Klucz obszaru sprzedaży | float → INT |
| Region Obszaru Sprzedaży | nvarchar |
| Kraj | nvarchar |
| Kontynent | nvarchar |
| Flagi | nvarchar |

### DimGeografia (655 rekordów)
| Kolumna | Typ |
|---------|-----|
| Klucz Geograficzny | float → INT |
| Miasto | nvarchar |
| Kod Prowincji | nvarchar |
| Nazwa Prowincji | nvarchar |
| Kod Regionu | nvarchar |
| Kraj | nvarchar |
| Kod Pocztowy | nvarchar |

---

## Model Danych - Schemat Gwiazdy

```
                        ┌─────────────────┐
                        │  DimKategoria   │
                        │  (4 rekordy)    │
                        └────────┬────────┘
                                 │ Klucz kategorii
                        ┌────────┴────────┐
                        │ DimPodkategoria │
                        │  (37 rekordów)  │
                        └────────┬────────┘
                                 │ Klucz podkategorii
┌─────────────┐         ┌────────┴────────┐         ┌──────────────────┐
│  DimKlient  │────────▶│ FactInternet    │◀────────│ DimObszarSprzed. │
│ (18,484)    │         │     Sales       │         │    (10)          │
└──────┬──────┘         │  (60,398)       │         └──────────────────┘
       │                └────────┬────────┘
       │                         │ Klucz produktu
       │                ┌────────┴────────┐
       │                │   DimProdukt    │
       │                │    (401)        │
       │                └─────────────────┘
       │ Klucz Geograficzny
┌──────┴──────┐
│ DimGeografia│
│   (655)     │
└─────────────┘
```

### Relacje do utworzenia:

| Tabela 1 | Kolumna 1 | Tabela 2 | Kolumna 2 | Kardynalność |
|----------|-----------|----------|-----------|--------------|
| FactInternetSales | Klucz produktu | DimProdukt | Klucz produktu | N:1 |
| FactInternetSales | Klucz klienta | DimKlient | Klucz klienta | N:1 |
| FactInternetSales | Klucz obszaru sprzedaży | DimObszarSprzedazy | Klucz obszaru sprzedaży | N:1 |
| DimProdukt | Klucz podkategorii | DimPodkategoria | Klucz podkategorii | N:1 |
| DimPodkategoria | Klucz kategorii | DimKategoria | Klucz kategorii | N:1 |
| DimKlient | Klucz Geograficzny | DimGeografia | Klucz Geograficzny | N:1 |

---

## Krok 1: Połączenie z Bazą Danych

### Instrukcja:
1. Otwórz **Power BI Desktop**
2. Kliknij **Pobierz dane** → **SQL Server**
3. Wpisz dane:
   - Serwer: `database-1.c4xebry0uvcl.eu-west-1.rds.amazonaws.com,1433`
   - Baza danych: `Sales`
   - Tryb: **Import**
4. Uwierzytelnianie → **Baza danych**:
   - Login: `powerbi`
   - Hasło: `BM9JDy7TKq`
5. Wybierz tabele:
   - [x] FactInternetSales
   - [x] DimKategoria
   - [x] DimPodkategoria
   - [x] DimProdukt
   - [x] DimKlient
   - [x] DimObszarSprzedazy
   - [x] DimGeografia
6. Kliknij **Przekształć dane** (aby otworzyć Power Query)

---

## Krok 2: Transformacje Power Query

### Dla wszystkich tabel - zmiana typów kluczy:
W Power Query dla każdej tabeli:
1. Zaznacz kolumny z kluczami (np. "Klucz produktu")
2. Prawy klik → **Zmień typ** → **Liczba całkowita**

### DimKlient - dodatkowe transformacje:

**Dodaj kolumnę: Pełne Imię i Nazwisko**
```m
// Dodaj kolumnę → Kolumna niestandardowa
= [Imię] & " " & [Nazwisko]
```

**Dodaj kolumnę: Wiek**
```m
// Dodaj kolumnę → Kolumna niestandardowa
= 2008 - Date.Year([Data urodzenia])
```

**Dodaj kolumnę: Grupa wiekowa**
```m
// Dodaj kolumnę → Kolumna warunkowa
if [Wiek] < 30 then "18-29"
else if [Wiek] < 40 then "30-39"
else if [Wiek] < 50 then "40-49"
else if [Wiek] < 60 then "50-59"
else "60+"
```

### FactInternetSales - dodatkowe kolumny:

**Dodaj kolumnę: Rok**
```m
= Date.Year([Data zamówienia])
```

**Dodaj kolumnę: Miesiąc**
```m
= Date.Month([Data zamówienia])
```

**Dodaj kolumnę: Rok-Miesiąc**
```m
= Date.ToText([Data zamówienia], "yyyy-MM")
```

**Dodaj kolumnę: Kwartał**
```m
= "Q" & Text.From(Date.QuarterOfYear([Data zamówienia]))
```

**Dodaj kolumnę: Marża**
```m
= [Wartość sprzedaży] - [Koszt]
```

### Po transformacjach:
Kliknij **Zamknij i zastosuj**

---

## Krok 3: Tworzenie Relacji

1. Przejdź do widoku **Model** (ikona po lewej stronie)
2. Utwórz relacje przez przeciągnięcie kolumn:
   - `FactInternetSales[Klucz produktu]` → `DimProdukt[Klucz produktu]`
   - `FactInternetSales[Klucz klienta]` → `DimKlient[Klucz klienta]`
   - `FactInternetSales[Klucz obszaru sprzedaży]` → `DimObszarSprzedazy[Klucz obszaru sprzedaży]`
   - `DimProdukt[Klucz podkategorii]` → `DimPodkategoria[Klucz podkategorii]`
   - `DimPodkategoria[Klucz kategorii]` → `DimKategoria[Klucz kategorii]`
   - `DimKlient[Klucz Geograficzny]` → `DimGeografia[Klucz Geograficzny]`

3. Sprawdź, czy wszystkie relacje mają:
   - Kardynalność: **Wiele do jednego (*:1)**
   - Kierunek filtra krzyżowego: **Pojedynczy**

---

## Krok 4: Tabela Kalendarza (DAX)

1. Przejdź do widoku **Dane**
2. Kliknij **Nowa tabela**
3. Wklej kod:

```dax
DimData =
ADDCOLUMNS(
    CALENDAR(DATE(2005, 1, 1), DATE(2008, 12, 31)),
    "Rok", YEAR([Date]),
    "Miesiąc", MONTH([Date]),
    "Nazwa Miesiąca", FORMAT([Date], "MMMM"),
    "Miesiąc Krótki", FORMAT([Date], "MMM"),
    "Kwartał", "Q" & QUARTER([Date]),
    "Rok-Miesiąc", FORMAT([Date], "YYYY-MM"),
    "Rok-Kwartał", YEAR([Date]) & "-Q" & QUARTER([Date]),
    "Dzień Tygodnia", WEEKDAY([Date], 2),
    "Nazwa Dnia", FORMAT([Date], "dddd")
)
```

4. Utwórz relację: `DimData[Date]` → `FactInternetSales[Data zamówienia]`

---

## Krok 5: Tabela Miar

1. Kliknij **Nowa tabela**
2. Wpisz:
```dax
_Miary = ROW("Placeholder", BLANK())
```

3. Dodawaj miary do tej tabeli (PPM → Nowa miara)

---

## Krok 6: Miary DAX

### Miary podstawowe:

```dax
Sprzedaż =
SUM(FactInternetSales[Wartość sprzedaży])
```

```dax
Koszt =
SUM(FactInternetSales[Koszt])
```

```dax
Marża =
[Sprzedaż] - [Koszt]
```

```dax
Marża % =
DIVIDE([Marża], [Sprzedaż], 0)
```

```dax
Ilość Sprzedana =
SUM(FactInternetSales[Ilość])
```

```dax
Liczba Transakcji =
COUNTROWS(FactInternetSales)
```

```dax
Średnia Wartość Transakcji =
DIVIDE([Sprzedaż], [Liczba Transakcji], 0)
```

```dax
Liczba Klientów =
DISTINCTCOUNT(FactInternetSales[Klucz klienta])
```

```dax
Sprzedaż na Klienta =
DIVIDE([Sprzedaż], [Liczba Klientów], 0)
```

### Miary Time Intelligence:

```dax
Sprzedaż Poprzedni Rok =
CALCULATE(
    [Sprzedaż],
    SAMEPERIODLASTYEAR(DimData[Date])
)
```

```dax
Dynamika YoY =
VAR PoprzedniRok = [Sprzedaż Poprzedni Rok]
RETURN
DIVIDE([Sprzedaż] - PoprzedniRok, PoprzedniRok, 0)
```

```dax
Dynamika YoY Tekst =
VAR Wartosc = [Dynamika YoY]
RETURN
IF(
    ISBLANK(Wartosc),
    "-",
    IF(Wartosc > 0, "+", "") & FORMAT(Wartosc, "0.0%")
)
```

```dax
Sprzedaż YTD =
CALCULATE(
    [Sprzedaż],
    DATESYTD(DimData[Date])
)
```

```dax
Sprzedaż Poprzedni Miesiąc =
CALCULATE(
    [Sprzedaż],
    PREVIOUSMONTH(DimData[Date])
)
```

### Miary rankingowe:

```dax
Ranking Produktów =
RANKX(
    ALL(DimProdukt[Nazwa produktu]),
    [Sprzedaż],
    ,
    DESC,
    Dense
)
```

```dax
Top N Filtr =
VAR RankingAktualny = [Ranking Produktów]
RETURN
IF(RankingAktualny <= 10, 1, 0)
```

---

## Krok 7: Paleta Kolorów (IBCS)

| Element | Kolor | HEX |
|---------|-------|-----|
| Tło strony | Jasny szary | `#F2F2F2` |
| Tło kart/wykresów | Biały | `#FFFFFF` |
| Tekst główny | Ciemny szary | `#333333` |
| Nagłówki | Czarny | `#000000` |
| Wartości aktualne | Ciemny niebieski | `#1A365D` |
| Wartości poprzednie | Szary | `#A0A0A0` |
| Pozytywny trend | Zielony | `#2E7D32` |
| Negatywny trend | Czerwony | `#C62828` |
| Akcent | Niebieski | `#1976D2` |

---

## Krok 8: Strony Raportu

### Strona 1: Executive Summary
**Elementy:**
- 4 KPI Cards (Sprzedaż, Transakcje, Średnia, Marża%)
- Wykres liniowy: Trend sprzedaży miesięcznej
- Wykres słupkowy: Sprzedaż wg kategorii
- Wykres słupkowy: Sprzedaż wg kraju
- Tabela: TOP 5 produktów

### Strona 2: Analiza Czasowa
**Elementy:**
- Wykres liniowy: Sprzedaż miesięczna z porównaniem YoY
- Wykres słupkowy: Sprzedaż kwartalna
- Macierz: Rok/Miesiąc ze sprzedażą
- Wykres warstwowy: Sprzedaż wg kategorii w czasie

### Strona 3: Produkty
**Elementy:**
- Wykres słupkowy: TOP 10 produktów
- Wykres kołowy: Udział kategorii
- Tabela: Szczegóły produktów z marżą
- Drill-through do szczegółów produktu

### Strona 4: Geografia
**Elementy:**
- Mapa: Sprzedaż wg kraju
- Wykres słupkowy: TOP regiony
- Macierz: Kontynent/Kraj/Region
- Karta: Liczba krajów

### Strona 5: Klienci
**Elementy:**
- Wykres słupkowy: Sprzedaż wg grupy wiekowej
- Wykres kołowy: Płeć klientów
- Wykres słupkowy: Stan cywilny
- Tabela: TOP 10 klientów

### Strona 6 (ukryta): Drill-through Produkt
**Elementy:**
- Karta: Nazwa produktu
- Karta: Kategoria/Podkategoria
- Wykres liniowy: Trend sprzedaży produktu
- Tabela: Sprzedaż wg regionu

---

## Krok 9: Elementy Interaktywne

### A) Panel Filtrów z Bookmarks

1. **Utwórz panel:**
   - Wstaw prostokąt (szerokość ~250px, wysokość = strona)
   - Kolor: biały, cień
   - Dodaj fragmentatory: Rok, Kwartał, Kategoria, Kraj

2. **Utwórz zakładki:**
   - Widok → Zakładki → Dodaj
   - "Panel Otwarty" - panel widoczny
   - "Panel Zamknięty" - panel ukryty (przesuń poza ekran)

3. **Dodaj przycisk przełączania:**
   - Wstaw → Przyciski → Puste
   - Ikona: filtr lub hamburger menu
   - Akcja: Zakładka → "Panel Otwarty"/"Panel Zamknięty"

### B) Drill-through

1. **Utwórz stronę "Szczegóły Produktu"**
2. W panelu Wizualizacje → Drill-through:
   - Przeciągnij `DimProdukt[Nazwa produktu]`
3. Na innych stronach: PPM na produkcie → Drill-through → Szczegóły Produktu

### C) Niestandardowe Etykiety (Tooltips)

1. **Utwórz stronę tooltip:**
   - Nowa strona → Rozmiar: Etykietka narzędzia (320x240)
   - Dodaj mini-wykres lub KPI

2. **Przypisz do wizualizacji:**
   - Format → Etykietka narzędzia → Strona → [wybierz stronę tooltip]

### D) Dynamiczny Tytuł

```dax
Tytuł Strony =
"Sprzedaż: " &
IF(
    ISFILTERED(DimData[Rok]),
    SELECTEDVALUE(DimData[Rok], "Wiele lat"),
    "2005-2008"
) &
IF(
    ISFILTERED(DimKategoria[Nazwa Kategorii]),
    " | " & SELECTEDVALUE(DimKategoria[Nazwa Kategorii]),
    ""
)
```

Użycie: Wstaw pole tekstowe → fx → wybierz miarę "Tytuł Strony"

### E) Przyciski Nawigacji

1. Wstaw → Przyciski → Puste
2. Format:
   - Tekst: np. "Produkty"
   - Ikona: opcjonalnie
   - Akcja: Nawigacja strony → [wybierz stronę]
3. Powiel dla każdej strony

---

## Krok 10: Scenariusz Prezentacji (10 min)

### 0:00-1:00 - Wprowadzenie
> "Dzień dobry, przedstawiam analizę sprzedaży internetowej firmy Adventure Works
> za okres 2005-2008. Raport został przygotowany w Power BI i prezentuje kluczowe
> wskaźniki biznesowe oraz trendy sprzedażowe."

### 1:00-3:00 - Dashboard główny
> "Na stronie głównej widzimy podsumowanie KPI:
> - Łączna sprzedaż: prawie 30 milionów dolarów
> - Ponad 60 tysięcy transakcji
> - Marża na poziomie 41%
>
> Wykres trendu pokazuje dynamiczny wzrost - sprzedaż wzrosła 3-krotnie w ciągu 3 lat."

### 3:00-5:00 - Analiza czasowa
> "Przechodząc do analizy czasowej... [demo nawigacji]
> Widzimy wyraźną sezonowość - najlepsze miesiące to...
> Warto zauważyć, że w 2008 roku wzrost wyhamował..."

### 5:00-6:30 - Produkty
> "Analiza produktowa pokazuje, że rowery stanowią 95% sprzedaży.
> Top 5 produktów to modele Góra-200...
> [demo drill-through do szczegółów produktu]"

### 6:30-8:00 - Geografia
> "Pod względem geograficznym, USA dominuje z... [demo mapy]
> Europa pokazuje największy potencjał wzrostu..."

### 8:00-9:00 - Klienci
> "Profil klienta: głównie osoby w wieku 30-50 lat...
> Średnia wartość na klienta wynosi..."

### 9:00-10:00 - Wnioski i rekomendacje
> "Podsumowując, nasze kluczowe wnioski to:
> 1. Wzrost wyhamował w 2008 - potrzebna nowa strategia
> 2. Rowery to core business, ale warto rozwijać akcesoria
> 3. Europa to rynek z największym potencjałem
>
> Dziękuję za uwagę."

---

## Checklist przed oddaniem

- [ ] 7 tabel zaimportowanych
- [ ] Typy danych poprawne (klucze jako INT)
- [ ] Relacje utworzone (6 relacji)
- [ ] Tabela kalendarza utworzona
- [ ] Miary DAX działają
- [ ] 5+ stron raportu
- [ ] Drill-through działa
- [ ] Bookmarks działają (panel filtrów)
- [ ] Przyciski nawigacji działają
- [ ] Niestandardowe etykiety (tooltips)
- [ ] Dynamiczne tytuły
- [ ] Spójny styl IBCS
- [ ] Storytelling - logiczna narracja
- [ ] Nagranie max 10 minut
- [ ] Plik .pbix przesłany
- [ ] Video przesłane

---

## Pliki do dostarczenia

1. **Projekt_AdventureWorks.pbix** - raport Power BI
2. **Prezentacja.mp4** - nagranie max 10 min

---

*Wygenerowano na podstawie analizy bazy danych Sales*
*Połączenie: database-1.c4xebry0uvcl.eu-west-1.rds.amazonaws.com:1433*
