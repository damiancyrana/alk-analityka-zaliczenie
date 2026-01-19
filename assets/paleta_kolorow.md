# Paleta Kolorów (Standard IBCS)

## Podstawowe kolory

| Element | Kolor | HEX | RGB |
|---------|-------|-----|-----|
| Tło strony | Jasny szary | `#F2F2F2` | 242, 242, 242 |
| Tło wizualizacji | Biały | `#FFFFFF` | 255, 255, 255 |
| Tekst główny | Ciemny szary | `#333333` | 51, 51, 51 |
| Nagłówki | Czarny | `#000000` | 0, 0, 0 |
| Linie/obramowania | Szary | `#CCCCCC` | 204, 204, 204 |

## Kolory danych

| Element | Kolor | HEX | RGB |
|---------|-------|-----|-----|
| Wartości aktualne | Ciemny niebieski | `#1A365D` | 26, 54, 93 |
| Wartości poprzednie | Szary | `#A0A0A0` | 160, 160, 160 |
| Akcent główny | Niebieski | `#1976D2` | 25, 118, 210 |
| Akcent drugorzędny | Jasny niebieski | `#64B5F6` | 100, 181, 246 |

## Kolory wskaźników

| Element | Kolor | HEX | RGB |
|---------|-------|-----|-----|
| Pozytywny (wzrost) | Zielony | `#2E7D32` | 46, 125, 50 |
| Negatywny (spadek) | Czerwony | `#C62828` | 198, 40, 40 |
| Neutralny | Szary | `#757575` | 117, 117, 117 |
| Ostrzeżenie | Pomarańczowy | `#F57C00` | 245, 124, 0 |

## Kolory kategorii (dla wykresów)

| Kategoria | Kolor | HEX |
|-----------|-------|-----|
| Rowery | Ciemny niebieski | `#1A365D` |
| Części | Niebieski | `#2196F3` |
| Odzież | Jasny niebieski | `#64B5F6` |
| Akcesoria | Błękitny | `#90CAF9` |

## Użycie w Power BI

### Ustawienie motywu:
1. **Widok** → **Motywy** → **Dostosuj bieżący motyw**
2. Wklej kolory w odpowiednich sekcjach

### JSON motywu (opcjonalnie):
```json
{
  "name": "IBCS Theme",
  "dataColors": [
    "#1A365D",
    "#2196F3",
    "#64B5F6",
    "#90CAF9",
    "#A0A0A0",
    "#757575"
  ],
  "background": "#F2F2F2",
  "foreground": "#333333",
  "tableAccent": "#1976D2"
}
```

## Zasady IBCS

1. **Używaj szarości** - dla wartości porównawczych/poprzednich
2. **Kolor = znaczenie** - nie dekoracja
3. **Zielony = dobrze**, **Czerwony = źle** - spójnie
4. **Minimalizm** - unikaj zbędnych kolorów
5. **Kontrast** - tekst czytelny na tle
