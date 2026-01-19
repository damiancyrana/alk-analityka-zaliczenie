# Krok 2: Transformacje Power Query

## Dla WSZYSTKICH tabel - zmiana typów kluczy

Dla każdej tabeli wykonaj:
1. Zaznacz kolumny zawierające "Klucz" w nazwie
2. Prawy klik → **Zmień typ** → **Liczba całkowita**

---

## DimKlient - dodatkowe transformacje

### 1. Dodaj kolumnę: Pełne Imię
1. **Dodaj kolumnę** → **Kolumna niestandardowa**
2. Nazwa: `Pełne Imię`
3. Formuła:
```m
[Imię] & " " & [Nazwisko]
```

### 2. Dodaj kolumnę: Wiek
1. **Dodaj kolumnę** → **Kolumna niestandardowa**
2. Nazwa: `Wiek`
3. Formuła:
```m
2008 - Date.Year([Data urodzenia])
```

### 3. Dodaj kolumnę: Grupa wiekowa
1. **Dodaj kolumnę** → **Kolumna warunkowa**
2. Nazwa: `Grupa wiekowa`
3. Warunki:
   - Jeśli `Wiek` < 30 → "18-29"
   - Jeśli `Wiek` < 40 → "30-39"
   - Jeśli `Wiek` < 50 → "40-49"
   - Jeśli `Wiek` < 60 → "50-59"
   - W przeciwnym razie → "60+"

---

## FactInternetSales - dodatkowe kolumny

### 1. Dodaj kolumnę: Rok
1. **Dodaj kolumnę** → **Kolumna niestandardowa**
2. Nazwa: `Rok`
3. Formuła:
```m
Date.Year([Data zamówienia])
```

### 2. Dodaj kolumnę: Miesiąc
```m
Date.Month([Data zamówienia])
```

### 3. Dodaj kolumnę: Rok-Miesiąc
```m
Date.ToText([Data zamówienia], "yyyy-MM")
```

### 4. Dodaj kolumnę: Kwartał
```m
"Q" & Text.From(Date.QuarterOfYear([Data zamówienia]))
```

### 5. Dodaj kolumnę: Marża
```m
[Wartość sprzedaży] - [Koszt]
```

---

## DimProdukt - poprawka typu

⚠️ Kolumna `Klucz podkategorii` jest typu `nvarchar` - zmień na **Liczba całkowita**

---

## Zakończenie

1. Sprawdź, czy wszystkie typy danych są poprawne
2. Kliknij **Zamknij i zastosuj**
3. Przejdź do `03_model_danych.md`
