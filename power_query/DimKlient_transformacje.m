// ============================================
// TRANSFORMACJE DLA TABELI DimKlient
// ============================================
// W Power Query: Strona główna → Edytor zaawansowany
// Wklej ten kod lub wykonaj kroki ręcznie
// ============================================

let
    // Źródło - dostosuj do swojego importu
    Źródło = Csv.Document(File.Contents("ścieżka/do/DimKlient.csv"), [Delimiter=",", Encoding=65001]),

    // Nagłówki
    #"Promowane nagłówki" = Table.PromoteHeaders(Źródło, [PromoteAllScalars=true]),

    // Typy danych
    #"Zmienione typy" = Table.TransformColumnTypes(#"Promowane nagłówki", {
        {"Klucz klienta", Int64.Type},
        {"Klucz Geograficzny", Int64.Type},
        {"Imię", type text},
        {"Nazwisko", type text},
        {"Data urodzenia", type datetime},
        {"Stan cywilny", type text},
        {"Płeć", type text},
        {"Ilość dzieci", Int64.Type}
    }),

    // Dodaj kolumnę: Pełne Imię
    #"Dodano Pełne Imię" = Table.AddColumn(#"Zmienione typy", "Pełne Imię",
        each [Imię] & " " & [Nazwisko], type text),

    // Dodaj kolumnę: Wiek (na rok 2008)
    #"Dodano Wiek" = Table.AddColumn(#"Dodano Pełne Imię", "Wiek",
        each 2008 - Date.Year([Data urodzenia]), Int64.Type),

    // Dodaj kolumnę: Grupa wiekowa
    #"Dodano Grupę wiekową" = Table.AddColumn(#"Dodano Wiek", "Grupa wiekowa", each
        if [Wiek] < 30 then "18-29"
        else if [Wiek] < 40 then "30-39"
        else if [Wiek] < 50 then "40-49"
        else if [Wiek] < 60 then "50-59"
        else "60+", type text)
in
    #"Dodano Grupę wiekową"


// ============================================
// RĘCZNE KROKI (alternatywa):
// ============================================
// 1. Zmień typ "Klucz klienta" na Liczba całkowita
// 2. Zmień typ "Klucz Geograficzny" na Liczba całkowita
// 3. Dodaj kolumnę → Kolumna niestandardowa:
//    Nazwa: "Pełne Imię"
//    Formuła: [Imię] & " " & [Nazwisko]
// 4. Dodaj kolumnę → Kolumna niestandardowa:
//    Nazwa: "Wiek"
//    Formuła: 2008 - Date.Year([Data urodzenia])
// 5. Dodaj kolumnę → Kolumna warunkowa:
//    Nazwa: "Grupa wiekowa"
//    Warunki: jak opisano wyżej
