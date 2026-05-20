# 🐸 Frogger Clone – Processing

Zręcznościowa gra 2D będąca hołdem dla klasycznego hitu arcade z 1981 roku. Projekt został napisany w języku **Java** z wykorzystaniem środowiska wizualnego **Processing**. 

Celem gry jest przeprowadzenie żaby z dolnej krawędzi ekranu do bezpiecznych doków na górze. Po drodze gracz musi unikać pędzących samochodów na autostradzie oraz precyzyjnie skakać po płynących kłodach, aby nie utonąć w rzece.

## ✨ Główne cechy gry

* 🎮 **Zarządzanie wejściem (Input):** Płynne sterowanie postacią za pomocą strzałek na klawiaturze.
* 💥 **System kolizji (Hitboxy):** Autorska detekcja kolizji sprawdzająca zderzenia z przeciwnikami (samochody) oraz interakcje z platformami (kłody).
* 🌊 **Zarządzanie stanem gry:** Różne strefy niebezpieczeństwa (ulica zabija przy kontakcie, rzeka zabija przy braku kontaktu z platformą).
* 🔄 **Pętla gry (Game Loop):** Optymalne odrysowywanie klatek i aktualizacja pozycji obiektów w czasie rzeczywistym.

## 🛠️ Technologie

* **Środowisko:** Processing 3 / 4
* **Język:** Java
* **Architektura:** Programowanie zorientowane obiektowo (OOP) – podział na klasy takie jak `Frog`, `Car`, `Log`, `Lane`.

## 🚀 Jak zagrać na własnym komputerze?

Aby uruchomić grę lokalnie, postępuj zgodnie z poniższymi krokami:

1. Pobierz i zainstaluj darmowe środowisko **[Processing](https://processing.org/download)**.
2. Pobierz ten projekt na swój dysk (jako ZIP lub używając `git clone`).
3. Otwórz główny plik projektu (plik z rozszerzeniem `.pde`) w programie Processing.
4. Kliknij przycisk **Uruchom (Play ▶️)** w lewym górnym rogu edytora.
5. Używaj strzałek, aby skakać żabą. Powodzenia!
