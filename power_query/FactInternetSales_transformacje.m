// ============================================
// TRANSFORMACJE DLA TABELI FactInternetSales
// ============================================
// W Power Query: Strona główna → Edytor zaawansowany
// Wklej ten kod lub wykonaj kroki ręcznie
// ============================================

let
    // Źródło - dostosuj do swojego importu
    Źródło = Csv.Document(File.Contents("ścieżka/do/FactInternetSales.csv"), [Delimiter=",", Encoding=65001]),

    // Nagłówki
    #"Promowane nagłówki" = Table.PromoteHeaders(Źródło, [PromoteAllScalars=true]),

    // Typy danych
    #"Zmienione typy" = Table.TransformColumnTypes(#"Promowane nagłówki", {
        {"Klucz produktu", Int64.Type},
        {"Klucz klienta", Int64.Type},
        {"Klucz obszaru sprzedaży", Int64.Type},
        {"Ilość", Int64.Type},
        {"Cena jednostkowa", Currency.Type},
        {"Koszt", Currency.Type},
        {"Wartość sprzedaży", Currency.Type},
        {"Podatek", Currency.Type},
        {"Data zamówienia", type datetime},
        {"Data płatności", type datetime},
        {"Data dostawy", type datetime}
    }),

    // Dodaj kolumnę: Rok
    #"Dodano Rok" = Table.AddColumn(#"Zmienione typy", "Rok",
        each Date.Year([Data zamówienia]), Int64.Type),

    // Dodaj kolumnę: Miesiąc
    #"Dodano Miesiąc" = Table.AddColumn(#"Dodano Rok", "Miesiąc",
        each Date.Month([Data zamówienia]), Int64.Type),

    // Dodaj kolumnę: Rok-Miesiąc
    #"Dodano Rok-Miesiąc" = Table.AddColumn(#"Dodano Miesiąc", "Rok-Miesiąc",
        each Date.ToText([Data zamówienia], "yyyy-MM"), type text),

    // Dodaj kolumnę: Kwartał
    #"Dodano Kwartał" = Table.AddColumn(#"Dodano Rok-Miesiąc", "Kwartał",
        each "Q" & Text.From(Date.QuarterOfYear([Data zamówienia])), type text),

    // Dodaj kolumnę: Marża
    #"Dodano Marżę" = Table.AddColumn(#"Dodano Kwartał", "Marża",
        each [Wartość sprzedaży] - [Koszt], Currency.Type)
in
    #"Dodano Marżę"


// ============================================
// RĘCZNE KROKI (alternatywa):
// ============================================
// 1. Zmień typy kluczy na Liczba całkowita
// 2. Zmień typy walutowe na Waluta (lub Liczba dziesiętna)
// 3. Dodaj kolumnę → Kolumna niestandardowa:
//    Nazwa: "Rok"
//    Formuła: Date.Year([Data zamówienia])
// 4. Dodaj kolumnę → Kolumna niestandardowa:
//    Nazwa: "Miesiąc"
//    Formuła: Date.Month([Data zamówienia])
// 5. Dodaj kolumnę → Kolumna niestandardowa:
//    Nazwa: "Rok-Miesiąc"
//    Formuła: Date.ToText([Data zamówienia], "yyyy-MM")
// 6. Dodaj kolumnę → Kolumna niestandardowa:
//    Nazwa: "Kwartał"
//    Formuła: "Q" & Text.From(Date.QuarterOfYear([Data zamówienia]))
// 7. Dodaj kolumnę → Kolumna niestandardowa:
//    Nazwa: "Marża"
//    Formuła: [Wartość sprzedaży] - [Koszt]
