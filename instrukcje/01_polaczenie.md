# Krok 1: Połączenie z danymi

## Opcja A: Import z plików CSV (zalecane)

1. Otwórz **Power BI Desktop**
2. Kliknij **Pobierz dane** → **Tekst/CSV**
3. Przejdź do folderu `dane_csv/`
4. Zaimportuj kolejno wszystkie 7 plików:
   - `FactInternetSales.csv`
   - `DimKlient.csv`
   - `DimProdukt.csv`
   - `DimKategoria.csv`
   - `DimPodkategoria.csv`
   - `DimObszarSprzedazy.csv`
   - `DimGeografia.csv`

5. Dla każdego pliku:
   - Sprawdź podgląd danych
   - Kliknij **Przekształć dane** (aby otworzyć Power Query)

---

## Opcja B: Połączenie z bazą SQL Server

### Dane połączenia:
```
Serwer: database-1.c4xebry0uvcl.eu-west-1.rds.amazonaws.com,1433
Baza danych: Sales
Login: powerbi
Hasło: BM9JDy7TKq
Tryb: Import
```

### Kroki:
1. **Pobierz dane** → **SQL Server**
2. Wpisz serwer: `database-1.c4xebry0uvcl.eu-west-1.rds.amazonaws.com,1433`
3. Wpisz bazę: `Sales`
4. Wybierz tryb: **Import**
5. Uwierzytelnianie: **Baza danych**
   - Login: `powerbi`
   - Hasło: `BM9JDy7TKq`
6. Zaznacz tabele:
   - [x] FactInternetSales
   - [x] DimKategoria
   - [x] DimPodkategoria
   - [x] DimProdukt
   - [x] DimKlient
   - [x] DimObszarSprzedazy
   - [x] DimGeografia
7. Kliknij **Przekształć dane**

---

## Po imporcie

Przejdź do Power Query Editor i wykonaj transformacje z pliku `02_power_query.md`
