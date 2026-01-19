# Projekt Zaliczeniowy - Analityka Biznesowa dla Menedżerów

## Szybki start

1. Otwórz **Power BI Desktop**
2. Zaimportuj dane z folderu `dane_csv/` LUB połącz się z bazą (dane w `instrukcje/01_polaczenie.md`)
3. Wykonuj kroki z folderu `instrukcje/` (01, 02, 03...)
4. Kopiuj formuły DAX z folderu `dax/`
5. Użyj scenariusza prezentacji z `scenariusz/`

---

## Struktura projektu

```
ALK_ANALITYKA_ZALICZENIE/
├── README.md                    ← Ten plik (szybki start)
├── plan_projektu.md             ← Kompletny plan (szczegółowy)
│
├── dane_csv/                    ← Dane wyeksportowane z bazy
│   ├── FactInternetSales.csv    (60,398 rekordów - główna tabela)
│   ├── DimKlient.csv            (18,484 klientów)
│   ├── DimProdukt.csv           (401 produktów)
│   ├── DimKategoria.csv         (4 kategorie)
│   ├── DimPodkategoria.csv      (37 podkategorii)
│   ├── DimObszarSprzedazy.csv   (10 regionów)
│   └── DimGeografia.csv         (655 lokalizacji)
│
├── instrukcje/                  ← Krok po kroku
│   ├── 01_polaczenie.md         (połączenie z bazą/import CSV)
│   ├── 02_power_query.md        (transformacje danych)
│   ├── 03_model_danych.md       (relacje)
│   ├── 04_miary_dax.md          (podstawowe miary)
│   ├── 05_wizualizacje.md       (budowa stron)
│   └── 06_interaktywnosc.md     (drill-through, bookmarks)
│
├── dax/                         ← Gotowe formuły DAX
│   ├── 01_tabela_miar.dax
│   ├── 02_miary_podstawowe.dax
│   ├── 03_miary_time_intelligence.dax
│   ├── 04_miary_rankingowe.dax
│   ├── 05_tabela_kalendarza.dax
│   └── 06_miary_dynamiczne.dax
│
├── power_query/                 ← Kod M dla Power Query
│   ├── DimKlient_transformacje.m
│   └── FactInternetSales_transformacje.m
│
├── assets/                      ← Zasoby wizualne
│   └── paleta_kolorow.md
│
└── scenariusz/                  ← Prezentacja
    └── prezentacja_10min.md
```

---

## Podsumowanie danych

| Metryka | Wartość |
|---------|---------|
| Okres | 2005-07 do 2008-07 |
| Sprzedaż | **$29,358,677** |
| Marża | **$12,080,884 (41.1%)** |
| Transakcje | 60,398 |
| Klienci | 18,484 |
| Produkty | 401 |

### TOP 5 produktów:
1. Góra-200 Czarny, 46 - $1,373,470
2. Góra-200 Czarny, 42 - $1,363,142
3. Góra-200 Srebrny, 38 - $1,339,463

---

## Wymagania projektu (z kursu)

- [x] Storytelling (historia w danych)
- [ ] Drążenie danych (drill-through)
- [ ] Bookmarks
- [ ] Niestandardowe etykiety
- [ ] Parametry
- [ ] Dynamiczne obiekty
- [ ] Nawigacja i przyciski
- [ ] Standard IBCS
- [ ] Nagranie max 10 min

---

## Połączenie z bazą (jeśli nie używasz CSV)

```
Serwer: database-1.c4xebry0uvcl.eu-west-1.rds.amazonaws.com,1433
Baza:   Sales
Login:  powerbi
Hasło:  BM9JDy7TKq
```

---

## Kontakt z AI

Aby kontynuować pracę z Claude na innym komputerze:
1. Otwórz nową rozmowę
2. Wklej zawartość tego README
3. Powiedz: "Kontynuuję projekt zaliczeniowy z Power BI, mam już dane i instrukcje"

---

*Wygenerowano: 2025-01-19*
