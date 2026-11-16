# Afgeleide foreign keys - dbschema_2work.sql

Automatisch afgeleid uit veldnamen (conventie: kolom `<Tabel>ID` verwijst naar tabel `<Tabel>`).

- Aantal tabellen: 695
- Aantal id-kolommen (exclusief eigen primaire sleutel): 1978
- **Directe matches: 545** (kolomnaam minus `id` = exacte tabelnaam)
- **Waarschijnlijke matches (suffix): 60** (kolomnaam eindigt op tabelnaam, bijvoorbeeld `RouteStartGebruikerID` -> `Gebruiker`); handmatig te controleren
- Resterende id-kolommen zijn niet eenduidig (generieke namen zoals `veldid`, `tabelid`, of geen tabel met die naam)

De vermoedde primaire sleutel van elke tabel is `<Tabel>ID` indien aanwezig, anders de eerste kolom.

## Directe foreign keys (545)

| Tabel | Kolom | Verwijst naar | Refererende kolom |
|---|---|---|---|
| a2users | gebruikerid | Gebruiker | gebruikerid |
| a3change | gebruikerid | Gebruiker | gebruikerid |
| a3conversie | gebruikerid | Gebruiker | gebruikerid |
| a3lock | gebruikerid | Gebruiker | gebruikerid |
| a3periodiek | dossierid | dossier | dossierid |
| a3periodiek | rekeningid | Rekening | rekeningid |
| a3undo | gebruikerid | Gebruiker | gebruikerid |
| a3update | dossierid | dossier | dossierid |
| a3xml | gebruikerid | Gebruiker | gebruikerid |
| a4prognose | statusid | Status | statusid |
| adbank | dossierid | dossier | dossierid |
| adbankeerste | dossierid | dossier | dossierid |
| adbankgeenMT940 | dossierid | dossier | dossierid |
| adbankgeenMT940OFHAND | dossierid | dossier | dossierid |
| adbankgrootboek | dossierid | dossier | dossierid |
| adbankgrootboek | rekeningid | Rekening | rekeningid |
| adbanksaldo | dossierid | dossier | dossierid |
| adbanksaldoop | dossierid | dossier | dossierid |
| adbankspecs | dossierid | dossier | dossierid |
| adbegrotingen | dossierid | dossier | dossierid |
| adbeheerrekening | dossierid | dossier | dossierid |
| adboekhouddossiers | relatieid | Relatie | relatieid |
| adboekhouddossiersAll | dossierid | dossier | dossierid |
| adboekregel | dossierid | dossier | dossierid |
| adboekregelstat | dossierid | dossier | dossierid |
| addubbeleperiodiek | statusid | Status | statusid |
| adeenbeheerrekening | dossierid | dossier | dossierid |
| adfactuurregel | dossierid | dossier | dossierid |
| adfactuurregel | rekeningid | Rekening | rekeningid |
| adgewaarmerkt | dossierid | dossier | dossierid |
| adinstelling | dossierid | dossier | dossierid |
| adinstellingsregel | dossierid | dossier | dossierid |
| adinventaris | dossierid | dossier | dossierid |
| adinventaris | rekeningid | Rekening | rekeningid |
| adjournaal | dossierid | dossier | dossierid |
| adjournaalpost | rekeningid | Rekening | rekeningid |
| adkruisboekregel | dossierid | dossier | dossierid |
| adLastAfschrift | dossierid | dossier | dossierid |
| adleefgeldrekening | dossierid | dossier | dossierid |
| adoormerk | dossierid | dossier | dossierid |
| adoormerken | dossierid | dossier | dossierid |
| adpatroon | dossierid | dossier | dossierid |
| adpatroon | rekeningid | Rekening | rekeningid |
| adprognose | dossierid | dossier | dossierid |
| adprognose | statusid | Status | statusid |
| adprognoseA | dossierid | dossier | dossierid |
| adprognoseA | statusid | Status | statusid |
| adschuld | dossierid | dossier | dossierid |
| adschuldlog | statusid | Status | statusid |
| adverdeling | dossierid | dossier | dossierid |
| advermtoeslag | dossierid | dossier | dossierid |
| adverplichting | dossierid | dossier | dossierid |
| adverplichting | rekeningid | Rekening | rekeningid |
| adverplichting | relatieid | Relatie | relatieid |
| adverplvermtoeslag | dossierid | dossier | dossierid |
| adverwerkendtoend | dossierid | dossier | dossierid |
| adverwerkendtoend | rekeningid | Rekening | rekeningid |
| adverwerking | rekeningid | Rekening | rekeningid |
| adverzekering | dossierid | dossier | dossierid |
| adxgrootboek | dossierid | dossier | dossierid |
| adxgrootboek | rekeningid | Rekening | rekeningid |
| adxgrootboek | relatieid | Relatie | relatieid |
| adxgrootboekplus | dossierid | dossier | dossierid |
| adxrekening | rekeningid | Rekening | rekeningid |
| adzbetaalrun | dossierid | dossier | dossierid |
| adzbudgetplan | dossierid | dossier | dossierid |
| adzbusiness | dossierid | dossier | dossierid |
| adzbusiness | gebruikerid | Gebruiker | gebruikerid |
| adzbusiness | rekeningid | Rekening | rekeningid |
| adzincassorun | dossierid | dossier | dossierid |
| adzomzet | dossierid | dossier | dossierid |
| adzomzet | relatieid | Relatie | relatieid |
| adzpersoneel | gebruikerid | Gebruiker | gebruikerid |
| adzposten | dossierid | dossier | dossierid |
| adzposten | statusid | Status | statusid |
| adzverantwoording | dossierid | dossier | dossierid |
| adzverantwoording | rekeningid | Rekening | rekeningid |
| Afzender | relatieid | Relatie | relatieid |
| ApplicatieTabelKolom | applicatiedatatypeid | ApplicatieDatatype | applicatiedatatypeid |
| ApplicatieTabelKolom | applicatiekolomuniekheidid | ApplicatieKolomUniekheid | applicatiekolomuniekheidid |
| ApplicatieTabelKolom | applicatietabelid | ApplicatieTabel | applicatietabelid |
| bankkosten | dossierid | dossier | dossierid |
| Barcode | barcodevelid | BarcodeVel | barcodevelid |
| Barcode | eigenschapcomponentid | EigenschapComponent | eigenschapcomponentid |
| BarcodeLezer | barcodevelid | BarcodeVel | barcodevelid |
| BarcodeRegio | barcodevelid | BarcodeVel | barcodevelid |
| BarcodeVel | hulpapplicatieid | HulpApplicatie | hulpapplicatieid |
| BarcodeVel | inhoudid | Inhoud | inhoudid |
| BarcodeVelBestand | barcodevelid | BarcodeVel | barcodevelid |
| BarcodeVelOpmerking | barcodevelid | BarcodeVel | barcodevelid |
| BarcodeVelRegio | barcodevelid | BarcodeVel | barcodevelid |
| CaptureBarcode | gebruikerid | Gebruiker | gebruikerid |
| ClassificatieOpmerking | classificatieid | Classificatie | classificatieid |
| ClassificatieRED | classificatieid | Classificatie | classificatieid |
| cmkosten | dossierid | dossier | dossierid |
| cmprijslijst | dossierid | dossier | dossierid |
| cmprijslijst | rekeningid | Rekening | rekeningid |
| cmtarief | rekeningid | Rekening | rekeningid |
| cmtoeslag | rekeningid | Rekening | rekeningid |
| coBasis | gebruikerid | Gebruiker | gebruikerid |
| coBasischeck | dossierid | dossier | dossierid |
| cobasisresultaat | dossierid | dossier | dossierid |
| cobasisresultaat | gebruikerid | Gebruiker | gebruikerid |
| cointegriteitT1 | dossierid | dossier | dossierid |
| cointegriteitT1 | gebruikerid | Gebruiker | gebruikerid |
| cointegriteitT2 | dossierid | dossier | dossierid |
| cointegriteitT2 | gebruikerid | Gebruiker | gebruikerid |
| ControlePunt | controlelijstid | ControleLijst | controlelijstid |
| coResultaat | dossierid | dossier | dossierid |
| coResultaat | gebruikerid | Gebruiker | gebruikerid |
| dmdocument | dossierid | dossier | dossierid |
| dmdocument | relatieid | Relatie | relatieid |
| dmxmap | mapid | Map | mapid |
| doautorisatie | dossierid | dossier | dossierid |
| doautorisatie | gebruikerid | Gebruiker | gebruikerid |
| dobeeindigen | dossierid | dossier | dossierid |
| dobetrokken | dossierid | dossier | dossierid |
| dobetrokken | gebruikerid | Gebruiker | gebruikerid |
| dobetrokken | relatieid | Relatie | relatieid |
| docontrole | dossierid | dossier | dossierid |
| DocSoortKenmerkOmschrijving | documentsoortid | DocumentSoort | documentsoortid |
| DocSoortKenmerkOmschrijving | kenmerkomschrijvingid | KenmerkOmschrijving | kenmerkomschrijvingid |
| Document | classificatieid | Classificatie | classificatieid |
| Document | documentsoortid | DocumentSoort | documentsoortid |
| Document | inhoudid | Inhoud | inhoudid |
| Document | inhoudsoortid | InhoudSoort | inhoudsoortid |
| Document | lokatieid | Lokatie | lokatieid |
| Document | mailroomafzenderid | MailroomAfzender | mailroomafzenderid |
| Document | mailroomsjabloonid | MailroomSjabloon | mailroomsjabloonid |
| Document | paperclipid | Paperclip | paperclipid |
| Document | relatieid | Relatie | relatieid |
| Document | routeid | Route | routeid |
| Document | statusid | Status | statusid |
| DocumentControlePunt | controlepuntid | ControlePunt | controlepuntid |
| DocumentControlePunt | documentid | Document | documentid |
| DocumentGebruiker | documentid | Document | documentid |
| DocumentGebruiker | gebruikerid | Gebruiker | gebruikerid |
| DocumentGebruikerOpmerking | gebruikerid | Gebruiker | gebruikerid |
| DocumentHistorie | documenthandelingid | DocumentHandeling | documenthandelingid |
| DocumentHistorie | documentid | Document | documentid |
| DocumentKenmerkWaarde | documentid | Document | documentid |
| DocumentKenmerkWaarde | kenmerkomschrijvingwaardeid | KenmerkOmschrijvingWaarde | kenmerkomschrijvingwaardeid |
| DocumentLabel | documentid | Document | documentid |
| DocumentLabel | labelid | Label | labelid |
| DocumentNotitie | documentid | Document | documentid |
| DocumentNotitie | gebruikerid | Gebruiker | gebruikerid |
| DocumentNotitie | routeid | Route | routeid |
| DocumentRouteStap | documentid | Document | documentid |
| DocumentRouteStap | routestapid | RouteStap | routestapid |
| DocumentRouteStap | routestapstatusid | RouteStapStatus | routestapstatusid |
| DocumentRouteStapGebruiker | documentroutestapid | DocumentRouteStap | documentroutestapid |
| DocumentRouteStapGebruiker | gebruikerid | Gebruiker | gebruikerid |
| DocumentVersie | documentid | Document | documentid |
| DocumentVersie | inhoudid | Inhoud | inhoudid |
| DocumentVolgnummer | documentid | Document | documentid |
| DocumentVolgnummer | gebruikerid | Gebruiker | gebruikerid |
| DocumentVolgnummer | samenvoegsessieid | SamenvoegSessie | samenvoegsessieid |
| DocumentWorkflowStap | documentid | Document | documentid |
| DocumentWorkflowStapGebruiker | documentid | Document | documentid |
| DocumentWorkflowStapGebruiker | documentworkflowstapid | DocumentWorkflowStap | documentworkflowstapid |
| DocumentWorkflowStapGebruiker | gebruikerid | Gebruiker | gebruikerid |
| dodata | dossierid | dossier | dossierid |
| DOData1 | dossierid | dossier | dossierid |
| DOData2 | dossierid | dossier | dossierid |
| dodata3 | dossierid | dossier | dossierid |
| DOData4 | dossierid | dossier | dossierid |
| doEigenMedewerkers | dossierid | dossier | dossierid |
| doEigenMedewerkers | gebruikerid | Gebruiker | gebruikerid |
| doFormeel | dossierid | dossier | dossierid |
| dogeenverantwoordingA | rekeningid | Rekening | rekeningid |
| dogezinsleden | dossierid | dossier | dossierid |
| dogezinsleden | relatieid | Relatie | relatieid |
| dogrid | dossierid | dossier | dossierid |
| dogrid1 | dossierid | dossier | dossierid |
| dokengetallen | dossierid | dossier | dossierid |
| domachtigingen | dossierid | dossier | dossierid |
| donaarbeheer | dossierid | dossier | dossierid |
| donaarkanton | dossierid | dossier | dossierid |
| doOvergedragen | dossierid | dossier | dossierid |
| doovergenomen | dossierid | dossier | dossierid |
| doovergenomen | relatieid | Relatie | relatieid |
| doovergenomenuser | gebruikerid | Gebruiker | gebruikerid |
| dopersonen1 | dossierid | dossier | dossierid |
| dopersonen1 | relatieid | Relatie | relatieid |
| dorapportage | dossierid | dossier | dossierid |
| dorechtenALL | dossierid | dossier | dossierid |
| dorechtenALL | gebruikerid | Gebruiker | gebruikerid |
| DossierDocument | documentid | Document | documentid |
| DossierDocument | dossierlaagid | DossierLaag | dossierlaagid |
| DossierDocument | dossieronderdeelid | DossierOnderdeel | dossieronderdeelid |
| dossierduur | dossierid | dossier | dossierid |
| dossiergrid | dossierid | dossier | dossierid |
| dossierIndexed | dossierid | dossier | dossierid |
| DossierOnderdeel | dossierlaagid | DossierLaag | dossierlaagid |
| DossierOnderdeel | relatieid | Relatie | relatieid |
| dossierregel | dossierid | dossier | dossierid |
| dotarief | dossierid | dossier | dossierid |
| doversie | dossierid | dossier | dossierid |
| dowilnaar | dossierid | dossier | dossierid |
| doWisselingen | dossierid | dossier | dossierid |
| dozaansluiting | dossierid | dossier | dossierid |
| dozaansluiting | statusid | Status | statusid |
| doznummer | dossierid | dossier | dossierid |
| doznummer | relatieid | Relatie | relatieid |
| Eigenschap | eigenschapgroepid | EigenschapGroep | eigenschapgroepid |
| Eigenschap | eigenschapsoortid | EigenschapSoort | eigenschapsoortid |
| Eigenschap | kenmerkomschrijvingid | KenmerkOmschrijving | kenmerkomschrijvingid |
| EigenschapComponent | eigenschapid | Eigenschap | eigenschapid |
| EigenschapComponentDefault | eigenschapcomponentid | EigenschapComponent | eigenschapcomponentid |
| EigenschapComponentDefault | eigenschaptoepassingid | EigenschapToepassing | eigenschaptoepassingid |
| EigenschapComponentDefault | gebruikerid | Gebruiker | gebruikerid |
| EigenschapComponentLijst | eigenschapcomponentid | EigenschapComponent | eigenschapcomponentid |
| EigenschapComponentLijst | eigenschaplijstid | EigenschapLijst | eigenschaplijstid |
| EigenschapDefault | eigenschapdefaultmethodeid | EigenschapDefaultMethode | eigenschapdefaultmethodeid |
| EigenschapDefault | eigenschapid | Eigenschap | eigenschapid |
| EigenschapDefault | eigenschaptoepassingid | EigenschapToepassing | eigenschaptoepassingid |
| EigenschapDefault | gebruikerid | Gebruiker | gebruikerid |
| EigenschapGebruik | eigenschapid | Eigenschap | eigenschapid |
| EigenschapGebruik | eigenschaptoepassingid | EigenschapToepassing | eigenschaptoepassingid |
| EigenschapLijst | eigenschapid | Eigenschap | eigenschapid |
| EigenschapLijst | eigenschaptoepassingid | EigenschapToepassing | eigenschaptoepassingid |
| EigenschapLijst | gebruikerid | Gebruiker | gebruikerid |
| EigenschapOpschrift | eigenschapcomponentid | EigenschapComponent | eigenschapcomponentid |
| EigenschapOpschrift | taalid | Taal | taalid |
| EmailDomein | classificatieid | Classificatie | classificatieid |
| EmailOnderwerp | classificatieid | Classificatie | classificatieid |
| EmailRichting | taalid | Taal | taalid |
| GebruikerRegister | gebruikerid | Gebruiker | gebruikerid |
| gecall | gebruikerid | Gebruiker | gebruikerid |
| gecalllog | statusid | Status | statusid |
| GegevensBestand | applicatietabelid | ApplicatieTabel | applicatietabelid |
| GegevensBestandKolom | applicatietabelkolomid | ApplicatieTabelKolom | applicatietabelkolomid |
| GegevensBestandKolom | gegevensbestandid | GegevensBestand | gegevensbestandid |
| gelook | dossierid | dossier | dossierid |
| gequePrint | statusid | Status | statusid |
| gequeue | gebruikerid | Gebruiker | gebruikerid |
| gescan | dossierid | dossier | dossierid |
| gescan | relatieid | Relatie | relatieid |
| HulpApplicatie | hulpapplicatiesoortid | HulpApplicatiesoort | hulpapplicatiesoortid |
| HulpApplicatieEigenschap | hulpapplicatieid | HulpApplicatie | hulpapplicatieid |
| HulpApplicatieInstelling | gebruikerid | Gebruiker | gebruikerid |
| HulpApplicatieInstelling | hulpapplicatieid | HulpApplicatie | hulpapplicatieid |
| HulpApplicatieInstelling | hulpapplicatietoepassingid | HulpApplicatieToepassing | hulpapplicatietoepassingid |
| HulpApplicatieToepassing | hulpapplicatiesoortid | HulpApplicatiesoort | hulpapplicatiesoortid |
| iladministratie | relatieid | Relatie | relatieid |
| ilcertificaat | gebruikerid | Gebruiker | gebruikerid |
| ilfase | gebruikerid | Gebruiker | gebruikerid |
| ilgebied | gebruikerid | Gebruiker | gebruikerid |
| ilgebruiker | gebruikerid | Gebruiker | gebruikerid |
| ilgebruiker | relatieid | Relatie | relatieid |
| ilgebruikers | gebruikerid | Gebruiker | gebruikerid |
| ilgebruikersWR | gebruikerid | Gebruiker | gebruikerid |
| ilgebruiksrecht | gebruikerid | Gebruiker | gebruikerid |
| ilmail | gebruikerid | Gebruiker | gebruikerid |
| ilprotocoller | gebruikerid | Gebruiker | gebruikerid |
| ilsamenwerking | gebruikerid | Gebruiker | gebruikerid |
| ilsignaal | gebruikerid | Gebruiker | gebruikerid |
| imbudgetpost | rekeningid | Rekening | rekeningid |
| imbudgetpostniet | imbudgetpostid | imbudgetpost | imbudgetpostid |
| inberichtdocument | documentid | Document | documentid |
| inchecklist | wusformulierid | wusformulier | wusformulierid |
| inDossierInregelingen | dossierid | dossier | dossierid |
| Inhoud | inhoudsoortid | InhoudSoort | inhoudsoortid |
| InhoudLokatie | inhoudid | Inhoud | inhoudid |
| InhoudLokatie | lokatieid | Lokatie | lokatieid |
| InhoudSoortOpslag | gebruikerid | Gebruiker | gebruikerid |
| InhoudSoortOpslag | inhoudsoortid | InhoudSoort | inhoudsoortid |
| InhoudSoortOpslag | opslagmethodeid | OpslagMethode | opslagmethodeid |
| InhoudTekst | inhoudid | Inhoud | inhoudid |
| InhoudTekst | ocrsessieid | OCRSessie | ocrsessieid |
| InhoudTekstWoord | inhoudtekstid | InhoudTekst | inhoudtekstid |
| InhoudTekstWoord | woordid | Woord | woordid |
| InhoudWoord | inhoudid | Inhoud | inhoudid |
| InhoudWoord | woordid | Woord | woordid |
| inmapstructuur | mapid | Map | mapid |
| inprocedures | gebruikerid | Gebruiker | gebruikerid |
| intaak | rekeningid | Rekening | rekeningid |
| intaakinregeling | intaakid | intaak | intaakid |
| intermijn | statusid | Status | statusid |
| inverzandel | inberichtid | inbericht | inberichtid |
| inverzamel | inberichtid | inbericht | inberichtid |
| inxinkomend | dossierid | dossier | dossierid |
| KenmerkOmschrijving | applicatiedatatypeid | ApplicatieDatatype | applicatiedatatypeid |
| KenmerkOmschrijvingWaarde | kenmerkomschrijvingid | KenmerkOmschrijving | kenmerkomschrijvingid |
| KenmerkWaarde | documentid | Document | documentid |
| KenmerkWaarde | kenmerkomschrijvingid | KenmerkOmschrijving | kenmerkomschrijvingid |
| licentiestatistics | dossierid | dossier | dossierid |
| Lokatie | serverid | Server | serverid |
| LokatieBestandNaam | eigenschapcomponentid | EigenschapComponent | eigenschapcomponentid |
| LokatieBestandNaam | lokatieid | Lokatie | lokatieid |
| LokatieMap | eigenschapcomponentid | EigenschapComponent | eigenschapcomponentid |
| LokatieMap | lokatieid | Lokatie | lokatieid |
| MailroomAfzenderTekst | mailroomafzenderid | MailroomAfzender | mailroomafzenderid |
| MailroomAfzenderTekstAlias | mailroomafzendertekstid | MailroomAfzenderTekst | mailroomafzendertekstid |
| MailroomAnalyseRelatie | mailroomanalysezoeklijstid | MailroomAnalyseZoeklijst | mailroomanalysezoeklijstid |
| MailroomAnalyseRelatie | relatieid | Relatie | relatieid |
| MailroomAnalyseSjabloon | mailroomsjabloonid | MailroomSjabloon | mailroomsjabloonid |
| MailroomAnalyseTekstDeel | mailroomsjabloonid | MailroomSjabloon | mailroomsjabloonid |
| MailroomAnalyseTekstPositie | mailroomsjabloonid | MailroomSjabloon | mailroomsjabloonid |
| MailroomAnalyseTekstRegel | mailroomsjabloonid | MailroomSjabloon | mailroomsjabloonid |
| MailroomAnalyseZoeklijst | mailroomsjabloonid | MailroomSjabloon | mailroomsjabloonid |
| MailroomAnalyseZoeklijst | mailroomsjabloonzoeklijstid | MailroomSjabloonZoekLijst | mailroomsjabloonzoeklijstid |
| MailroomAnalyseZoekveld | mailroomanalysezoeklijstid | MailroomAnalyseZoeklijst | mailroomanalysezoeklijstid |
| MailroomAnalyseZoekveld | mailroomsjabloonzoekveldid | MailroomSjabloonZoekVeld | mailroomsjabloonzoekveldid |
| MailroomAnalyseZoekwoord | mailroomanalysezoekveldid | MailroomAnalyseZoekveld | mailroomanalysezoekveldid |
| MailroomAnalyseZoekwoord | mailroomzoekwoordid | MailroomZoekwoord | mailroomzoekwoordid |
| MailroomDocument | documentid | Document | documentid |
| MailroomDocument | mailroomafzendertekstid | MailroomAfzenderTekst | mailroomafzendertekstid |
| MailroomDocument | mailroombatchid | MailroomBatch | mailroombatchid |
| MailroomDocumentRelatie | mailroomdocumentid | MailroomDocument | mailroomdocumentid |
| MailroomDocumentRelatie | mailroomsjabloonzoeklijstid | MailroomSjabloonZoekLijst | mailroomsjabloonzoeklijstid |
| MailroomDocumentRelatie | relatieid | Relatie | relatieid |
| MailroomDocumentRelatieEigenschap | mailroomdocumentid | MailroomDocument | mailroomdocumentid |
| MailroomDocumentRelatieEigenschap | mailroomeigenschapgroepid | MailroomEigenschapGroep | mailroomeigenschapgroepid |
| MailroomDocumentRelatieEigenschap | relatieid | Relatie | relatieid |
| MailroomDocumentZoneTekst | mailroomdocumentid | MailroomDocument | mailroomdocumentid |
| MailroomDocumentZoneTekst | mailroomzonetypeid | MailroomZoneType | mailroomzonetypeid |
| MailroomEigenschap | mailroomeigenschaptypeid | MailroomEigenschapType | mailroomeigenschaptypeid |
| MailroomEigenschapGroepLid | mailroomeigenschapgroepid | MailroomEigenschapGroep | mailroomeigenschapgroepid |
| MailroomEigenschapGroepLid | mailroomeigenschapid | MailroomEigenschap | mailroomeigenschapid |
| MailroomRelatieZoekwoord | mailroomeigenschapgroepid | MailroomEigenschapGroep | mailroomeigenschapgroepid |
| MailroomRelatieZoekwoord | mailroomzoekwoordid | MailroomZoekwoord | mailroomzoekwoordid |
| MailroomRelatieZoekwoord | relatieid | Relatie | relatieid |
| MailroomSjabloon | classificatieid | Classificatie | classificatieid |
| MailroomSjabloon | inhoudid | Inhoud | inhoudid |
| MailroomSjabloon | mailroomafzenderid | MailroomAfzender | mailroomafzenderid |
| MailroomSjabloon | mailroomafzendertekstid | MailroomAfzenderTekst | mailroomafzendertekstid |
| MailroomSjabloon | mailroomzoeklijstgroepid | MailroomZoeklijstGroep | mailroomzoeklijstgroepid |
| MailroomSjabloon | statusid | Status | statusid |
| MailroomSjabloonGroepLid | mailroomsjabloongroepid | MailroomSjabloonGroep | mailroomsjabloongroepid |
| MailroomSjabloonGroepLid | mailroomsjabloonid | MailroomSjabloon | mailroomsjabloonid |
| MailroomSjabloonTekstAlias | mailroomsjabloonzoneid | MailroomSjabloonZone | mailroomsjabloonzoneid |
| MailroomSjabloonZoekLijst | mailroomsjabloonid | MailroomSjabloon | mailroomsjabloonid |
| MailroomSjabloonZoekVeld | mailroomeigenschapgroepid | MailroomEigenschapGroep | mailroomeigenschapgroepid |
| MailroomSjabloonZoekVeld | mailroomsjabloonzoeklijstid | MailroomSjabloonZoekLijst | mailroomsjabloonzoeklijstid |
| MailroomSjabloonZoekView | mailroomeigenschapgroepid | MailroomEigenschapGroep | mailroomeigenschapgroepid |
| MailroomSjabloonZoekView | mailroomeigenschapid | MailroomEigenschap | mailroomeigenschapid |
| MailroomSjabloonZoekView | mailroomeigenschaptypeid | MailroomEigenschapType | mailroomeigenschaptypeid |
| MailroomSjabloonZoekView | mailroomsjabloonid | MailroomSjabloon | mailroomsjabloonid |
| MailroomSjabloonZoekView | mailroomsjabloonzoeklijstid | MailroomSjabloonZoekLijst | mailroomsjabloonzoeklijstid |
| MailroomSjabloonZoekView | mailroomsjabloonzoekveldid | MailroomSjabloonZoekVeld | mailroomsjabloonzoekveldid |
| MailroomSjabloonZone | mailroomsjabloonid | MailroomSjabloon | mailroomsjabloonid |
| MailroomSjabloonZone | mailroomzonetypeid | MailroomZoneType | mailroomzonetypeid |
| MailroomTekstNietAlias | mailroomtekstnietid | MailroomTekstNiet | mailroomtekstnietid |
| MailroomZoekLijst | mailroomzoeklijstgroepid | MailroomZoeklijstGroep | mailroomzoeklijstgroepid |
| MailroomZoekVeld | mailroomeigenschapgroepid | MailroomEigenschapGroep | mailroomeigenschapgroepid |
| MailroomZoekVeld | mailroomzoeklijstid | MailroomZoekLijst | mailroomzoeklijstid |
| MailroomZoekwoord | mailroomeigenschapgroepid | MailroomEigenschapGroep | mailroomeigenschapgroepid |
| MailroomZoekwoordAlias | mailroomeigenschapgroepid | MailroomEigenschapGroep | mailroomeigenschapgroepid |
| MailroomZoekwoordAlias | mailroomzoekwoordid | MailroomZoekwoord | mailroomzoekwoordid |
| MailroomZoekwoordTijdelijk | mailroomzoekwoordid | MailroomZoekwoord | mailroomzoekwoordid |
| MailroomZoekwoordUitzondering | mailroomeigenschapgroepid | MailroomEigenschapGroep | mailroomeigenschapgroepid |
| mgbudgetpost | dossierid | dossier | dossierid |
| mgbudgetpost | imbudgetpostid | imbudgetpost | imbudgetpostid |
| mgbudgetpost | statusid | Status | statusid |
| mgcommunicatie | dossierid | dossier | dossierid |
| mgcommunicatie | relatieid | Relatie | relatieid |
| mgdoelstelling | dossierid | dossier | dossierid |
| mginventarisatie | dossierid | dossier | dossierid |
| mglook | mgcommunicatieid | mgcommunicatie | mgcommunicatieid |
| mglooker | relatieid | Relatie | relatieid |
| mgvolledig | dossierid | dossier | dossierid |
| mgwerkafspraak | dossierid | dossier | dossierid |
| OCRSessie | gebruikerid | Gebruiker | gebruikerid |
| OpdrachtLinkBestandNaam | eigenschapcomponentid | EigenschapComponent | eigenschapcomponentid |
| OpdrachtLinkMap | eigenschapcomponentid | EigenschapComponent | eigenschapcomponentid |
| ow600Bewindvoerders | dossierid | dossier | dossierid |
| ow600Bewindvoerders | relatieid | Relatie | relatieid |
| ow600inkomsteuitgave | dossierid | dossier | dossierid |
| OW600Klanten | dossierid | dossier | dossierid |
| OW600Klanten | relatieid | Relatie | relatieid |
| ow695refref | dossierid | dossier | dossierid |
| ow695refref | relatieid | Relatie | relatieid |
| ow696intake | dossierid | dossier | dossierid |
| ow696sub | dossierid | dossier | dossierid |
| ow696sub | inberichtid | inbericht | inberichtid |
| ow696sub | relatieid | Relatie | relatieid |
| ow696zitting | dossierid | dossier | dossierid |
| ow710laatsteA | dossierid | dossier | dossierid |
| ow969beheerrek | dossierid | dossier | dossierid |
| ow969gestuurdINEINDE | dossierid | dossier | dossierid |
| ow969lopendeBeheersvergoeding | dossierid | dossier | dossierid |
| ow969lopendeperiodieken | dossierid | dossier | dossierid |
| ow969nogbetalen | dossierid | dossier | dossierid |
| rapportagekantonALLsub | dossierid | dossier | dossierid |
| RechtenClassificatie | classificatieid | Classificatie | classificatieid |
| RechtenClassificatie | gebruikerid | Gebruiker | gebruikerid |
| RechtenClassificatie | rechtenniveauid | RechtenNiveau | rechtenniveauid |
| RechtenGebruikerFunctionaliteit | gebruikerid | Gebruiker | gebruikerid |
| RechtenGebruikerFunctionaliteit | rechtenfunctionaliteitid | RechtenFunctionaliteit | rechtenfunctionaliteitid |
| RegisterEigenschapComponentLijst | eigenschapcomponentid | EigenschapComponent | eigenschapcomponentid |
| RegisterEigenschapComponentLijst | registereigenschaplijstid | RegisterEigenschapLijst | registereigenschaplijstid |
| RegisterEigenschapLijst | eigenschapdefaultmethodeid | EigenschapDefaultMethode | eigenschapdefaultmethodeid |
| RegisterEigenschapLijst | eigenschapid | Eigenschap | eigenschapid |
| RegisterEigenschapLijst | registerinstellingwaardeid | RegisterInstellingWaarde | registerinstellingwaardeid |
| RegisterGrid | gebruikerid | Gebruiker | gebruikerid |
| RegisterInstellingComponentDefault | eigenschapcomponentid | EigenschapComponent | eigenschapcomponentid |
| RegisterInstellingComponentDefault | eigenschaptoepassingid | EigenschapToepassing | eigenschaptoepassingid |
| RegisterInstellingComponentDefault | registerinstellingwaardeid | RegisterInstellingWaarde | registerinstellingwaardeid |
| RegisterInstellingComponentLijst | eigenschapcomponentid | EigenschapComponent | eigenschapcomponentid |
| RegisterInstellingComponentLijst | registerinstellinglijstid | RegisterInstellingLijst | registerinstellinglijstid |
| RegisterInstellingDefault | eigenschapdefaultmethodeid | EigenschapDefaultMethode | eigenschapdefaultmethodeid |
| RegisterInstellingDefault | eigenschapid | Eigenschap | eigenschapid |
| RegisterInstellingDefault | eigenschaptoepassingid | EigenschapToepassing | eigenschaptoepassingid |
| RegisterInstellingDefault | registerinstellingwaardeid | RegisterInstellingWaarde | registerinstellingwaardeid |
| RegisterInstellingGebruiker | registerinstellingwaardeid | RegisterInstellingWaarde | registerinstellingwaardeid |
| RegisterInstellingGrid | registerinstellingwaardeid | RegisterInstellingWaarde | registerinstellingwaardeid |
| RegisterInstellingLijst | eigenschapid | Eigenschap | eigenschapid |
| RegisterInstellingLijst | eigenschaptoepassingid | EigenschapToepassing | eigenschaptoepassingid |
| RegisterInstellingLijst | registerinstellingwaardeid | RegisterInstellingWaarde | registerinstellingwaardeid |
| RegisterInstellingToepassing | registerinstellingsoortid | RegisterInstellingSoort | registerinstellingsoortid |
| RegisterInstellingWaarde | gebruikerid | Gebruiker | gebruikerid |
| RegisterInstellingWaarde | registerinstellingtoepassingid | RegisterInstellingToepassing | registerinstellingtoepassingid |
| RegisterOpslaanAutomatisch | documentsoortid | DocumentSoort | documentsoortid |
| RegisterOpslaanAutomatisch | gebruikerid | Gebruiker | gebruikerid |
| RegisterOpslaanAutomatisch | routeid | Route | routeid |
| rladres | dossierid | dossier | dossierid |
| rladres | relatieid | Relatie | relatieid |
| rlafdeling | relatieid | Relatie | relatieid |
| rlatie | relatieid | Relatie | relatieid |
| RLEmails | gebruikerid | Gebruiker | gebruikerid |
| rlfavoriet | gebruikerid | Gebruiker | gebruikerid |
| rlfavoriet | relatieid | Relatie | relatieid |
| rlfavorieten | gebruikerid | Gebruiker | gebruikerid |
| rlfavorieten | relatieid | Relatie | relatieid |
| rlinformatie | relatieid | Relatie | relatieid |
| RLKlantkanton | dossierid | dossier | dossierid |
| RLKlantkanton | relatieid | Relatie | relatieid |
| RLKlantkantonALL | dossierid | dossier | dossierid |
| RLKlantkantonALL | relatieid | Relatie | relatieid |
| rlnaamlabel | relatieid | Relatie | relatieid |
| rlnummer | relatieid | Relatie | relatieid |
| rlnummersAllA | relatieid | Relatie | relatieid |
| rlorganisatie | relatieid | Relatie | relatieid |
| rlpersoon | relatieid | Relatie | relatieid |
| rlpgbnummers | relatieid | Relatie | relatieid |
| RLrelatiewerkzaamid | relatieid | Relatie | relatieid |
| rlverwijzers | dossierid | dossier | dossierid |
| rlverwijzers | relatieid | Relatie | relatieid |
| rlxkanton | relatieid | Relatie | relatieid |
| RouteStap | routeid | Route | routeid |
| RouteStapGebruiker | gebruikerid | Gebruiker | gebruikerid |
| RouteStapGebruiker | routestapid | RouteStap | routestapid |
| SamenvoegSessie | gebruikerid | Gebruiker | gebruikerid |
| SessieControlePunt | controlepuntid | ControlePunt | controlepuntid |
| SessieControlePunt | documentid | Document | documentid |
| SessieControlePunt | samenvoegsessieid | SamenvoegSessie | samenvoegsessieid |
| SyncDatabase | syncdatabasesoortid | SyncDatabaseSoort | syncdatabasesoortid |
| SyncMapping | syncopdrachtid | SyncOpdracht | syncopdrachtid |
| SyncOpdracht | syncscriptid | SyncScript | syncscriptid |
| SyncOpdrachtKolom | syncopdrachtid | SyncOpdracht | syncopdrachtid |
| SyncScript | syncmethodeid | SyncMethode | syncmethodeid |
| tkaap | dossierid | dossier | dossierid |
| tkactie | dossierid | dossier | dossierid |
| tkagenda | dossierid | dossier | dossierid |
| tkagendadagen | gebruikerid | Gebruiker | gebruikerid |
| tkagendaregels | gebruikerid | Gebruiker | gebruikerid |
| tkagendaregels | relatieid | Relatie | relatieid |
| tkbericht | inberichtid | inbericht | inberichtid |
| tkberichtdata | dossierid | dossier | dossierid |
| tkberichtdossier | dossierid | dossier | dossierid |
| tkberichtdossier | relatieid | Relatie | relatieid |
| tkberichtnietklaar | statusid | Status | statusid |
| tkberichtrol | gebruikerid | Gebruiker | gebruikerid |
| tkberichtrol | relatieid | Relatie | relatieid |
| tkberichtrol | statusid | Status | statusid |
| tkbetrokken | gebruikerid | Gebruiker | gebruikerid |
| tkbetrokken | relatieid | Relatie | relatieid |
| tkbetrokken | statusid | Status | statusid |
| tkchecklist | inchecklistid | inchecklist | inchecklistid |
| tkchecklist | statusid | Status | statusid |
| tkgeescaleerdeacties | dossierid | dossier | dossierid |
| tkmailinglist | dossierid | dossier | dossierid |
| tkmailinglist | relatieid | Relatie | relatieid |
| tkmailinglist | statusid | Status | statusid |
| tkmemo | dossierid | dossier | dossierid |
| tkmemo | relatieid | Relatie | relatieid |
| tknotitie | dossierid | dossier | dossierid |
| tkpad | dossierid | dossier | dossierid |
| tkpgbperiode | dossierid | dossier | dossierid |
| tkprocedure | dossierid | dossier | dossierid |
| tkprocedure | relatieid | Relatie | relatieid |
| tkprocedure1 | dossierid | dossier | dossierid |
| tkprocedure1 | relatieid | Relatie | relatieid |
| tkprocedure2 | dossierid | dossier | dossierid |
| tkprocedure2 | relatieid | Relatie | relatieid |
| tkregelingenA | dossierid | dossier | dossierid |
| tkrooster | gebruikerid | Gebruiker | gebruikerid |
| tksignaal | gebruikerid | Gebruiker | gebruikerid |
| tkspam | inberichtid | inbericht | inberichtid |
| tkspam | statusid | Status | statusid |
| tktaak | dossierid | dossier | dossierid |
| tktaak | intaakid | intaak | intaakid |
| tktaak | relatieid | Relatie | relatieid |
| tktaakdata | dossierid | dossier | dossierid |
| tktelefoon | dossierid | dossier | dossierid |
| tktelefoon | relatieid | Relatie | relatieid |
| tktelefoon | statusid | Status | statusid |
| tktelefoonverwerkt | dossierid | dossier | dossierid |
| tktermijn | dossierid | dossier | dossierid |
| kteverzenden | statusid | Status | statusid |
| tktoewijzing | dossierid | dossier | dossierid |
| tktoewijzing | gebruikerid | Gebruiker | gebruikerid |
| tkvernieuwd | gebruikerid | Gebruiker | gebruikerid |
| tkverzamel | dossierid | dossier | dossierid |
| tkverzamel | relatieid | Relatie | relatieid |
| tkxgemeente | relatieid | Relatie | relatieid |
| tkxrooster | gebruikerid | Gebruiker | gebruikerid |
| ToegangEigenschap | eigenschapid | Eigenschap | eigenschapid |
| ToegangEigenschapGebruiker | gebruikerid | Gebruiker | gebruikerid |
| ToegangEigenschapGebruiker | toegangeigenschapid | ToegangEigenschap | toegangeigenschapid |
| udbureaublad | gebruikerid | Gebruiker | gebruikerid |
| uddoslog | dossierid | dossier | dossierid |
| uddoslog | gebruikerid | Gebruiker | gebruikerid |
| udexeclog | gebruikerid | Gebruiker | gebruikerid |
| udftplog | gebruikerid | Gebruiker | gebruikerid |
| udquerylog | gebruikerid | Gebruiker | gebruikerid |
| udrooster | gebruikerid | Gebruiker | gebruikerid |
| uduserbutton | gebruikerid | Gebruiker | gebruikerid |
| uduserlog | gebruikerid | Gebruiker | gebruikerid |
| Vertaling | opschriftid | Opschrift | opschriftid |
| Vertaling | taalid | Taal | taalid |
| vLijstjeOpen | dossierid | dossier | dossierid |
| vLijstjeOpen | gebruikerid | Gebruiker | gebruikerid |
| vLijstjeTW | dossierid | dossier | dossierid |
| vLijstjeTW | gebruikerid | Gebruiker | gebruikerid |
| wachtlijstVerwijzerA | dossierid | dossier | dossierid |
| wachtlijstVerwijzerA | inberichtid | inbericht | inberichtid |
| WorkflowArchiveerOpmerking | gebruikerid | Gebruiker | gebruikerid |
| WorkflowGebruikerOpmerking | gebruikerid | Gebruiker | gebruikerid |
| WorkflowGebruikerStapNaam | gebruikerid | Gebruiker | gebruikerid |
| wscache | gebruikerid | Gebruiker | gebruikerid |
| wsrespons | dossierid | dossier | dossierid |
| wusbericht | dossierid | dossier | dossierid |
| wuscommunicatie | dossierid | dossier | dossierid |
| wuscommunicatie | wusberichtid | wusbericht | wusberichtid |
| wuscommunicatie | wuserviceid | wuservice | wuserviceid |
| wusformulierband | wusformulierid | wusformulier | wusformulierid |
| wusformulierbron | wusformulierid | wusformulier | wusformulierid |
| wusformuliergegeven | wusformulierid | wusformulier | wusformulierid |
| wusformulierlogica | wusformulierid | wusformulier | wusformulierid |
| wusformulieropbouw | wusformulierid | wusformulier | wusformulierid |
| wuslogboek | wusberichtid | wusbericht | wusberichtid |
| wuslogboek | wuserviceid | wuservice | wuserviceid |
| wustag | wuserviceid | wuservice | wuserviceid |

