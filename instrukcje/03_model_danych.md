# Krok 3: Model Danych

## Schemat gwiazdy (docelowy)

```
                        ┌─────────────────┐
                        │  DimKategoria   │
                        └────────┬────────┘
                                 │
                        ┌────────┴────────┐
                        │ DimPodkategoria │
                        └────────┬────────┘
                                 │
┌─────────────┐         ┌────────┴────────┐         ┌──────────────────┐
│  DimKlient  │────────▶│ FactInternet    │◀────────│ DimObszarSprzed. │
└──────┬──────┘         │     Sales       │         └──────────────────┘
       │                └────────┬────────┘
       │                         │
       │                ┌────────┴────────┐
       │                │   DimProdukt    │
       │                └─────────────────┘
       │
┌──────┴──────┐
│ DimGeografia│
└─────────────┘
```

---

## Tworzenie relacji

1. Przejdź do widoku **Model** (ikona po lewej stronie)
2. Przeciągnij kolumny, aby utworzyć relacje:

### Relacja 1: Sprzedaż → Produkt
- **Z:** `FactInternetSales[Klucz produktu]`
- **Do:** `DimProdukt[Klucz produktu]`
- Kardynalność: **Wiele do jednego (*:1)**

### Relacja 2: Sprzedaż → Klient
- **Z:** `FactInternetSales[Klucz klienta]`
- **Do:** `DimKlient[Klucz klienta]`
- Kardynalność: **Wiele do jednego (*:1)**

### Relacja 3: Sprzedaż → Obszar Sprzedaży
- **Z:** `FactInternetSales[Klucz obszaru sprzedaży]`
- **Do:** `DimObszarSprzedazy[Klucz obszaru sprzedaży]`
- Kardynalność: **Wiele do jednego (*:1)**

### Relacja 4: Produkt → Podkategoria
- **Z:** `DimProdukt[Klucz podkategorii]`
- **Do:** `DimPodkategoria[Klucz podkategorii]`
- Kardynalność: **Wiele do jednego (*:1)**

### Relacja 5: Podkategoria → Kategoria
- **Z:** `DimPodkategoria[Klucz kategorii]`
- **Do:** `DimKategoria[Klucz kategorii]`
- Kardynalność: **Wiele do jednego (*:1)**

### Relacja 6: Klient → Geografia
- **Z:** `DimKlient[Klucz Geograficzny]`
- **Do:** `DimGeografia[Klucz Geograficzny]`
- Kardynalność: **Wiele do jednego (*:1)**

---

## Sprawdzenie relacji

Dla każdej relacji sprawdź:
- ✅ Kardynalność: **Wiele do jednego (*:1)**
- ✅ Kierunek filtra: **Pojedynczy** (strzałka w jedną stronę)
- ✅ Relacja aktywna (linia ciągła, nie przerywana)

---

## Tabela kalendarza

Po utworzeniu relacji, dodaj tabelę kalendarza:
1. Przejdź do widoku **Dane** lub **Raport**
2. **Nowa tabela** (na wstążce Modelowanie)
3. Wklej kod z pliku `dax/05_tabela_kalendarza.dax`
4. Utwórz relację:
   - **Z:** `DimData[Date]`
   - **Do:** `FactInternetSales[Data zamówienia]`

---

## Następny krok

Przejdź do `04_miary_dax.md` aby utworzyć miary
