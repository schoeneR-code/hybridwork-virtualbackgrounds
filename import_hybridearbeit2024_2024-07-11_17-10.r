# Dieses Script liest eine CSV-Datendatei in GNU R ein.
# Beim Einlesen werden für alle Variablen Beschriftungen (comment) angelegt.
# Die Beschriftungen für Werte wird ebenfalls als Attribute (attr) abgelegt.

ds_file = file.choose()
# setwd("./")
# ds_file = "rdata_hybridearbeit2024_2024-07-11_17-10.csv"

options(encoding = "UTF-8")
ds = read.delim(
  file=ds_file, encoding="UTF-8", fileEncoding="UTF-8",
  header = FALSE, sep = "\t", quote = "\"",
  dec = ".", row.names = NULL,
  col.names = c(
    "CASE","SERIAL","REF","QUESTNNR","MODE","STARTED","AC01","AC02","DO01","DO02",
    "DO03","DO03_04","NT01_01","NT01_02","NT01_03","NT01_04","NT01_05","NT01_06",
    "PQ01","PQ02","PQ04","PQ05","RA01_CP","RA01","SQ01","TX03","ZU02_01","ZU03_01",
    "ZU04_01","ZU04_02","ZU04_03","TIME001","TIME002","TIME003","TIME004","TIME005",
    "TIME006","TIME007","TIME008","TIME_SUM","MAILSENT","LASTDATA","FINISHED",
    "Q_VIEWER","LASTPAGE","MAXPAGE","MISSING","MISSREL","TIME_RSI"
  ),
  as.is = TRUE,
  colClasses = c(
    CASE="numeric", SERIAL="character", REF="character", QUESTNNR="character",
    MODE="factor", STARTED="POSIXct", AC01="numeric", AC02="numeric",
    DO01="numeric", DO02="numeric", DO03="numeric", DO03_04="character",
    NT01_01="numeric", NT01_02="numeric", NT01_03="numeric", NT01_04="numeric",
    NT01_05="numeric", NT01_06="numeric", PQ01="numeric", PQ02="numeric",
    PQ04="numeric", PQ05="numeric", RA01_CP="numeric", RA01="numeric",
    SQ01="numeric", TX03="numeric", ZU02_01="numeric", ZU03_01="numeric",
    ZU04_01="numeric", ZU04_02="numeric", ZU04_03="numeric", TIME001="integer",
    TIME002="integer", TIME003="integer", TIME004="integer", TIME005="integer",
    TIME006="integer", TIME007="integer", TIME008="integer", TIME_SUM="integer",
    MAILSENT="POSIXct", LASTDATA="POSIXct", FINISHED="logical",
    Q_VIEWER="logical", LASTPAGE="numeric", MAXPAGE="numeric",
    MISSING="numeric", MISSREL="numeric", TIME_RSI="numeric"
  ),
  skip = 1,
  check.names = TRUE, fill = TRUE,
  strip.white = FALSE, blank.lines.skip = TRUE,
  comment.char = "",
  na.strings = ""
)

row.names(ds) = ds$CASE

rm(ds_file)

attr(ds, "project") = "hybridearbeit2024"
attr(ds, "description") = "Forschungsseminar Hybride Arbeit"
attr(ds, "date") = "2024-07-11 17:10:54"
attr(ds, "server") = "https://www.soscisurvey.de"

