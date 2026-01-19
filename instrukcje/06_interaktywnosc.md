# Krok 6: Elementy Interaktywne

## A) Panel Filtrów z Bookmarks

### 1. Utwórz panel filtrów
1. **Wstaw** → **Kształty** → **Prostokąt**
2. Ustaw:
   - Szerokość: ~250px
   - Wysokość: wysokość strony
   - Pozycja: prawa strona
   - Kolor wypełnienia: biały
   - Cień: włączony

3. Dodaj fragmentatory na panel:
   - `DimData[Rok]` - typ: Przyciski
   - `DimData[Kwartał]` - typ: Przyciski
   - `DimKategoria[Nazwa Kategorii]` - typ: Lista
   - `DimObszarSprzedazy[Kraj]` - typ: Lista rozwijana

### 2. Utwórz zakładki (Bookmarks)
1. **Widok** → **Zakładki** (włącz panel)
2. Ustaw panel jako **widoczny**
3. Kliknij **Dodaj** w panelu Zakładki
4. Nazwij: "Panel Otwarty"
5. PPM na zakładce → Odznacz "Dane" (tylko układ)

6. Teraz **przesuń panel poza ekran** (w prawo)
7. Kliknij **Dodaj**
8. Nazwij: "Panel Zamknięty"
9. PPM → Odznacz "Dane"

### 3. Dodaj przycisk przełączania
1. **Wstaw** → **Przyciski** → **Puste**
2. Format:
   - Ikona: filtr lub hamburger (☰)
   - Tekst: "Filtry"
3. **Akcja** → Włącz → **Typ: Zakładka**
4. Dla przycisku na panelu: Zakładka = "Panel Zamknięty"
5. Dla przycisku poza panelem: Zakładka = "Panel Otwarty"

---

## B) Drill-through

### 1. Utwórz stronę drill-through
1. Nowa strona → Nazwij: "Szczegóły Produktu"
2. W panelu **Wizualizacje** → sekcja **Drill-through**
3. Przeciągnij: `DimProdukt[Nazwa produktu]`

### 2. Zawartość strony drill-through
- **Karta:** Nazwa produktu (dynamiczna)
- **Karta:** Kategoria, Podkategoria
- **Wykres liniowy:** Sprzedaż produktu w czasie
- **Tabela:** Sprzedaż wg regionu
- **Przycisk Wstecz:** automatycznie dodany

### 3. Ukryj stronę
1. PPM na zakładce strony → **Ukryj stronę**

### 4. Używanie
- Na innych stronach: PPM na produkcie → **Drill-through** → "Szczegóły Produktu"

---

## C) Niestandardowe Etykiety (Tooltips)

### 1. Utwórz stronę tooltip
1. Nowa strona → Nazwij: "Tooltip Sprzedaż"
2. **Format** → **Rozmiar strony** → **Etykietka narzędzia**
3. Dodaj:
   - Kartę z `Sprzedaż`
   - Kartę z `Dynamika YoY Tekst`
   - Mini wykres słupkowy

### 2. Przypisz do wizualizacji
1. Zaznacz wykres główny
2. **Format** → **Etykietka narzędzia** → **Strona**
3. Wybierz: "Tooltip Sprzedaż"

---

## D) Dynamiczny Tytuł

### 1. Utwórz miarę
```dax
Tytuł Strony =
"Sprzedaż: " &
IF(ISFILTERED(DimData[Rok]),
   SELECTEDVALUE(DimData[Rok], "Wiele lat"),
   "2005-2008") &
IF(ISFILTERED(DimKategoria[Nazwa Kategorii]),
   " | " & SELECTEDVALUE(DimKategoria[Nazwa Kategorii]),
   "")
```

### 2. Użyj w polu tekstowym
1. **Wstaw** → **Pole tekstowe**
2. Zaznacz tekst → kliknij **fx**
3. Wybierz miarę: `Tytuł Strony`

---

## E) Przyciski Nawigacji

### 1. Utwórz pasek nawigacji
Na każdej stronie dodaj rząd przycisków:

1. **Wstaw** → **Przyciski** → **Puste**
2. Format:
   - Tekst: "Dashboard"
   - Tło: szare (#F0F0F0)
   - Obramowanie: 1px szare
3. **Akcja** → Włącz → **Typ: Nawigacja strony**
4. **Miejsce docelowe:** Executive Summary

### 2. Powiel dla każdej strony
- Dashboard | Czas | Produkty | Geografia | Klienci

### 3. Wyróżnij aktywną stronę
Na każdej stronie zmień kolor przycisku aktualnej strony (np. ciemniejszy)

---

## F) Parametry (opcjonalnie)

### Parametr wyboru miary
1. **Modelowanie** → **Nowy parametr** → **Pola**
2. Dodaj pola: `Sprzedaż`, `Marża`, `Ilość Sprzedana`
3. Nazwij: "Wybierz miarę"
4. Użyj fragmentatora z parametrem
5. Na wykresach użyj dynamicznej miary z parametru

---

## Checklist interaktywności

- [ ] Panel filtrów działa
- [ ] Bookmark przełącza panel
- [ ] Drill-through działa (PPM → drill-through)
- [ ] Tooltip pokazuje dodatkowe info
- [ ] Tytuł zmienia się po filtrowaniu
- [ ] Przyciski nawigacji działają
- [ ] Strona drill-through jest ukryta

---

## Następny krok

Przejdź do `scenariusz/prezentacja_10min.md` aby przygotować nagranie