## Waarschijnlijke foreign keys (60, controleer handmatig)

| Tabel | Kolom | Verwijst naar | Refererende kolom | Match |
|---|---|---|---|---|
| a5presinhoud | presinhoudid | Inhoud | inhoudid | suffix-match (presinhoud eindigt op inhoud) |
| a5trefwoord | trefwoordid | Woord | woordid | suffix-match (trefwoord eindigt op woord) |
| adboekhouddossiers | bhdossierid | dossier | dossierid | suffix-match (bhdossier eindigt op dossier) |
| adboekregel | vandossierid | dossier | dossierid | suffix-match (vandossier eindigt op dossier) |
| adkruisboekregel | vandossierid | dossier | dossierid | suffix-match (vandossier eindigt op dossier) |
| adprognose | eigenstatusid | Status | statusid | suffix-match (eigenstatus eindigt op status) |
| adxgrootboek | activarekeningid | Rekening | rekeningid | suffix-match (activarekening eindigt op rekening) |
| adxgrootboek | bankrekeningid | Rekening | rekeningid | suffix-match (bankrekening eindigt op rekening) |
| adxgrootboek | kostenrekeningid | Rekening | rekeningid | suffix-match (kostenrekening eindigt op rekening) |
| adxschuldstatus | schuldstatusid | Status | statusid | suffix-match (schuldstatus eindigt op status) |
| BarcodeVel | defaultclassificatieid | Classificatie | classificatieid | suffix-match (defaultclassificatie eindigt op classificatie) |
| BarcodeVel | defaultdocumentsoortid | DocumentSoort | documentsoortid | suffix-match (defaultdocumentsoort eindigt op documentsoort) |
| cmprijslijst | bezoekrekeningid | Rekening | rekeningid | suffix-match (bezoekrekening eindigt op rekening) |
| cmprijslijst | kilometerrekeningid | Rekening | rekeningid | suffix-match (kilometerrekening eindigt op rekening) |
| cmtarief | grootboekrekeningid | Rekening | rekeningid | suffix-match (grootboekrekening eindigt op rekening) |
| cmtoeslag | bankrekeningid | Rekening | rekeningid | suffix-match (bankrekening eindigt op rekening) |
| dmdocument | xdocumentid | Document | documentid | suffix-match (xdocument eindigt op document) |
| dmscanboekenals | xdocumentid | Document | documentid | suffix-match (xdocument eindigt op document) |
| dmxdocument | xdocumentid | Document | documentid | suffix-match (xdocument eindigt op document) |
| dmxmap | xdocumentid | Document | documentid | suffix-match (xdocument eindigt op document) |
| dmxocrdocument | xdocumentid | Document | documentid | suffix-match (xdocument eindigt op document) |
| dmxocrmapping | xdocumentid | Document | documentid | suffix-match (xdocument eindigt op document) |
| Document | afzendergebruikerid | Gebruiker | gebruikerid | suffix-match (afzendergebruiker eindigt op gebruiker) |
| Document | blokkerendegebruikerid | Gebruiker | gebruikerid | suffix-match (blokkerendegebruiker eindigt op gebruiker) |
| Document | routestartgebruikerid | Gebruiker | gebruikerid | suffix-match (routestartgebruiker eindigt op gebruiker) |
| Document | tekstinhoudid | Inhoud | inhoudid | suffix-match (tekstinhoud eindigt op inhoud) |
| DocumentControlePunt | afvinkgebruikerid | Gebruiker | gebruikerid | suffix-match (afvinkgebruiker eindigt op gebruiker) |
| DocumentHistorie | handelinggebruikerid | Gebruiker | gebruikerid | suffix-match (handelinggebruiker eindigt op gebruiker) |
| DocumentHistorie | handelingroutestapid | RouteStap | routestapid | suffix-match (handelingroutestap eindigt op routestap) |
| DocumentRouteStap | doorstuurgebruikerid | Gebruiker | gebruikerid | suffix-match (doorstuurgebruiker eindigt op gebruiker) |
| DocumentWorkflowStap | doorstuurgebruikerid | Gebruiker | gebruikerid | suffix-match (doorstuurgebruiker eindigt op gebruiker) |
| dogrid2 | tweedossierid | dossier | dossierid | suffix-match (tweedossier eindigt op dossier) |
| doovergenomen | hundossierid | dossier | dossierid | suffix-match (hundossier eindigt op dossier) |
| doovergenomen | hunrelatieid | Relatie | relatieid | suffix-match (hunrelatie eindigt op relatie) |
| doovergenomenuser | hungebruikerid | Gebruiker | gebruikerid | suffix-match (hungebruiker eindigt op gebruiker) |
| dossiergrid | tweedossierid | dossier | dossierid | suffix-match (tweedossier eindigt op dossier) |
| DossierLaag | bovendossierlaagid | DossierLaag | dossierlaagid | suffix-match (bovendossierlaag eindigt op dossierlaag) |
| DossierOnderdeel | bovendossieronderdeelid | DossierOnderdeel | dossieronderdeelid | suffix-match (bovendossieronderdeel eindigt op dossieronderdeel) |
| dosubdossiersA | rootdossierid | dossier | dossierid | suffix-match (rootdossier eindigt op dossier) |
| dosubdossiersB | rootdossierid | dossier | dossierid | suffix-match (rootdossier eindigt op dossier) |
| dosubdossiersC | rootdossierid | dossier | dossierid | suffix-match (rootdossier eindigt op dossier) |
| gelook | meekijkdossierid | dossier | dossierid | suffix-match (meekijkdossier eindigt op dossier) |
| gescan | xdocumentid | Document | documentid | suffix-match (xdocument eindigt op document) |
| gexcallstatus | callstatusid | Status | statusid | suffix-match (callstatus eindigt op status) |
| ilsamenwerking | metgebruikerid | Gebruiker | gebruikerid | suffix-match (metgebruiker eindigt op gebruiker) |
| imxafspraakstatus | imafspraakstatusid | Status | statusid | suffix-match (imafspraakstatus eindigt op status) |
| intaak | startstatusid | Status | statusid | suffix-match (startstatus eindigt op status) |
| intaak | taakrelatieid | Relatie | relatieid | suffix-match (taakrelatie eindigt op relatie) |
| MailroomSjabloon | defaultdocumentsoortid | DocumentSoort | documentsoortid | suffix-match (defaultdocumentsoort eindigt op documentsoort) |
| MailroomZoekwoordTijdelijk | referentierelatieid | Relatie | relatieid | suffix-match (referentierelatie eindigt op relatie) |
| mgwerkafspraak | laatstewerkstatusid | Status | statusid | suffix-match (laatstewerkstatus eindigt op status) |
| RechtenFunctionaliteit | groeprechtenfunctionaliteitid | RechtenFunctionaliteit | rechtenfunctionaliteitid | suffix-match (groeprechtenfunctionaliteit eindigt op rechtenfunctionaliteit) |
| RegisterOpslaanAutomatisch | bestemminglokatieid | Lokatie | lokatieid | suffix-match (bestemminglokatie eindigt op lokatie) |
| rlnummer | bijrelatieid | Relatie | relatieid | suffix-match (bijrelatie eindigt op relatie) |
| SessieControlePunt | afvinkgebruikerid | Gebruiker | gebruikerid | suffix-match (afvinkgebruiker eindigt op gebruiker) |
| TabelVersheid | ingebruikgebruikerid | Gebruiker | gebruikerid | suffix-match (ingebruikgebruiker eindigt op gebruiker) |
| tktaak | startstatusid | Status | statusid | suffix-match (startstatus eindigt op status) |
| wusbericht | wusstatusid | Status | statusid | suffix-match (wusstatus eindigt op status) |
| wusformulier | formstatusid | Status | statusid | suffix-match (formstatus eindigt op status) |
| wuslogboek | wusstatusid | Status | statusid | suffix-match (wusstatus eindigt op status) |
