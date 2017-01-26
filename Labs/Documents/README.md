### Tips för användning av Lyx
Dessa tips är testade på Linux (Ubuntu Mate).

##### Om det inte går att bygga till pdf
***
Testa att radera personliga konfigurationsfiler för lyx.
Detta kan göras genom att följade sätt:
 1. Öppna lyx
 2. KLicka Help -> About Lyx
 3. Htta "User directory:" 
 4. Radera den aktuella mappen. Denna mapp raderas inte om du avinstallerar Lyx. 

Se även [här](http://tex.stackexchange.com/questions/44156/how-can-i-revert-to-the-defaults-in-lyx)



##### Installera stöd för svenska
***

Installera texlive-lang-european. Se [här](https://launchpad.net/ubuntu/+source/texlive-lang)

Stavningskontroll på svenska: För mig fungerade det att göra följande:
 1. Öppna lyx
 2. Klicka Tools -> Preferences -> Language Settings -> Spellchecker
 3. Välj "Enchant" under Spellchecker engine
