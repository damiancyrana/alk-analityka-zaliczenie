# Krok 5: Wizualizacje

## Ustawienia początkowe

### Rozmiar strony
1. **Widok** → **Rozmiar strony** → **16:9** (domyślny)

### Motyw kolorystyczny
1. **Widok** → **Motywy** → wybierz neutralny motyw
2. Lub użyj kolorów z `assets/paleta_kolorow.md`

---

## Strona 1: Executive Summary (Dashboard)

### Nagłówek
- Pole tekstowe z tytułem: "Adventure Works - Analiza Sprzedaży 2005-2008"
- Dynamiczny tytuł (opcjonalnie): użyj miary `Tytuł Strony`

### KPI Cards (4 karty w rzędzie)
1. **Karta 1:** Miara `Sprzedaż` | Format: Waluta
2. **Karta 2:** Miara `Liczba Transakcji` | Format: Liczba
3. **Karta 3:** Miara `Średnia Wartość Transakcji` | Format: Waluta
4. **Karta 4:** Miara `Marża %` | Format: Procent

### Wykres liniowy: Trend sprzedaży
- **Oś X:** `DimData[Rok-Miesiąc]` lub `FactInternetSales[Rok-Miesiąc]`
- **Oś Y:** Miara `Sprzedaż`
- Tytuł: "Sprzedaż miesięczna"

### Wykres słupkowy: Sprzedaż wg kategorii
- **Oś Y:** `DimKategoria[Nazwa Kategorii]`
- **Oś X:** Miara `Sprzedaż`
- Sortuj malejąco

### Wykres słupkowy: Sprzedaż wg kraju
- **Oś Y:** `DimObszarSprzedazy[Kraj]`
- **Oś X:** Miara `Sprzedaż`
- Sortuj malejąco

### Tabela: TOP 5 produktów
- Kolumny: `Nazwa produktu`, `Sprzedaż`, `Marża %`
- Filtr wizualny: `Ranking Produktów` <= 5

---

## Strona 2: Analiza Czasowa

### Wykres liniowy: Trend z porównaniem YoY
- **Oś X:** `DimData[Rok-Miesiąc]`
- **Oś Y:** `Sprzedaż` (główna linia)
- **Oś Y dodatkowa:** `Sprzedaż Poprzedni Rok` (linia przerywana)

### Wykres słupkowy: Sprzedaż kwartalna
- **Oś X:** `DimData[Rok-Kwartał]`
- **Oś Y:** `Sprzedaż`

### Macierz: Rok/Miesiąc
- **Wiersze:** `DimData[Rok]`
- **Kolumny:** `DimData[Nazwa Miesiąca]`
- **Wartości:** `Sprzedaż`
- Włącz formatowanie warunkowe (kolor tła)

### Karta: Dynamika YoY
- Miara: `Dynamika YoY Tekst`

---

## Strona 3: Produkty

### Wykres słupkowy: TOP 10 produktów
- **Oś Y:** `DimProdukt[Nazwa produktu]`
- **Oś X:** `Sprzedaż`
- Filtr: `Ranking Produktów` <= 10

### Wykres kołowy: Udział kategorii
- **Legenda:** `DimKategoria[Nazwa Kategorii]`
- **Wartości:** `Sprzedaż`

### Tabela szczegółowa
- Kolumny: `Nazwa produktu`, `Kolor`, `Rozmiar`, `Sprzedaż`, `Marża`, `Marża %`

---

## Strona 4: Geografia

### Mapa
- **Lokalizacja:** `DimObszarSprzedazy[Kraj]`
- **Rozmiar bąbelka:** `Sprzedaż`

### Wykres słupkowy: Sprzedaż wg kontynentu
- **Oś Y:** `DimObszarSprzedazy[Kontynent]`
- **Oś X:** `Sprzedaż`

### Macierz: Kontynent/Kraj/Region
- **Wiersze:** Hierarchia: `Kontynent` > `Kraj` > `Region Obszaru Sprzedaży`
- **Wartości:** `Sprzedaż`, `Liczba Transakcji`

---

## Strona 5: Klienci

### Wykres słupkowy: Sprzedaż wg grupy wiekowej
- **Oś Y:** `DimKlient[Grupa wiekowa]`
- **Oś X:** `Sprzedaż`

### Wykres kołowy: Płeć
- **Legenda:** `DimKlient[Płeć]`
- **Wartości:** `Liczba Klientów`

### Wykres słupkowy: Stan cywilny
- **Oś Y:** `DimKlient[Stan cywilny]`
- **Oś X:** `Sprzedaż`

### Tabela: TOP 10 klientów
- Kolumny: `Pełne Imię`, `Miasto`, `Sprzedaż`
- Sortuj malejąco po sprzedaży, Top N = 10

---

## Strona 6 (ukryta): Drill-through Produkt

Ta strona będzie używana jako drill-through. Szczegóły w `06_interaktywnosc.md`

---

## Następny krok

Przejdź do `06_interaktywnosc.md`