# Variable und Value Labels
ds$AC01 = factor(ds$AC01, levels=c("1","2","3","4","-9"), labels=c("Nein, Sie können die Daten verwenden.","Ja, ich habe nicht aufmerksam teilgenommen.","<3>","Ja, ich hatte technische Probleme.","[NA] nicht beantwortet"), ordered=FALSE)
ds$AC02 = factor(ds$AC02, levels=c("1","2","-9"), labels=c("Ja","Nein","[NA] nicht beantwortet"), ordered=FALSE)
ds$DO01 = factor(ds$DO01, levels=c("1","2","3","4","5","6","-9"), labels=c("<20","20-30","30-40","40-50","50-60",">60","[NA] nicht beantwortet"), ordered=FALSE)
ds$DO02 = factor(ds$DO02, levels=c("1","2","3","4","-9"), labels=c("Weiblich","Männlich","Divers","Keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$DO03 = factor(ds$DO03, levels=c("1","2","3","4","-9"), labels=c("Ja, ich habe eine Sehbeinträchtigung. (Rot/Grün-Schwäche;","Ja, ich habe eine Hörbeinträchtigung.","Nein, ich habe keine mir bekannten Beeinträchtigungen.","Andere, und zwar:","[NA] nicht beantwortet"), ordered=FALSE)
ds$PQ01 = factor(ds$PQ01, levels=c("1","2","3","4","-9"), labels=c("0-20%","20-40%","40-60%","60-80%","[NA] nicht beantwortet"), ordered=FALSE)
ds$PQ02 = factor(ds$PQ02, levels=c("1","2","3","-9"), labels=c("Sie nahm ab.","Sie bliebt gleich.","Sie nahm zu.","[NA] nicht beantwortet"), ordered=FALSE)
ds$PQ04 = factor(ds$PQ04, levels=c("1","2","3","4","-9"), labels=c("IQ-Tests sind nicht durch Kultur verzerrt.","IQ-Ergebnisse unterliegen starken sozioökonomischen Einflüssen.","IQ-Ergebnisse sind nur von den Eltern abhängig.","IQ-Tests sind fair für alle Gesellschaftgruppen.","[NA] nicht beantwortet"), ordered=FALSE)
ds$PQ05 = factor(ds$PQ05, levels=c("1","2","3","4","-9"), labels=c("Raumvorstellung","Wortschatz","logisches Denken","Gedächtnis","[NA] nicht beantwortet"), ordered=FALSE)
ds$SQ01 = factor(ds$SQ01, levels=c("8","9","10","11","12","13","14","15","-9"), labels=c("8","9","10","11","12","13","14","15","[NA] nicht beantwortet"), ordered=FALSE)
ds$TX03 = factor(ds$TX03, levels=c("1","2","-9"), labels=c("Ja, ich bin damit einverstanden.","Nein, ich möchte das nicht.","[NA] nicht beantwortet"), ordered=FALSE)
attr(ds$NT01_01,"1") = "Sehr Gering"
attr(ds$NT01_01,"10") = "Sehr Stark"
attr(ds$NT01_02,"1") = "Sehr Gering"
attr(ds$NT01_02,"10") = "Sehr Stark"
attr(ds$NT01_03,"1") = "Sehr Gering"
attr(ds$NT01_03,"10") = "Sehr Stark"
attr(ds$NT01_04,"1") = "Sehr Gering"
attr(ds$NT01_04,"10") = "Sehr Stark"
attr(ds$NT01_05,"1") = "Sehr Gering"
attr(ds$NT01_05,"10") = "Sehr Stark"
attr(ds$NT01_06,"1") = "Sehr Gering"
attr(ds$NT01_06,"10") = "Sehr Stark"
attr(ds$RA01,"1") = "Book background"
attr(ds$RA01,"2") = "Plant background"
attr(ds$RA01,"3") = "White background"
attr(ds$ZU02_01,"1") = "Überhaupt nicht vertrauenswürdig"
attr(ds$ZU02_01,"7") = "Sehr vertrauenswürdig"
attr(ds$ZU03_01,"1") = "Überhaupt nicht kompetent"
attr(ds$ZU03_01,"7") = "Sehr kompetent"
attr(ds$ZU04_01,"1") = "Stimme überhaupt nicht zu"
attr(ds$ZU04_01,"7") = "Stimme voll und ganz zu"
attr(ds$ZU04_02,"1") = "Stimme überhaupt nicht zu"
attr(ds$ZU04_02,"7") = "Stimme voll und ganz zu"
attr(ds$ZU04_03,"1") = "Stimme überhaupt nicht zu"
attr(ds$ZU04_03,"7") = "Stimme voll und ganz zu"
attr(ds$FINISHED,"F") = "abgebrochen"
attr(ds$FINISHED,"T") = "ausgefüllt"
attr(ds$Q_VIEWER,"F") = "Teilnehmer"
attr(ds$Q_VIEWER,"T") = "Durchklicker"
comment(ds$SERIAL) = "Personenkennung oder Teilnahmecode (sofern verwendet)"
comment(ds$REF) = "Referenz (sofern im Link angegeben)"
comment(ds$QUESTNNR) = "Fragebogen, der im Interview verwendet wurde"
comment(ds$MODE) = "Interview-Modus"
comment(ds$STARTED) = "Zeitpunkt zu dem das Interview begonnen hat (Europe/Berlin)"
comment(ds$AC01) = "Check"
comment(ds$AC02) = "Technik"
comment(ds$DO01) = "Alter"
comment(ds$DO02) = "Geschlecht"
comment(ds$DO03) = "Krankheit"
comment(ds$DO03_04) = "Krankheit: Andere, und zwar"
comment(ds$NT01_01) = "NASA TLX: Wie mental beanspruchend war die Aufgabe?"
comment(ds$NT01_02) = "NASA TLX: Wie physisch beanspruchend war die Aufgabe?"
comment(ds$NT01_03) = "NASA TLX: Wie sehr hat dich die Aufgabe zeitlich unter Druck gesetzt?"
comment(ds$NT01_04) = "NASA TLX: Wie erfolgreich hast du die Aufgabe abgeschlossen?"
comment(ds$NT01_05) = "NASA TLX: Wie sehr musstest du dich konzentrieren, um dein Level der Leistung zu erreichen?"
comment(ds$NT01_06) = "NASA TLX: Wie unsicher, entmutigt, irritiert, gestresst und genervt warst du?"
comment(ds$PQ01) = "Prozent Gene"
comment(ds$PQ02) = "Intelligenz im Alter"
comment(ds$PQ04) = "Faktoren"
comment(ds$PQ05) = "Alter"
comment(ds$RA01_CP) = "Randomisierte Videos: Vollständige Leerungen der Urne bisher"
comment(ds$RA01) = "Randomisierte Videos: Gezogener Code"
comment(ds$SQ01) = "Sekundäraufgabe"
comment(ds$TX03) = "Einwilligung"
comment(ds$ZU02_01) = "Trustworthiness: Wie vertrauenswürdig war diese Person?"
comment(ds$ZU03_01) = "Competence: Wie kompetent war diese Person?"
comment(ds$ZU04_01) = "Immersion: Ich war mir meiner direkten Umgebung nicht mehr bewusst, während ich das Video gesehen habe."
comment(ds$ZU04_02) = "Immersion: Ich war in das Video vertieft."
comment(ds$ZU04_03) = "Immersion: Ich war voll auf das Video konzentriert."
comment(ds$TIME001) = "Verweildauer Seite 1"
comment(ds$TIME002) = "Verweildauer Seite 2"
comment(ds$TIME003) = "Verweildauer Seite 3"
comment(ds$TIME004) = "Verweildauer Seite 4"
comment(ds$TIME005) = "Verweildauer Seite 5"
comment(ds$TIME006) = "Verweildauer Seite 6"
comment(ds$TIME007) = "Verweildauer Seite 7"
comment(ds$TIME008) = "Verweildauer Seite 8"
comment(ds$TIME_SUM) = "Verweildauer gesamt (ohne Ausreißer)"
comment(ds$MAILSENT) = "Versandzeitpunkt der Einladungsmail (nur für nicht-anonyme Adressaten)"
comment(ds$LASTDATA) = "Zeitpunkt als der Datensatz das letzte mal geändert wurde"
comment(ds$FINISHED) = "Wurde die Befragung abgeschlossen (letzte Seite erreicht)?"
comment(ds$Q_VIEWER) = "Hat der Teilnehmer den Fragebogen nur angesehen, ohne die Pflichtfragen zu beantworten?"
comment(ds$LASTPAGE) = "Seite, die der Teilnehmer zuletzt bearbeitet hat"
comment(ds$MAXPAGE) = "Letzte Seite, die im Fragebogen bearbeitet wurde"
comment(ds$MISSING) = "Anteil fehlender Antworten in Prozent"
comment(ds$MISSREL) = "Anteil fehlender Antworten (gewichtet nach Relevanz)"
comment(ds$TIME_RSI) = "Ausfüll-Geschwindigkeit (relativ)"



# Assure that the comments are retained in subsets
as.data.frame.avector = as.data.frame.vector
`[.avector` <- function(x,i,...) {
  r <- NextMethod("[")
  mostattributes(r) <- attributes(x)
  r
}
ds_tmp = data.frame(
  lapply(ds, function(x) {
    structure( x, class = c("avector", class(x) ) )
  } )
)
mostattributes(ds_tmp) = attributes(ds)
ds = ds_tmp
rm(ds_tmp)

