<style type="text/css">
  
  .indent {
    padding-left: 2em !important;
  }

.emphasize {
  text-align: center; 
  width: 100%; 
  color: red; 
  font-weight:bold;
  line-height:400%;
}

.sep {
  line-height:400%;
}

.large {
  font-size: 1.2em !important;
  line-height: 64px !important;
}

.reveal section del {
  color: red;
  font-weight:bold;
  width: 100%;
}

</style>
  
  Programering i R
========================================================
  transition: rotate
## Föreläsning 2: Datastrukturer, databearbetning och I/O
### [Josef Wilzén](mailto:josef.wilzen@liu.se)
STIMA, 
Linköpings universitet


*Uppdaterad `r Sys.time()`*
  
  Föreläsning 2: Innehåll 
========================================================
  - Interaktiv del
- Datastrukturer
- Matriser
- Data.frame
- Listor
- Grundläggande databearbetning
- Input och output (I/O) i R

Interaktiv del
========================================================
  type: section

Några generella frågor på kursen:
  ========================================================
  Tillåtna hjälpmedel på tentan:
  Hjälpmedel: 
  - Den inbyggda hjälpen i R (ej internet)
- Referenskort:
  - R reference card v.2 av Matt Baggot, [[här]](http://cran.r-project.org/doc/contrib/Baggott-refcard-v2.pdf)
- ggplot2: [[här]](http://www.rstudio.com/wp-content/uploads/2015/12/ggplot2-cheatsheet-2.0.pdf)
- RStudio: [[här]](http://www.rstudio.com/wp-content/uploads/2016/01/rstudio-IDE-cheatsheet.pdf)
- Se fler på [kurshemsidan](https://www.ida.liu.se/~732G33/info/courseinfo.sv.shtml)

Några generella frågor på kursen:
  ========================================================
  Finns det exakt en lösning till uppgifterna?
- övningsuppgifter: enkla uppgifter kan ha en lösning, men många har olika lösnignar
- inlämningsuppgifter: 
  - Alla testen i markmyassignment måste bli godkända. De exempel på funktionsanrop som finns är till för att ni lättare ska klara testerna.
- Ni har rätt mycket frihet vilken kod ni skriver inuti funktioner: 
  
  ```{r,eval=FALSE}
function(){
  "olika lösningar"
}

```


Markmyassignmnet:
  ========================================================
  Om alla tester är avklarade på labb2:
  
  ══ Results ══════════════════════════════════════════════════════════════
Duration: 0.3 s

OK:       50
Failed:   0
Warnings: 0
Skipped:  0
Yay! All done!
  
  Markmyassignmnet:
  ========================================================
  demo...

Hantera strängar och return()
========================================================
  - return()
- paste()
- print()
- cat()  

Kolla hjälpen, testa sen.

Läs [här](http://stackoverflow.com/questions/31843662/what-is-the-difference-between-cat-and-print) och [här](http://stackoverflow.com/questions/12775085/the-difference-between-concatenating-character-strings-with-paste-vs-cat)

Blandade frågor
========================================================
  Demo...

