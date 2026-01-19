# Krok 4: Miary DAX

## Tworzenie tabeli miar

1. **Nowa tabela** (Modelowanie → Nowa tabela)
2. Wklej:
```dax
_Miary = ROW("Placeholder", BLANK())
```
3. Ta tabela będzie kontenerem dla wszystkich miar

---

## Dodawanie miar

1. Zaznacz tabelę `_Miary` w panelu Pola
2. **Nowa miara** (Modelowanie → Nowa miara)
3. Wklej formułę z plików w folderze `dax/`

---

## Kolejność dodawania miar

### 1. Najpierw: Tabela kalendarza
Plik: `dax/05_tabela_kalendarza.dax`
- Utwórz jako NOWĄ TABELĘ (nie miara!)

### 2. Miary podstawowe
Plik: `dax/02_miary_podstawowe.dax`
- Sprzedaż
- Koszt
- Marża
- Marża %
- Ilość Sprzedana
- Liczba Transakcji
- Średnia Wartość Transakcji
- Liczba Klientów
- Sprzedaż na Klienta

### 3. Miary Time Intelligence
Plik: `dax/03_miary_time_intelligence.dax`
- Sprzedaż Poprzedni Rok
- Dynamika YoY
- Dynamika YoY Tekst
- Sprzedaż YTD
- Sprzedaż Poprzedni Miesiąc

### 4. Miary rankingowe
Plik: `dax/04_miary_rankingowe.dax`
- Ranking Produktów
- Top N Filtr

### 5. Miary dynamiczne
Plik: `dax/06_miary_dynamiczne.dax`
- Tytuł Strony
- KPI Ikona Trend

---

## Testowanie miar

Po dodaniu każdej miary:
1. Przeciągnij ją na kanwę (jako Karta)
2. Sprawdź, czy pokazuje wartość
3. Jeśli błąd - sprawdź nazwy kolumn w formule

---

## Organizacja miar

Opcjonalnie - utwórz foldery dla miar:
1. Zaznacz miarę
2. W panelu Właściwości → **Folder wyświetlania**
3. Wpisz nazwę folderu, np. "Podstawowe", "Time Intelligence"

---

## Następny krok

Przejdź do `05_wizualizacje.md`
