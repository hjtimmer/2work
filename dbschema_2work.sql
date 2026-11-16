BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS Afzender
 (
 AfzenderID number(10)
, EmailAdres Varchar2(750)
, RelatieID number(10)
);
CREATE TABLE IF NOT EXISTS ApplicatieDatatype
 (
 ApplicatieDatatypeID number(10)
, Naam Varchar2(150)
, LengteInstelbaar number(10)
, LengteMaximaal number(10)
, OpschriftKenmerk Varchar2(150)
);
CREATE TABLE IF NOT EXISTS ApplicatieKolomUniekheid
 (
 ApplicatieKolomUniekheidID number(10)
, Kenmerk Varchar2(12)
, OpschriftKenmerk Varchar2(300)
);
CREATE TABLE IF NOT EXISTS ApplicatieTabel
 (
 ApplicatieTabelID number(10)
, Naam Varchar2(150)
, Alias Varchar2(30)
);
CREATE TABLE IF NOT EXISTS ApplicatieTabelKolom
 (
 ApplicatieTabelKolomID number(10)
, ApplicatieTabelID number(10)
, Volgnummer number(10)
, Naam Varchar2(150)
, Opschrift Varchar2(300)
, ApplicatieDatatypeID number(10)
, VeldLengte number(10)
, WaardeDefault Varchar2(150)
, IsVerplicht number(10)
, ApplicatieKolomUniekheidID number(10)
, WordtGetoond number(10)
, DocumentKolomNaam Varchar2(150)
);
CREATE TABLE IF NOT EXISTS Barcode
 (
 BarcodeID number(10)
, BarcodeVelID number(10)
, Volgnummer number(10)
, EigenschapComponentID number(10)
, MoetBestaan number(10)
, TekenAantalMinimaal number(10)
, TekenAantalMaximaal number(10)
, MagLeegZijn number(10)
);
CREATE TABLE IF NOT EXISTS BarcodeLezer
 (
 BarcodeLezerID number(10)
, BarcodeVelID number(10)
, Coderingen number(10)
, BreedteExactControle number(10)
, BreedteExactWaarde float
, HoogteMinimaalControle number(10)
, HoogteMinimaalWaarde float
, MultiBandAnalyse number(10)
, WaardeDecodeer number(10)
, Orientatie number(10)
, RegioGebruik number(10)
, RegioLinkerkant float
, RegioBreedte float
, RegioBovenkant float
, RegioHoogte float
);
CREATE TABLE IF NOT EXISTS BarcodeRegio
 (
 BarcodeRegioID number(10)
, BarcodeVelID number(10)
, Volgnummer number(10)
, PositieLinkerkant number(10)
, PositieBovenkant number(10)
, Breedte number(10)
, Hoogte number(10)
);
CREATE TABLE IF NOT EXISTS BarcodeVel
 (
 BarcodeVelID number(10)
, Naam Varchar2(600)
, Beschrijving Varchar2(750)
, DefaultDocumentSoortID number(10)
, InhoudID number(10)
, ResolutieHorizontaal number(10)
, ResolutieVerticaal number(10)
, IsStandaardVel number(10)
, PostvakGebruikerApplKolomID number(10)
, NullVervanger Varchar2(12)
, RegioSjabloon Varchar2(250)
, RegioGebruiken number(10)
, OpslagDatum Varchar2(20)
, DefaultClassificatieID number(10)
, AfmetingHorizontaal number(10)
, AfmetingVerticaal number(10)
, BestandType Varchar2(30)
, HulpApplicatieID number(10)
, BestandSoort Varchar2(30)
);
CREATE TABLE IF NOT EXISTS BarcodeVelBestand
 (
 BarcodeVelBestandID number(10)
, BarcodeVelID number(10)
, Volgnummer number(10)
, Chunk number(10)
);
CREATE TABLE IF NOT EXISTS BarcodeVelOpmerking
 (
 BarcodeVelOpmerkingID number(10)
, BarcodeVelID number(10)
, Volgnummer number(10)
, Opmerking Varchar2(750)
);
CREATE TABLE IF NOT EXISTS BarcodeVelRegio
 (
 BarcodeVelRegioID number(10)
, BarcodeVelID number(10)
, Volgnummer number(10)
, PositieLinkerkant number(10)
, PositieBovenkant number(10)
, Breedte number(10)
, Hoogte number(10)
);
CREATE TABLE IF NOT EXISTS CaptureBarcode
 (
 CaptureBarcodeID number(10)
, GebruikerID number(10)
, Volgnummer number(10)
, Naam Varchar2(300)
, TekenAantalMinimaal number(10)
, TekenAantalMaximaal number(10)
, WordtVertaald number(10)
);
CREATE TABLE IF NOT EXISTS Classificatie
 (
 ClassificatieID number(10)
, Code Varchar2(150)
, Naam Varchar2(600)
, IsInGebruik number(10)
);
CREATE TABLE IF NOT EXISTS ClassificatieOpmerking
 (
 ClassificatieOpmerkingID number(10)
, ClassificatieID number(10)
, Volgnummer number(10)
, OpmerkingTekst Varchar2(750)
);
CREATE TABLE IF NOT EXISTS ClassificatieRED
 (
 ClassificatieREDID number(10)
, Code Varchar2(150)
, ClassificatieID number(10)
);
CREATE TABLE IF NOT EXISTS ControleLijst
 (
 ControleLijstID number(10)
, VolgNummer number(10)
, Code Varchar2(36)
, Naam Varchar2(300)
, IsInGebruik number(10)
);
CREATE TABLE IF NOT EXISTS ControlePunt
 (
 ControlePuntID number(10)
, ControleLijstID number(10)
, VolgNummer number(10)
, Code Varchar2(150)
, Naam Varchar2(150)
, IsInGebruik number(10)
, VervalDatum Varchar2(20)
);
CREATE TABLE IF NOT EXISTS DOData1
 (
 dosid number(10)
, regel number(10)
, dossierid number(10)
, versie number(10)
, p1 number(10)
, p2 number(10)
, p3 number(10)
, t1 Varchar2(750)
, t2 Varchar2(750)
, t3 Varchar2(750)
, t4 Varchar2(750)
, t5 Varchar2(750)
, t6 Varchar2(750)
, t7 Varchar2(750)
, t8 Varchar2(750)
, t9 Varchar2(750)
, m1 text
, m2 text
, m3 text
, m4 text
, m5 text
, l1 number(10)
, l2 number(10)
, l3 number(10)
, l4 number(10)
, l5 number(10)
, L6 number(10)
, l7 number(10)
, l8 number(10)
, l9 number(10)
, d1 Varchar2(20)
, d2 Varchar2(20)
, d7 Varchar2(20)
, d3 Varchar2(20)
, d4 Varchar2(20)
, d5 Varchar2(20)
, d6 Varchar2(20)
, s1 Number(36, 2)
, s2 Number(36, 2)
);
CREATE TABLE IF NOT EXISTS DOData2
 (
 dosid number(10)
, regel number(10)
, dossierid number(10)
, versie number(10)
, p1 number(10)
, p2 number(10)
, p3 number(10)
, t1 Varchar2(750)
, t2 Varchar2(750)
, t3 Varchar2(750)
, t4 Varchar2(750)
, t5 Varchar2(750)
, t6 Varchar2(750)
, t7 Varchar2(750)
, t8 Varchar2(750)
, t9 Varchar2(750)
, m1 text
, m2 text
, m3 text
, m4 text
, m5 text
, l1 number(10)
, l2 number(10)
, l3 number(10)
, l4 number(10)
, l5 number(10)
, L6 number(10)
, l7 number(10)
, l8 number(10)
, l9 number(10)
, d1 Varchar2(20)
, d2 Varchar2(20)
, d7 Varchar2(20)
, d3 Varchar2(20)
, d4 Varchar2(20)
, d5 Varchar2(20)
, d6 Varchar2(20)
, s1 Number(36, 2)
, s2 Number(36, 2)
);
CREATE TABLE IF NOT EXISTS DOData4
 (
 dosid number(10)
, regel number(10)
, dossierid number(10)
, versie number(10)
, p1 number(10)
, p2 number(10)
, p3 number(10)
, t1 Varchar2(750)
, t2 Varchar2(750)
, t3 Varchar2(750)
, t4 Varchar2(750)
, t5 Varchar2(750)
, t6 Varchar2(750)
, t7 Varchar2(750)
, t8 Varchar2(750)
, t9 Varchar2(750)
, m1 text
, m2 text
, m3 text
, m4 text
, m5 text
, l1 number(10)
, l2 number(10)
, l3 number(10)
, l4 number(10)
, l5 number(10)
, L6 number(10)
, l7 number(10)
, l8 number(10)
, l9 number(10)
, d1 Varchar2(20)
, d2 Varchar2(20)
, d7 Varchar2(20)
, d3 Varchar2(20)
, d4 Varchar2(20)
, d5 Varchar2(20)
, d6 Varchar2(20)
, s1 Number(36, 2)
, s2 Number(36, 2)
);
CREATE TABLE IF NOT EXISTS DocSoortKenmerkOmschrijving
 (
 DocSoortKenmerkOmschrijvingID number(10)
, DocumentSoortID number(10)
, KenmerkOmschrijvingID number(10)
);
CREATE TABLE IF NOT EXISTS Document
 (
 DocumentID number(10)
, EigenaarID number(10)
, ClassificatieID number(10)
, InhoudID number(10)
, RelatieID number(10)
, DocumentSoortID number(10)
, AanmaakDatum Varchar2(20)
, LaatstGewijzigdDatum Varchar2(20)
, IndexeerDatum Varchar2(20)
, StatusID number(10)
, ActieDatum Varchar2(20)
, RouteID number(10)
, StapNummer number(10)
, TussenstapNummer number(10)
, PaperclipID number(10)
, PaperclipVolgnummer number(10)
, RouteStartGebruikerID number(10)
, RouteStartDatum Varchar2(20)
, AfzenderGebruikerID number(10)
, DoorstuurDatum Varchar2(20)
, Opmerkingen Varchar2(250)
, TekstInhoudID number(10)
, BlokkerendeGebruikerID number(10)
, UrgentieNiveauNu number(10)
, DocumentIDGeformatteerd Varchar2(30)
, UrgentieNaam Varchar2(150)
, UrgentieKleur number(10)
, InhoudSoortID number(10)
, InhoudSoortExtensie Varchar2(36)
, InhoudSoortOmschrijving Varchar2(150)
, InhoudSoortMagWijzigen number(10)
, BestandNaam Varchar2(150)
, MapVolgnummer number(10)
, BestandNaamLang Varchar2(600)
, BestandNaamOorspronkelijk Varchar2(250)
, OpslagDatum Varchar2(20)
, LokatieID number(10)
, LokatieNaam Varchar2(150)
, EigenaarNaam Varchar2(300)
, DocumentSoortNaam Varchar2(150)
, ClassificatieCode Varchar2(150)
, ClassificatieNaam Varchar2(600)
, RelatieNaam Varchar2(600)
, DebiteurNummer Varchar2(150)
, CrediteurNummer Varchar2(150)
, StatusNaam Varchar2(150)
, AanmaakDatumGeformatteerd Varchar2(96)
, OpslagDatumGeformatteerd Varchar2(96)
, LtstGewzigdDatumGeformatteerd Varchar2(96)
, IndexeerDatumGeformatteerd Varchar2(96)
, WorkflowStatusIndex number(10)
, RouteCode Varchar2(30)
, RouteNaam Varchar2(150)
, RouteStartGebruikerNaam Varchar2(300)
, WorkflowStapNummer number(10)
, WorkflowStapNaam Varchar2(150)
, WorkflowStapOpmerking Varchar2(750)
, ActieDatumGeformatteerd Varchar2(96)
, WorkflowStapMagBlokkeren number(10)
, WorkflowHeeftVervolgStap number(10)
, BlokkerendeGebruikerNaam Varchar2(300)
, RouteStartDatumGeformatteerd Varchar2(96)
, PaperclipInhoudAantal number(10)
, PaperclipVertegenwoordiger number(10)
, EmailAdressen Varchar2(250)
, EmailRichting number(10)
, EmailIn number(10)
, EmailUit number(10)
, MailroomSjabloonID number(10)
, MailroomSjabloonNaam Varchar2(750)
, MailroomSjabloonBeschrijving Varchar2(750)
, MailroomAfzenderID number(10)
, MailroomAfzenderNaam Varchar2(150)
, Relatie_0019_Waarde Varchar2(150)
, Relatie_0020_Waarde Varchar2(150)
, Relatie_0021_Waarde Varchar2(150)
, Relatie_0022_Waarde Varchar2(150)
, Relatie_0023_Waarde Varchar2(150)
, Relatie_0024_Waarde Varchar2(150)
, Relatie_0025_Waarde Varchar2(150)
, Relatie_0026_Waarde Varchar2(150)
, Relatie_0027_Waarde Varchar2(150)
, Relatie_0028_Waarde Varchar2(150)
, Relatie_0029_Waarde Varchar2(150)
, Relatie_0030_Waarde Varchar2(150)
, Relatie_0031_Waarde Varchar2(150)
, Relatie_0032_Waarde Varchar2(150)
, Relatie_0033_Waarde Varchar2(150)
, Relatie_0034_Waarde Varchar2(150)
, Relatie_0035_Waarde Varchar2(150)
, Relatie_0036_Waarde Varchar2(150)
, Relatie_0037_Waarde Varchar2(150)
, Relatie_0038_Waarde Varchar2(150)
, Relatie_0039_Waarde Varchar2(150)
, Relatie_0040_Waarde Varchar2(150)
, Labels Varchar2(250)
, PostvakGebruikers Varchar2(250)
, InhoudSoortKenmerk Varchar2(3)
, InhoudSoortKleur number(10)
, Kenmerk_0001_ID number(10)
, Kenmerk_0001_Waarde Varchar2(750)
, KEI number(10)
, EmailAfzenderAdres Varchar2(250)
, EmailOntvangerAdres Varchar2(250)
, Relatie_0045_Waarde Varchar2(600)
, Relatie_0046_Waarde Varchar2(600)
, Relatie_0047_Waarde Varchar2(600)
, Relatie_0048_Waarde Varchar2(600)
, ArchiveerWaarschuwingGebrID number(10)
, RelatieIsInGebruik number(10)
, EmailHeeftAanhangsels number(10)
, ControlePunten Varchar2(600)
, AfzenderNaam Varchar2(300)
);
CREATE TABLE IF NOT EXISTS DocumentControlePunt
 (
 DocumentControlePuntID number(10)
, DocumentID number(10)
, ControlePuntID number(10)
, Afgevinkt number(10)
, AfvinkGebruikerID number(10)
, AfvinkDatum Varchar2(20)
, VervalDatum Varchar2(20)
);
CREATE TABLE IF NOT EXISTS DocumentGebruiker
 (
 DocumentGebruikerID number(10)
, DocumentID number(10)
, GebruikerID number(10)
, IsCC number(10)
, HeeftGeraadpleegd number(10)
, Blokkeert number(10)
, PaperclipVertegenwoordiger number(10)
, Latent number(10)
);
CREATE TABLE IF NOT EXISTS DocumentGebruikerOpmerking
 (
 DocumentGebruikerOpmerkingID number(10)
, GebruikerID number(10)
, Volgnummer number(10)
, Tekst Varchar2(250)
);
CREATE TABLE IF NOT EXISTS DocumentHandeling
 (
 ID number(10)
, DocumentHandelingID number(10)
, Naam Varchar2(750)
, Toestand Varchar2(750)
);
CREATE TABLE IF NOT EXISTS DocumentHistorie
 (
 DocumentHistorieID number(10)
, DocumentID number(10)
, Volgnummer number(10)
, DocumentHandelingID number(10)
, HandelingGebruikerID number(10)
, HandelingDatum Varchar2(20)
, HandelingDatumEinde Varchar2(20)
, HandelingRouteStapID number(10)
, InformatieAanvullend Varchar2(750)
);
CREATE TABLE IF NOT EXISTS DocumentKenmerkWaarde
 (
 DocumentKenmerkWaardeID number(10)
, DocumentID number(10)
, KenmerkOmschrijvingWaardeID number(10)
);
CREATE TABLE IF NOT EXISTS DocumentLabel
 (
 DocumentLabelID number(10)
, DocumentID number(10)
, LabelID number(10)
);
CREATE TABLE IF NOT EXISTS DocumentNotitie
 (
 DocumentNotitieID number(10)
, DocumentID number(10)
, TijdstipGeformatteerd Varchar2(60)
, GebruikerID number(10)
, GebruikerNaam Varchar2(300)
, Notitie Varchar2(250)
, RouteID number(10)
, RouteCode Varchar2(96)
, RouteNaam Varchar2(150)
, StapNummer number(10)
, StapNaam Varchar2(150)
);
CREATE TABLE IF NOT EXISTS DocumentRouteStap
 (
 DocumentRouteStapID number(10)
, DocumentID number(10)
, RouteStapID number(10)
, TussenstapNummer number(10)
, Naam Varchar2(150)
, MagGeblokkeerdWorden number(10)
, IsActief number(10)
, ActieDatum Varchar2(20)
, RouteStapStatusID number(10)
, DoorstuurGebruikerID number(10)
, DoorstuurDatum Varchar2(20)
);
CREATE TABLE IF NOT EXISTS DocumentRouteStapGebruiker
 (
 DocumentRouteStapGebruikerID number(10)
, DocumentRouteStapID number(10)
, GebruikerID number(10)
, IsCC number(10)
, HeeftGeraadpleegd number(10)
, HeeftBevestigd number(10)
, Blokkeert number(10)
, Opmerkingen Varchar2(750)
);
CREATE TABLE IF NOT EXISTS DocumentSoort
 (
 DocumentSoortID number(10)
, Naam Varchar2(150)
, IsInGebruik number(10)
);
CREATE TABLE IF NOT EXISTS DocumentUrgentie
 (
 UrgentieID number(10)
, Niveau number(10)
, Naam Varchar2(150)
, Kleur number(10)
, DagenResterend number(10)
, UrenResterend number(10)
);
CREATE TABLE IF NOT EXISTS DocumentVersie
 (
 DocumentVersieID number(10)
, DocumentID number(10)
, InhoudID number(10)
, VersieNummer number(10)
, BestandNaam Varchar2(750)
);
CREATE TABLE IF NOT EXISTS DocumentVolgnummer
 (
 DocumentVolgnummerID number(10)
, DocumentID number(10)
, GebruikerID number(10)
, SamenvoegSessieID number(10)
, Volgnummer number(10)
);
CREATE TABLE IF NOT EXISTS DocumentWorkflowStap
 (
 DocumentWorkflowStapID number(10)
, DocumentID number(10)
, StapNummer number(10)
, Naam Varchar2(150)
, MagGeblokkeerdWorden number(10)
, IsActief number(10)
, ActieDatum Varchar2(20)
, ActieDatumGeformatteerd Varchar2(96)
, WorkflowStapStatus number(10)
, DoorstuurGebruikerID number(10)
, DoorstuurGebruikerNaam Varchar2(300)
, DoorstuurDatum Varchar2(20)
, DoorstuurDatumGeformatteerd Varchar2(96)
, Opmerking Varchar2(750)
);
CREATE TABLE IF NOT EXISTS DocumentWorkflowStapGebruiker
 (
 DocumentWorkflowStapID number(10)
, GebruikerID number(10)
, GebruikerNaam Varchar2(300)
, IsCC number(10)
, HeeftGeraadpleegd number(10)
, HeeftBevestigd number(10)
, Blokkeert number(10)
, DocumentID number(10)
, StapNummer number(10)
, Opmerkingen Varchar2(250)
);
CREATE TABLE IF NOT EXISTS DocumentWorkflowStatus
 (
 DocumentWorkflowStatusID number(10)
, StatusIndex number(10)
, Code Varchar2(24)
, Beschrijving Varchar2(192)
);
CREATE TABLE IF NOT EXISTS DossierDocument
 (
 DossierDocumentID number(10)
, DossierOnderdeelID number(10)
, DocumentID number(10)
, DossierLaagID number(10)
, DossierOnderdeelKenmerk Varchar2(300)
, DossierOnderdeelBeschrijving Varchar2(750)
);
CREATE TABLE IF NOT EXISTS DossierLaag
 (
 DossierLaagID number(10)
, Code Varchar2(30)
, Naam Varchar2(150)
, LaagNummer number(10)
, BovenDossierLaagID number(10)
, Volgnummer number(10)
, PresentatieVolgnummer number(10)
, MaptNaarClassificatie number(10)
, MaptNaarStatus number(10)
, MaptNaarOpmerkingen number(10)
);
CREATE TABLE IF NOT EXISTS DossierOnderdeel
 (
 DossierOnderdeelID number(10)
, DossierLaagID number(10)
, RelatieID number(10)
, BovenDossierOnderdeelID number(10)
, Kenmerk Varchar2(300)
, Beschrijving Varchar2(750)
);
CREATE TABLE IF NOT EXISTS Dual
 (
 ID number(10)
, Dummy Varchar2(30)
);
CREATE TABLE IF NOT EXISTS Eigenschap
 (
 EigenschapID number(10)
, Kenmerk Varchar2(96)
, Beschrijving Varchar2(384)
, EigenschapGroepID number(10)
, EigenschapSoortID number(10)
, OpschriftKenmerk Varchar2(300)
, KenmerkOmschrijvingID number(10)
);
CREATE TABLE IF NOT EXISTS EigenschapComponent
 (
 EigenschapComponentID number(10)
, EigenschapID number(10)
, Kenmerk Varchar2(96)
, Beschrijving Varchar2(384)
, OpschriftKenmerk Varchar2(300)
);
CREATE TABLE IF NOT EXISTS EigenschapComponentDefault
 (
 EigenschapComponentDefaultID number(10)
, EigenschapComponentID number(10)
, GebruikerID number(10)
, EigenschapToepassingID number(10)
, DefaultWaarde Varchar2(300)
, FilterWaarde Varchar2(300)
, SnelzoekTekenAantal number(10)
);
CREATE TABLE IF NOT EXISTS EigenschapComponentLijst
 (
 EigenschapComponentLijstID number(10)
, EigenschapComponentID number(10)
, EigenschapLijstID number(10)
, WordtGetoond number(10)
, Volgnummer number(10)
);
CREATE TABLE IF NOT EXISTS EigenschapDefault
 (
 EigenschapDefaultID number(10)
, EigenschapID number(10)
, GebruikerID number(10)
, EigenschapToepassingID number(10)
, EigenschapDefaultMethodeID number(10)
, DefaultID number(10)
, GebruikSnelzoekLijst number(10)
, VeldWaarden Varchar2(1500)
, AlleenActief number(10)
);
CREATE TABLE IF NOT EXISTS EigenschapDefaultMethode
 (
 EigenschapDefaultMethodeID number(10)
, Kenmerk Varchar2(48)
, EnumeratorWaarde number(10)
, Beschrijving Varchar2(384)
);
CREATE TABLE IF NOT EXISTS EigenschapGebruik
 (
 EigenschapGebruikID number(10)
, EigenschapID number(10)
, EigenschapToepassingID number(10)
);
CREATE TABLE IF NOT EXISTS EigenschapGroep
 (
 EigenschapGroepID number(10)
, Kenmerk Varchar2(48)
, Beschrijving Varchar2(384)
);
CREATE TABLE IF NOT EXISTS EigenschapLijst
 (
 EigenschapLijstID number(10)
, EigenschapID number(10)
, GebruikerID number(10)
, EigenschapToepassingID number(10)
, WordtGetoond number(10)
, Volgnummer number(10)
);
CREATE TABLE IF NOT EXISTS EigenschapOpschrift
 (
 EigenschapOpschriftID number(10)
, EigenschapComponentID number(10)
, TaalID number(10)
, Opschrift Varchar2(300)
);
CREATE TABLE IF NOT EXISTS EigenschapSoort
 (
 EigenschapSoortID number(10)
, Kenmerk Varchar2(48)
, Beschrijving Varchar2(384)
);
CREATE TABLE IF NOT EXISTS EigenschapToepassing
 (
 EigenschapToepassingID number(10)
, Kenmerk Varchar2(48)
, Beschrijving Varchar2(384)
);
CREATE TABLE IF NOT EXISTS EmailDomein
 (
 EmailDomeinID number(10)
, DomeinNaam Varchar2(750)
, ClassificatieID number(10)
, Beschrijving Varchar2(750)
, AanEmailOnderwerpPlakken number(10)
);
CREATE TABLE IF NOT EXISTS EmailOnderwerp
 (
 EmailOnderwerpID number(10)
, Onderwerp Varchar2(750)
, ClassificatieID number(10)
);
CREATE TABLE IF NOT EXISTS EmailRichting
 (
 EmailRichtingID number(10)
, RichtingIndicator number(10)
, TaalID number(10)
, Opschrift Varchar2(96)
);
CREATE TABLE IF NOT EXISTS EmailSynoniem
 (
 EmailSynoniemID number(10)
, EmailAdres Varchar2(750)
, Onderwerp Varchar2(750)
, Synoniem Varchar2(750)
);
CREATE TABLE IF NOT EXISTS Gebruiker
 (
 GebruikerID number(10)
, VolledigeNaam Varchar2(300)
, LoginNaam Varchar2(150)
, Wachtwoord Varchar2(150)
, DocumentToegang number(10)
, Rechten Varchar2(150)
, IsActief number(10)
, IsDatabaseEigenaar number(10)
, IsPostMaster number(10)
, MailroomHotFolder number(10)
);
CREATE TABLE IF NOT EXISTS GebruikerRegister
 (
 GebruikerRegisterID number(10)
, GebruikerID number(10)
, Sectie Varchar2(360)
, Sleutel Varchar2(360)
, Gegevens Varchar2(250)
);
CREATE TABLE IF NOT EXISTS GegevensBestand
 (
 GegevensBestandID number(10)
, BestandNaam Varchar2(300)
, BestandMap Varchar2(3000)
, ApplicatieTabelID number(10)
, BestaandeRecordsAanpassen number(10)
);
CREATE TABLE IF NOT EXISTS GegevensBestandKolom
 (
 GegevensBestandKolomID number(10)
, GegevensBestandID number(10)
, KolomNummer number(10)
, KolomNaam Varchar2(300)
, ApplicatieTabelKolomID number(10)
, IsSleutelKolom number(10)
);
CREATE TABLE IF NOT EXISTS HulpApplicatie
 (
 HulpApplicatieID number(10)
, HulpApplicatiesoortID number(10)
, EnumeratorNummer number(10)
, Naam Varchar2(90)
, Beschrijving Varchar2(300)
, ModuleNaam Varchar2(90)
);
CREATE TABLE IF NOT EXISTS HulpApplicatieEigenschap
 (
 HulpApplicatieEigenschapID number(10)
, HulpApplicatieID number(10)
, Naam Varchar2(150)
, Waarde Varchar2(300)
);
CREATE TABLE IF NOT EXISTS HulpApplicatieInstelling
 (
 HulpApplicatieInstellingID number(10)
, GebruikerID number(10)
, HulpApplicatieToepassingID number(10)
, HulpApplicatieID number(10)
, Gegevens Varchar2(250)
);
CREATE TABLE IF NOT EXISTS HulpApplicatieToepassing
 (
 HulpApplicatieToepassingID number(10)
, HulpApplicatiesoortID number(10)
, Naam Varchar2(90)
, Beschrijving Varchar2(300)
);
CREATE TABLE IF NOT EXISTS HulpApplicatiesoort
 (
 HulpApplicatiesoortID number(10)
, Naam Varchar2(90)
, Beschrijving Varchar2(300)
, ObjectNaam Varchar2(90)
);
CREATE TABLE IF NOT EXISTS Inhoud
 (
 InhoudID number(10)
, InhoudSoortID number(10)
, InhoudType Varchar2(250)
, Bestandsnaam Varchar2(150)
, Waarde Varchar2(250)
, Digest Varchar2(192)
, OCRStatus number(10)
, OCRError Varchar2(600)
, OpslagDatum Varchar2(20)
, BestandNaamLang Varchar2(600)
, MapVolgnummer number(10)
, BestandNaamOorspronkelijk Varchar2(250)
);
CREATE TABLE IF NOT EXISTS InhoudLokatie
 (
 InhoudLokatieID number(10)
, InhoudID number(10)
, LokatieID number(10)
, Volgnummer number(10)
);
CREATE TABLE IF NOT EXISTS InhoudSoort
 (
 InhoudSoortID number(10)
, Extentie Varchar2(36)
, Omschrijving Varchar2(150)
, Grafisch number(10)
, MagWijzigen number(10)
, Kenmerk Varchar2(3)
, Kleur number(10)
, OnViewUploadbaar number(10)
);
CREATE TABLE IF NOT EXISTS InhoudSoortOpslag
 (
 InhoudSoortOpslagID number(10)
, InhoudSoortID number(10)
, GebruikerID number(10)
, OpslagMethodeID number(10)
);
CREATE TABLE IF NOT EXISTS InhoudTekst
 (
 InhoudTekstID number(10)
, InhoudID number(10)
, Pagina number(10)
, Tekst Varchar2(250)
, OCRStatus number(10)
, OCRMelding Varchar2(600)
, OCRSessieID number(10)
, InBehandeling number(10)
, StartTijd Varchar2(20)
);
CREATE TABLE IF NOT EXISTS InhoudTekstOCRStatus
 (
 InhoudTekstOCRStatusID number(10)
, OCRStatus number(10)
, Beschrijving Varchar2(150)
);
CREATE TABLE IF NOT EXISTS InhoudTekstWoord
 (
 InhoudTekstWoordID number(10)
, InhoudTekstID number(10)
, WoordID number(10)
, Aantal number(10)
);
CREATE TABLE IF NOT EXISTS InhoudWoord
 (
 InhoudID number(10)
, WoordID number(10)
);
CREATE TABLE IF NOT EXISTS KenmerkOmschrijving
 (
 KenmerkOmschrijvingID number(10)
, Naam Varchar2(150)
, ApplicatieDatatypeID number(10)
, WaardelijstID number(10)
, Verplicht number(10)
, Actief number(10)
, GebruikTijd number(10)
, LangFormaat number(10)
, Valuta number(10)
, MinimaleWaarde float
, MaximaleWaarde float
, MaximaleLengte number(10)
, Precisie number(10)
);
CREATE TABLE IF NOT EXISTS KenmerkOmschrijvingWaarde
 (
 KenmerkOmschrijvingWaardeID number(10)
, KenmerkOmschrijvingID number(10)
, WaardeTekst Varchar2(750)
);
CREATE TABLE IF NOT EXISTS KenmerkWaarde
 (
 KenmerkWaardeID number(10)
, DocumentID number(10)
, KenmerkOmschrijvingID number(10)
, Waarde Varchar2(600)
);
CREATE TABLE IF NOT EXISTS Label
 (
 LabelID number(10)
, Label Varchar2(250)
);
CREATE TABLE IF NOT EXISTS Lokatie
 (
 LokatieID number(10)
, Naam Varchar2(150)
, LokatieType number(10)
, ServerID number(10)
, DiskLetter Varchar2(3)
, Pad Varchar2(3000)
, ShareNaam Varchar2(750)
, Label Varchar2(36)
, VerwisselbaarType number(10)
, TijdelijkeWissel number(10)
, Voorkeur number(10)
, IsInGebruik number(10)
, GebruiktMappenstructuur number(10)
, DocumentSleutelNummer number(10)
, GeneriekJaar number(10)
, GeneriekMaand number(10)
);
CREATE TABLE IF NOT EXISTS LokatieBestandNaam
 (
 LokatieBestandNaamID number(10)
, LokatieID number(10)
, EigenschapComponentID number(10)
, Volgnummer number(10)
);
CREATE TABLE IF NOT EXISTS LokatieMap
 (
 LokatieMapID number(10)
, LokatieID number(10)
, EigenschapComponentID number(10)
, Volgnummer number(10)
);
CREATE TABLE IF NOT EXISTS MailroomAanhef
 (
 MailroomAanhefID number(10)
, Aanhef Varchar2(300)
);
CREATE TABLE IF NOT EXISTS MailroomAfzender
 (
 MailroomAfzenderID number(10)
, Naam Varchar2(150)
, IsInGebruik number(10)
);
CREATE TABLE IF NOT EXISTS MailroomAfzenderTekst
 (
 MailroomAfzenderTekstID number(10)
, MailroomAfzenderID number(10)
, TekstKenmerkend Varchar2(600)
, Gewijzigd number(10)
);
CREATE TABLE IF NOT EXISTS MailroomAfzenderTekstAlias
 (
 MailroomAfzenderTekstAliasID number(10)
, MailroomAfzenderTekstID number(10)
, TekstAlias Varchar2(600)
, MutatieAantal number(10)
);
CREATE TABLE IF NOT EXISTS MailroomAlias
 (
 MailroomAliasID number(10)
, Patroon Varchar2(9)
, Vervanger Varchar2(9)
);
CREATE TABLE IF NOT EXISTS MailroomAnalyseRelatie
 (
 MailroomAnalyseRelatieID number(10)
, MailroomAnalyseZoeklijstID number(10)
, RelatieID number(10)
, Score number(10)
, Overlap number(10)
, MutatieAantal number(10)
);
CREATE TABLE IF NOT EXISTS MailroomAnalyseSjabloon
 (
 MailroomAnalyseSjabloonID number(10)
, MailroomSjabloonID number(10)
, SjabloonNaam Varchar2(750)
, AfzenderNaam Varchar2(750)
, AfzenderKenmerk Varchar2(750)
, AfzenderTekst Varchar2(12000)
, AfzenderMatch Varchar2(750)
, SoortKenmerk Varchar2(750)
, SoortTekst Varchar2(12000)
, SoortMatch Varchar2(750)
, OpmerkingTekst Varchar2(12000)
, OpmerkingGevonden Varchar2(12000)
, RelatieTekst Varchar2(12000)
, IsGeldig number(10)
);
CREATE TABLE IF NOT EXISTS MailroomAnalyseTekst
 (
 MailroomAnalyseTekstID number(10)
, Tekst Varchar2(12000)
);
CREATE TABLE IF NOT EXISTS MailroomAnalyseTekstDeel
 (
 MailroomAnalyseTekstDeelID number(10)
, MailroomSjabloonID number(10)
, MailroomMatchTekstDeelID number(10)
, TekstMetSpaties Varchar2(750)
, TekstZonderSpaties Varchar2(750)
);
CREATE TABLE IF NOT EXISTS MailroomAnalyseTekstPositie
 (
 MailroomAnalyseTekstPositieID number(10)
, MailroomSjabloonID number(10)
, MailroomMatchTekstDeelID number(10)
, RegelNummer number(10)
, PositieStart number(10)
);
CREATE TABLE IF NOT EXISTS MailroomAnalyseTekstRegel
 (
 MailroomAnalyseTekstRegelID number(10)
, MailroomSjabloonID number(10)
, RegelNummer number(10)
, SectieNummer number(10)
, TekstMetSpaties Varchar2(750)
, TekstZonderSpaties Varchar2(750)
);
CREATE TABLE IF NOT EXISTS MailroomAnalyseZoeklijst
 (
 MailroomAnalyseZoeklijstID number(10)
, MailroomSjabloonID number(10)
, MailroomSjabloonZoeklijstID number(10)
, MatchMethode number(10)
, ZoeklijstNummer number(10)
, ZoeklijstSamenstelling Varchar2(750)
);
CREATE TABLE IF NOT EXISTS MailroomAnalyseZoekveld
 (
 MailroomAnalyseZoekveldID number(10)
, MailroomAnalyseZoeklijstID number(10)
, MailroomSjabloonZoekveldID number(10)
, VeldNummer number(10)
, EigenschapGroepNaam Varchar2(750)
, HeeftAanhef number(10)
, HeeftOntbrekendGegeven number(10)
, MatchHeleRegel number(10)
, UitzonderingenToepassen number(10)
);
CREATE TABLE IF NOT EXISTS MailroomAnalyseZoekwoord
 (
 MailroomAnalyseZoekwoordID number(10)
, MailroomAnalyseZoekveldID number(10)
, MailroomZoekwoordID number(10)
);
CREATE TABLE IF NOT EXISTS MailroomBatch
 (
 MailroomBatchID number(10)
, Naam Varchar2(30)
, OpslagDatum Varchar2(20)
);
CREATE TABLE IF NOT EXISTS MailroomDocument
 (
 MailroomDocumentID number(10)
, DocumentID number(10)
, MailroomBatchID number(10)
, MailroomBatchVolgnummer number(10)
, MailroomSjabloonIDAnalyse Varchar2(12000)
, MailroomSjabloonIDToegekend number(10)
, ToekenningDoorGebruiker number(10)
, MailroomMelding Varchar2(750)
, OCRStatus number(10)
, OCRMelding Varchar2(150)
, MailroomAfzenderTekstID number(10)
, ZoeklijstNummer number(10)
, SjabloonScore number(10)
, SjabloonMatchPercentage number(10)
, SjabloonMatchMutatieAantal number(10)
, SjabloonInVerificatie number(10)
, RelatieScore number(10)
, RelatieMatchPercentage number(10)
, RelatieMatchOverlap number(10)
, RelatieMatchMutatieAantal number(10)
, RelatieMatchScherpte number(10)
, RelatieInVerificatie number(10)
, EmailVerzendDatum Varchar2(20)
, EmailVerzendAdres Varchar2(600)
, ZoeklijstSamenstelling Varchar2(750)
, RelatieIDToegekend number(10)
, AnalyseDatum Varchar2(20)
, Opmerkingen Varchar2(250)
);
CREATE TABLE IF NOT EXISTS MailroomDocumentRelatie
 (
 MailroomDocumentRelatieID number(10)
, MailroomDocumentID number(10)
, RelatieID number(10)
, MailroomSjabloonZoeklijstID number(10)
, ZoeklijstSamenstelling Varchar2(750)
, MatchScore number(10)
, MatchPercentage number(10)
, MatchMutatieAantal number(10)
, Overlap number(10)
);
CREATE TABLE IF NOT EXISTS MailroomDocumentRelatieEigenschap
 (
 MailrmDocumntRlatEignschapID number(10)
, MailroomDocumentID number(10)
, RelatieID number(10)
, MailroomEigenschapGroepID number(10)
, EigenschapScore number(10)
, MutatieAantal number(10)
, RegelNietOverlaptLengte number(10)
);
CREATE TABLE IF NOT EXISTS MailroomDocumentZoneTekst
 (
 MailroomDocumentZoneTekstID number(10)
, MailroomDocumentID number(10)
, MailroomZoneTypeID number(10)
, ZoneTekst Varchar2(12000)
);
CREATE TABLE IF NOT EXISTS MailroomEigenschap
 (
 MailroomEigenschapID number(10)
, Volgnummer number(10)
, Beschrijving Varchar2(600)
, MailroomEigenschapTypeID number(10)
, ReferentieTabel Varchar2(600)
, ReferentieKolom Varchar2(600)
, Gewicht number(10)
, Gewijzigd number(10)
);
CREATE TABLE IF NOT EXISTS MailroomEigenschapGroep
 (
 MailroomEigenschapGroepID number(10)
, Naam Varchar2(600)
, IsStandaardGroep number(10)
, Gewicht number(10)
, MatchVerificatie number(10)
, Gewijzigd number(10)
);
CREATE TABLE IF NOT EXISTS MailroomEigenschapGroepLid
 (
 MailroomEigenschapGroepLidID number(10)
, MailroomEigenschapGroepID number(10)
, Volgnummer number(10)
, MailroomEigenschapID number(10)
);
CREATE TABLE IF NOT EXISTS MailroomEigenschapType
 (
 MailroomEigenschapTypeID number(10)
, Naam Varchar2(150)
, Beschrijving Varchar2(600)
);
CREATE TABLE IF NOT EXISTS MailroomPatroon
 (
 MailroomPatroonID number(10)
, VolgNummer number(10)
, Beschrijving Varchar2(3000)
, Score number(10)
);
CREATE TABLE IF NOT EXISTS MailroomRelatieZoekwoord
 (
 MailroomRelatieZoekwoordID number(10)
, RelatieID number(10)
, MailroomEigenschapGroepID number(10)
, MailroomZoekwoordID number(10)
);
CREATE TABLE IF NOT EXISTS MailroomSjabloon
 (
 MailroomSjabloonID number(10)
, Naam Varchar2(750)
, Beschrijving Varchar2(750)
, IsDefaultSjabloon number(10)
, DefaultDocumentSoortID number(10)
, MailroomAfzenderID number(10)
, MailroomAfzenderTekstID number(10)
, ClassificatieID number(10)
, StatusID number(10)
, DefaultOpmerking Varchar2(750)
, InhoudID number(10)
, ResolutieHorizontaal number(10)
, ResolutieVerticaal number(10)
, NullVervanger Varchar2(12)
, ZoneSjabloon Varchar2(250)
, OpmerkingUitZone number(10)
, OpmerkingPatroon Varchar2(750)
, OpmerkingTekenAantalMinimaal number(10)
, OpmerkingTekenAantalMaximaal number(10)
, OpslagDatum Varchar2(20)
, DefaultLabels Varchar2(750)
, AanmaakDatumGeformatteerd Varchar2(60)
, GewijzigdDatumGeformatteerd Varchar2(60)
, MailroomZoeklijstGroepID number(10)
, IsInGebruik number(10)
, Volgnummer number(10)
, WordtGetest number(10)
, HalfHerkenbaar number(10)
, REDID number(10)
, LaatsteToekenning Varchar2(20)
, Aangepast number(10)
, Afgehandeld number(10)
);
CREATE TABLE IF NOT EXISTS MailroomSjabloonGroep
 (
 MailroomSjabloonGroepID number(10)
, Naam Varchar2(150)
);
CREATE TABLE IF NOT EXISTS MailroomSjabloonGroepLid
 (
 MailroomSjabloonGroepLidID number(10)
, MailroomSjabloonGroepID number(10)
, Volgnummer number(10)
, MailroomSjabloonID number(10)
);
CREATE TABLE IF NOT EXISTS MailroomSjabloonTekstAlias
 (
 MailroomSjabloonTekstAliasID number(10)
, MailroomSjabloonZoneID number(10)
, TekstAlias Varchar2(600)
, MutatieAantal number(10)
);
CREATE TABLE IF NOT EXISTS MailroomSjabloonZoekLijst
 (
 MailroomSjabloonZoekLijstID number(10)
, MailroomSjabloonID number(10)
, ZoeklijstNummer number(10)
, Samenstelling Varchar2(750)
, ScoreMaximaal number(10)
);
CREATE TABLE IF NOT EXISTS MailroomSjabloonZoekVeld
 (
 MailroomSjabloonZoekVeldID number(10)
, MailroomSjabloonZoekLijstID number(10)
, VolgNummer number(10)
, MailroomEigenschapGroepID number(10)
, MatchHeleRegel number(10)
, UitzonderingenToepassen number(10)
, MatchSpatieloos number(10)
);
CREATE TABLE IF NOT EXISTS MailroomSjabloonZoekView
 (
 MailroomSjabloonZoekViewID number(10)
, MailroomSjabloonID number(10)
, SjabloonNaam Varchar2(750)
, SjabloonBeschrijving Varchar2(750)
, MailroomSjabloonZoekLijstID number(10)
, ZoeklijstNummer number(10)
, Samenstelling Varchar2(750)
, MailroomSjabloonZoekVeldID number(10)
, ZoekveldNummer number(10)
, MatchHeleRegel number(10)
, UitzonderingenToepassen number(10)
, MailroomEigenschapGroepID number(10)
, EigenschapGroepNaam Varchar2(600)
, IsStandaardGroep number(10)
, EigenschapNummer number(10)
, MailroomEigenschapID number(10)
, EigenschapBeschrijving Varchar2(600)
, MailroomEigenschapTypeID number(10)
, EigenschapTypeNaam Varchar2(150)
);
CREATE TABLE IF NOT EXISTS MailroomSjabloonZone
 (
 MailroomSjabloonZoneID number(10)
, MailroomSjabloonID number(10)
, MailroomZoneTypeID number(10)
, MarginLinks number(10)
, MarginRechts number(10)
, MarginBoven number(10)
, MarginOnder number(10)
, Tekst Varchar2(600)
, Gewijzigd number(10)
);
CREATE TABLE IF NOT EXISTS MailroomTekstNiet
 (
 MailroomTekstNietID number(10)
, Tekst Varchar2(300)
, Gewijzigd number(10)
);
CREATE TABLE IF NOT EXISTS MailroomTekstNietAlias
 (
 MailroomTekstNietAliasID number(10)
, MailroomTekstNietID number(10)
, TekstNietAlias Varchar2(600)
, MutatieAantal number(10)
);
CREATE TABLE IF NOT EXISTS MailroomZoekLijst
 (
 MailroomZoekLijstID number(10)
, MailroomZoeklijstGroepID number(10)
, ZoeklijstNummer number(10)
, Samenstelling Varchar2(750)
, ScoreMaximaal number(10)
);
CREATE TABLE IF NOT EXISTS MailroomZoekVeld
 (
 MailroomZoekVeldID number(10)
, MailroomZoekLijstID number(10)
, VolgNummer number(10)
, MailroomEigenschapGroepID number(10)
, MatchHeleRegel number(10)
, UitzonderingenToepassen number(10)
, MatchSpatieloos number(10)
);
CREATE TABLE IF NOT EXISTS MailroomZoeklijstGroep
 (
 MailroomZoeklijstGroepID number(10)
, Naam Varchar2(150)
, Beschrijving Varchar2(360)
);
CREATE TABLE IF NOT EXISTS MailroomZoekwoord
 (
 MailroomZoekwoordID number(10)
, MailroomEigenschapGroepID number(10)
, Zoekwoord Varchar2(600)
);
CREATE TABLE IF NOT EXISTS MailroomZoekwoordAlias
 (
 MailroomZoekwoordAliasID number(10)
, MailroomZoekwoordID number(10)
, MailroomEigenschapGroepID number(10)
, ZoekwoordAlias Varchar2(600)
, Overlap number(10)
, MutatieAantal number(10)
, SpatieUitvalAantal number(10)
, AliasZonderSpaties Varchar2(600)
, AliasTekenAantal number(10)
);
CREATE TABLE IF NOT EXISTS MailroomZoekwoordTijdelijk
 (
 MailroomZoekwoordTijdelijkID number(10)
, MailroomZoekwoordID number(10)
, ReferentieRelatieID number(10)
, EigenschapAantal number(10)
, ZoekwoordAlias Varchar2(600)
, Overlap number(10)
, MutatieAantal number(10)
, SpatieUitvalAantal number(10)
);
CREATE TABLE IF NOT EXISTS MailroomZoekwoordUitzondering
 (
 MailrmZoekwrdUitzonderingID number(10)
, MailroomEigenschapGroepID number(10)
, Uitzondering Varchar2(600)
);
CREATE TABLE IF NOT EXISTS MailroomZoekwoordVariant
 (
 MailroomZoekwoordVariantID number(10)
, Variant1 Varchar2(600)
, Variant2 Varchar2(600)
);
CREATE TABLE IF NOT EXISTS MailroomZoneType
 (
 MailroomZoneTypeID number(10)
, Beschrijving Varchar2(300)
, Kleur number(10)
);
CREATE TABLE IF NOT EXISTS Map
 (
 MapID number(10)
, ParentID number(10)
, EigenaarID number(10)
, Naam Varchar2(150)
);
CREATE TABLE IF NOT EXISTS OCRSessie
 (
 OCRSessieID number(10)
, GebruikerID number(10)
, StartTijd Varchar2(20)
);
CREATE TABLE IF NOT EXISTS OW600Klanten
 (
 dossierid number(10)
, relatieid number(10)
, werkzaamid number(10)
, naam Varchar2(300)
, referentie Varchar2(600)
, officielenaam Varchar2(600)
, faseid number(10)
, toestandid number(10)
, regel number(10)
);
CREATE TABLE IF NOT EXISTS OpdrachtLinkBestandNaam
 (
 OpdrachtLinkBestandNaamID number(10)
, EigenschapComponentID number(10)
, Volgnummer number(10)
);
CREATE TABLE IF NOT EXISTS OpdrachtLinkMap
 (
 OpdrachtLinkMapID number(10)
, EigenschapComponentID number(10)
, Volgnummer number(10)
);
CREATE TABLE IF NOT EXISTS Opschrift
 (
 OpschriftID number(10)
, Code Varchar2(600)
, Volgnummer number(10)
);
CREATE TABLE IF NOT EXISTS OpslagMethode
 (
 OpslagMethodeID number(10)
, Kenmerk Varchar2(24)
, Beschrijving Varchar2(96)
);
CREATE TABLE IF NOT EXISTS Paperclip
 (
 PaperclipID number(10)
, Naam Varchar2(768)
);
CREATE TABLE IF NOT EXISTS Positie
 (
 ID number(10)
, Positie number(10)
);
CREATE TABLE IF NOT EXISTS Positie2
 (
 ID number(10)
, Positie number(10)
);
CREATE TABLE IF NOT EXISTS Positie3
 (
 ID number(10)
, Positie number(10)
);
CREATE TABLE IF NOT EXISTS RLEmails
 (
 nummerid number(10)
, nummer Varchar2(300)
, RelID number(10)
, werkzaamid number(10)
, holder Varchar2(4000)
, gebruikerid number(10)
, standaard Varchar2(250)
, alias Varchar2(300)
, kenmerk Varchar2(300)
);
CREATE TABLE IF NOT EXISTS RLKlantkanton
 (
 dossierid number(10)
, plaats Varchar2(75)
, zoeknaam Varchar2(210)
, relatieid number(10)
, kanton Varchar2(150)
, kantonid number(10)
, geldigtot Varchar2(20)
);
CREATE TABLE IF NOT EXISTS RLKlantkantonALL
 (
 dossierid number(10)
, plaats Varchar2(75)
, zoeknaam Varchar2(210)
, relatieid number(10)
, kanton Varchar2(150)
, kantonid number(10)
, geldigtot Varchar2(20)
);
CREATE TABLE IF NOT EXISTS RLrelatiewerkzaamid
 (
 id number(10)
, relatieid number(10)
, werkzaamid number(10)
);
CREATE TABLE IF NOT EXISTS RechtenClassificatie
 (
 RechtenClassificatieID number(10)
, ClassificatieID number(10)
, GebruikerID number(10)
, RechtenNiveauID number(10)
);
CREATE TABLE IF NOT EXISTS RechtenFunctionaliteit
 (
 RechtenFunctionaliteitID number(10)
, GroepRechtenFunctionaliteitID number(10)
, Volgnummer number(10)
, Kenmerk Varchar2(750)
, OpschriftKenmerk Varchar2(750)
, OpschriftStandaard Varchar2(750)
);
CREATE TABLE IF NOT EXISTS RechtenGebruikerFunctionaliteit
 (
 RechtenGebrkerFunctionalittID number(10)
, GebruikerID number(10)
, RechtenFunctionaliteitID number(10)
, MagUitvoeren number(10)
, MagAllesUitvoeren number(10)
);
CREATE TABLE IF NOT EXISTS RechtenNiveau
 (
 RechtenNiveauID number(10)
, Niveau number(10)
, Beschrijving Varchar2(150)
);
CREATE TABLE IF NOT EXISTS Register
 (
 RegisterID number(10)
, Sectie Varchar2(150)
, Sleutel Varchar2(150)
, Type number(10)
, Gegevens Varchar2(250)
);
CREATE TABLE IF NOT EXISTS RegisterEigenschapComponentLijst
 (
 RgistrEignschapComponntLstID number(10)
, RegisterEigenschapLijstID number(10)
, EigenschapComponentID number(10)
, Volgnummer number(10)
, WordtGetoond number(10)
, DefaultWaarde Varchar2(300)
, FilterWaarde Varchar2(300)
, SnelzoekTekenAantal number(10)
);
CREATE TABLE IF NOT EXISTS RegisterEigenschapLijst
 (
 RegisterEigenschapLijstID number(10)
, RegisterInstellingWaardeID number(10)
, Volgnummer number(10)
, EigenschapID number(10)
, WordtGetoond number(10)
, EigenschapDefaultMethodeID number(10)
, DefaultID number(10)
, GebruikSnelzoekLijst number(10)
, AlleenActief number(10)
, VeldWaarden Varchar2(1500)
);
CREATE TABLE IF NOT EXISTS RegisterGrid
 (
 RegisterGridID number(10)
, GridKenmerk Varchar2(300)
, GebruikerID number(10)
, Instelling Varchar2(250)
);
CREATE TABLE IF NOT EXISTS RegisterInstellingComponentDefault
 (
 RgistrInstllingComponntDfltID number(10)
, RegisterInstellingWaardeID number(10)
, EigenschapComponentID number(10)
, EigenschapToepassingID number(10)
, DefaultWaarde Varchar2(300)
, FilterWaarde Varchar2(300)
, SnelzoekTekenAantal number(10)
);
CREATE TABLE IF NOT EXISTS RegisterInstellingComponentLijst
 (
 RgistrInstllingComponntLstID number(10)
, RegisterInstellingLijstID number(10)
, EigenschapComponentID number(10)
, WordtGetoond number(10)
, Volgnummer number(10)
);
CREATE TABLE IF NOT EXISTS RegisterInstellingDefault
 (
 RegisterInstellingDefaultID number(10)
, RegisterInstellingWaardeID number(10)
, EigenschapID number(10)
, EigenschapToepassingID number(10)
, EigenschapDefaultMethodeID number(10)
, DefaultID number(10)
, GebruikSnelzoekLijst number(10)
, VeldWaarden Varchar2(1500)
);
CREATE TABLE IF NOT EXISTS RegisterInstellingGebruiker
 (
 RegisterInstellingGebruikerID number(10)
, RegisterInstellingWaardeID number(10)
, Kenmerk Varchar2(300)
, Waarde Varchar2(250)
);
CREATE TABLE IF NOT EXISTS RegisterInstellingGrid
 (
 RegisterInstellingGridID number(10)
, RegisterInstellingWaardeID number(10)
, Kenmerk Varchar2(300)
, Waarde Varchar2(250)
);
CREATE TABLE IF NOT EXISTS RegisterInstellingLijst
 (
 RegisterInstellingLijstID number(10)
, RegisterInstellingWaardeID number(10)
, EigenschapID number(10)
, EigenschapToepassingID number(10)
, WordtGetoond number(10)
, Volgnummer number(10)
);
CREATE TABLE IF NOT EXISTS RegisterInstellingSoort
 (
 RegisterInstellingSoortID number(10)
, Kenmerk Varchar2(120)
, OpschriftKenmerk Varchar2(300)
, OpschriftVerstek Varchar2(300)
);
CREATE TABLE IF NOT EXISTS RegisterInstellingToepassing
 (
 RegisterInstellingToepassingID number(10)
, RegisterInstellingSoortID number(10)
, Kenmerk Varchar2(120)
, OpschriftKenmerk Varchar2(300)
, OpschriftVerstek Varchar2(300)
);
CREATE TABLE IF NOT EXISTS RegisterInstellingWaarde
 (
 RegisterInstellingWaardeID number(10)
, RegisterInstellingToepassingID number(10)
, GebruikerID number(10)
, Kenmerk Varchar2(120)
, Waarde Varchar2(250)
);
CREATE TABLE IF NOT EXISTS RegisterOpslaanAutomatisch
 (
 RegisterOpslaanAutomatischID number(10)
, GebruikerID number(10)
, BronMap Varchar2(250)
, BestemmingLokatieID number(10)
, DocumentSoortID number(10)
, RouteID number(10)
, IsActief number(10)
, Tussentijd number(10)
, PaperclipGeef number(10)
);
CREATE TABLE IF NOT EXISTS Rekening
 (
 rekeningID number(10)
, Rekening Varchar2(300)
);
CREATE TABLE IF NOT EXISTS Relatie
 (
 RelatieID number(10)
, Naam Varchar2(600)
, RelatieType number(10)
, DebiteurNummer Varchar2(150)
, CrediteurNummer Varchar2(150)
, IsInGebruik number(10)
, IsInMailroom number(10)
, Extra0019 Varchar2(150)
, Extra0020 Varchar2(150)
, Extra0021 Varchar2(150)
, Extra0022 Varchar2(150)
, Extra0023 Varchar2(150)
, Extra0024 Varchar2(150)
, Extra0025 Varchar2(150)
, Extra0026 Varchar2(150)
, Extra0027 Varchar2(150)
, Extra0028 Varchar2(150)
, Extra0029 Varchar2(150)
, Extra0030 Varchar2(150)
, Extra0031 Varchar2(150)
, Extra0032 Varchar2(150)
, Extra0033 Varchar2(150)
, Extra0034 Varchar2(150)
, Extra0035 Varchar2(150)
, Extra0036 Varchar2(150)
, Extra0037 Varchar2(150)
, Extra0038 Varchar2(150)
, Extra0039 Varchar2(150)
, Extra0040 Varchar2(150)
, AltijdInGebruik number(10)
, Extra0045 Varchar2(600)
, Extra0046 Varchar2(600)
, Extra0047 Varchar2(600)
, Extra0048 Varchar2(600)
, Gewijzigd number(10)
);
CREATE TABLE IF NOT EXISTS Route
 (
 RouteID number(10)
, Code Varchar2(30)
, Naam Varchar2(150)
, IsInGebruik number(10)
, IsAdHocRoute number(10)
);
CREATE TABLE IF NOT EXISTS RouteStap
 (
 RouteStapID number(10)
, RouteID number(10)
, StapNummer number(10)
, Naam Varchar2(150)
, MagBlokkeren number(10)
);
CREATE TABLE IF NOT EXISTS RouteStapGebruiker
 (
 RouteStapGebruikerID number(10)
, RouteStapID number(10)
, GebruikerID number(10)
, IsCC number(10)
);
CREATE TABLE IF NOT EXISTS RouteStapStatus
 (
 ID number(10)
, RouteStapStatusID number(10)
, Code Varchar2(6)
, Beschrijving Varchar2(96)
);
CREATE TABLE IF NOT EXISTS SamenvoegSessie
 (
 SamenvoegSessieID number(10)
, GebruikerID number(10)
);
CREATE TABLE IF NOT EXISTS Server
 (
 ServerID number(10)
, Naam Varchar2(150)
);
CREATE TABLE IF NOT EXISTS SessieControlePunt
 (
 SessieControlePuntID number(10)
, SamenvoegSessieID number(10)
, ControlePuntID number(10)
, AfgevinktNiet number(10)
, AfgevinktWel number(10)
, DocumentID number(10)
, VervalDatum Varchar2(20)
, AfvinkGebruikerID number(10)
, AfvinkDatum Varchar2(20)
);
CREATE TABLE IF NOT EXISTS Status
 (
 StatusID number(10)
, Naam Varchar2(150)
, IsInGebruik number(10)
);
CREATE TABLE IF NOT EXISTS SyncDatabase
 (
 SyncDatabaseID number(10)
, Naam Varchar2(150)
, IsDatabaseHuidig number(10)
, SyncDatabaseSoortID number(10)
, Gegeven1 Varchar2(3000)
, Gegeven2 Varchar2(3000)
, Gegeven3 Varchar2(3000)
, Gegeven4 Varchar2(3000)
, Gegeven5 Varchar2(3000)
);
CREATE TABLE IF NOT EXISTS SyncDatabaseSoort
 (
 SyncDatabaseSoortID number(10)
, Naam Varchar2(150)
, IsOpenDISSoort number(10)
, AlleenBron number(10)
, AansluitOpdracht Varchar2(3000)
, DSN Varchar2(150)
);
CREATE TABLE IF NOT EXISTS SyncMapping
 (
 SyncMappingID number(10)
, SleutelPrimairBron Varchar2(300)
, SleutelPrimairDoel Varchar2(300)
, SyncOpdrachtID number(10)
);
CREATE TABLE IF NOT EXISTS SyncMethode
 (
 SyncMethodeID number(10)
, Naam Varchar2(150)
, Omschrijving Varchar2(3000)
);
CREATE TABLE IF NOT EXISTS SyncOpdracht
 (
 SyncOpdrachtID number(10)
, SyncScriptID number(10)
, Volgnummer number(10)
, TabelNaamBron Varchar2(300)
, SleutelPrimairBron Varchar2(300)
, TabelNaamDoel Varchar2(300)
, SleutelPrimairDoel Varchar2(300)
, Voorwaarde Varchar2(6000)
, Bevestiging Varchar2(6000)
);
CREATE TABLE IF NOT EXISTS SyncOpdrachtKolom
 (
 SyncOpdrachtKolomID number(10)
, SyncOpdrachtID number(10)
, Volgnummer number(10)
, IsSleutelKolom number(10)
, IsSectieKolom number(10)
, KolomNaamDoel Varchar2(300)
, MappingVeldenDoel Varchar2(250)
, KolomNaamBron Varchar2(300)
, MappingVeldenBron Varchar2(250)
, KolommenAanvullendDoel Varchar2(250)
);
CREATE TABLE IF NOT EXISTS SyncScript
 (
 SyncScriptID number(10)
, Naam Varchar2(150)
, Beschrijving Varchar2(3000)
, SyncDatabaseIDBron number(10)
, SyncDatabaseIDDoel number(10)
, SyncMethodeID number(10)
, WordtAdHocUitgevoerd number(10)
, HerhalingsTijd number(10)
, HerhalingsTijdEenheid number(10)
);
CREATE TABLE IF NOT EXISTS Taal
 (
 TaalID number(10)
, Code Varchar2(30)
, NaamNederlands Varchar2(150)
, NaamEigen Varchar2(150)
);
CREATE TABLE IF NOT EXISTS TabelInstelling
 (
 TabelInstellingID number(10)
, TabelNaam Varchar2(150)
, TabelNaamLokaal Varchar2(150)
, KolomNaam Varchar2(150)
, KolomNaamLokaal Varchar2(150)
, IsVerplicht number(10)
, IsUniek number(10)
, BeperkingNaam Varchar2(150)
, IndexNaam Varchar2(150)
);
CREATE TABLE IF NOT EXISTS TabelVersheid
 (
 TabelVersheidID number(10)
, TabelNaam Varchar2(300)
, Voorwaarde Varchar2(3000)
, LaatstGewijzigdTijdstip Varchar2(20)
, InGebruikGebruikerID number(10)
);
CREATE TABLE IF NOT EXISTS ToegangEigenschap
 (
 ToegangEigenschapID number(10)
, EigenschapID number(10)
, HeeftToegangBeperking number(10)
);
CREATE TABLE IF NOT EXISTS ToegangEigenschapGebruiker
 (
 ToegangEigenschapGebruikerID number(10)
, ToegangEigenschapID number(10)
, GebruikerID number(10)
, ID number(10)
, HeeftToegang number(10)
, MagToevoegen number(10)
, MagLezen number(10)
, MagWijzigen number(10)
, MagVerwijderen number(10)
);
CREATE TABLE IF NOT EXISTS Vertaling
 (
 VertalingID number(10)
, TaalID number(10)
, OpschriftID number(10)
, TekstStandaard Varchar2(600)
, TekstGebruiker Varchar2(600)
);
CREATE TABLE IF NOT EXISTS Woord
 (
 WoordID number(10)
, Woord Varchar2(765)
);
CREATE TABLE IF NOT EXISTS WorkflowArchiveerOpmerking
 (
 WorkflowArchiveerOpmerkingID number(10)
, GebruikerID number(10)
, Volgnummer number(10)
, Tekst Varchar2(150)
);
CREATE TABLE IF NOT EXISTS WorkflowGebruikerOpmerking
 (
 WorkflowGebruikerOpmerkingID number(10)
, GebruikerID number(10)
, Volgnummer number(10)
, Tekst Varchar2(150)
);
CREATE TABLE IF NOT EXISTS WorkflowGebruikerStapNaam
 (
 WorkflowGebruikerStapNaamID number(10)
, GebruikerID number(10)
, Volgnummer number(10)
, Tekst Varchar2(150)
);
CREATE TABLE IF NOT EXISTS WorkflowStapStatus
 (
 WorkflowStapStatusID number(10)
, WorkflowStapStatus number(10)
, Code Varchar2(6)
, Beschrijving Varchar2(96)
);
CREATE TABLE IF NOT EXISTS a2correctie
 (
 corid number(10)
, versie number(10)
, serie number(10)
, volgnummer number(10)
, querie text
, doe text
, omgeving Varchar2(75)
, toelichting text
);
CREATE TABLE IF NOT EXISTS a2database
 (
 databaseversie number(10)
, inrichtingversie Varchar2(20)
, aanmelden number(10)
, vergrendelen number(10)
, commando Varchar2(150)
, querylog number(10)
, werkdatum Varchar2(20)
, laatstekopie text
, groep Varchar2(60)
, ftpdatum Varchar2(20)
, archiefhorizon number(10)
, mailtracing Varchar2(250)
, querylogclause Varchar2(150)
, zworkid number(10)
, laatstenieuws Varchar2(20)
, nieuwschecked Varchar2(20)
, querylogtime number(10)
, breakmode Varchar2(250)
, bakbestand Varchar2(1500)
, testreferentie text
, stacktracing Varchar2(250)
, fix Varchar2(3)
, databasesettings text
, proceslogging Varchar2(250)
, a2databaseid number(10)
, build Varchar2(30)
, printlog Varchar2(250)
);
CREATE TABLE IF NOT EXISTS a2fix
 (
 fixid number(10)
, versie Varchar2(30)
, datum Varchar2(20)
, verbetering text
, toelichting text
, correctie text
, doe text
, vb text
, infixmdb number(10)
, in2workmde number(10)
, inpatch number(10)
, fixnote text
);
CREATE TABLE IF NOT EXISTS a2tree
 (
 veld number(10)
, tekst Varchar2(150)
, parent number(10)
);
CREATE TABLE IF NOT EXISTS a2users
 (
 gebruikerid number(10)
, computer Varchar2(450)
, aanmeldnaam Varchar2(450)
, versie Varchar2(45)
, overnemen number(10)
, bezigmet Varchar2(150)
, aangemeld Varchar2(20)
);
CREATE TABLE IF NOT EXISTS a2versie
 (
 versie Varchar2(30)
, gepubliceerd Varchar2(20)
, alleenvoor text
);
CREATE TABLE IF NOT EXISTS a3analyse
 (
 analyseid number(10)
, betreft Varchar2(105)
, sleutel1 number(10)
, sleutel2 number(10)
, sleutel3 number(10)
, bedrag1 number(10)
, bedrag2 number(10)
, bedrag3 number(10)
, l1 number(10)
, l2 number(10)
, l3 number(10)
, l4 number(10)
, l5 number(10)
, t1 Varchar2(450)
, t2 Varchar2(450)
, t3 Varchar2(450)
, t4 Varchar2(450)
, t5 Varchar2(450)
, d1 Varchar2(20)
, d2 Varchar2(20)
, d3 Varchar2(20)
, m1 text
, m2 text
, m3 text
);
CREATE TABLE IF NOT EXISTS a3change
 (
 changeid number(10)
, gebruikerid number(10)
, id Varchar2(150)
, recordid number(10)
, veldid number(10)
, regel number(10)
, rubriekid number(10)
, grid number(10)
, gridkey number(10)
, parentmodel number(10)
);
CREATE TABLE IF NOT EXISTS a3conversie
 (
 conversieid number(10)
, serie number(10)
, gebruikerid number(10)
, referentie Varchar2(750)
, id1 number(10)
, id2 number(10)
, id3 number(10)
, lng1 number(10)
, txt1 Varchar2(750)
, melding text
, moment Varchar2(20)
, m1 text
, id4 number(10)
, txt2 Varchar2(300)
);
CREATE TABLE IF NOT EXISTS a3delete
 (
 deleteid number(10)
, tijd Varchar2(20)
, tabel Varchar2(150)
, whereclause text
);
CREATE TABLE IF NOT EXISTS a3importmasker
 (
 maskerid number(10)
, betreftid number(10)
, volgnummer number(10)
, masker Varchar2(150)
, lengte number(10)
, naam Varchar2(180)
);
CREATE TABLE IF NOT EXISTS a3insert
 (
 insertid number(10)
, remoteid number(10)
, tijd Varchar2(20)
, tabel Varchar2(150)
, veld Varchar2(150)
, sleutel number(10)
, wordtsleutel number(10)
);
CREATE TABLE IF NOT EXISTS a3lock
 (
 gebruikerid number(10)
, tekst Varchar2(150)
, record number(10)
);
CREATE TABLE IF NOT EXISTS a3periodiek
 (
 periodiekid number(10)
, soort number(10)
, vanrekening Varchar2(108)
, vannaam Varchar2(150)
, oprekening Varchar2(114)
, opnaam Varchar2(150)
, bedrag number(10)
, iedere number(10)
, frequentie number(10)
, volgendekeer Varchar2(20)
, nogkeren number(10)
, saldo number(10)
, omschrijving Varchar2(750)
, betaalkenmerk Varchar2(75)
, bron text
, verplichtingid number(10)
, rekeningid number(10)
, dossierid number(10)
, rekdogid number(10)
, betaalwijze number(10)
, door number(10)
, schuldid number(10)
, nosepavan Varchar2(36)
, laatstekeer Varchar2(20)
);
CREATE TABLE IF NOT EXISTS a3undo
 (
 undoid number(10)
, gebruikerid number(10)
, moment Varchar2(20)
, tekst text
);
CREATE TABLE IF NOT EXISTS a3update
 (
 updateid number(10)
, dossierid number(10)
, tijd Varchar2(20)
, betreft Varchar2(450)
, id number(10)
, verandering text
);
CREATE TABLE IF NOT EXISTS a3xml
 (
 a3xmlid number(10)
, parentxmlid number(10)
, xmlid number(10)
, nivo number(10)
, regel number(10)
, t1 Varchar2(600)
, t2 Varchar2(300)
, t3 Varchar2(300)
, t4 Varchar2(300)
, t5 Varchar2(300)
, t6 Varchar2(300)
, t7 Varchar2(300)
, t8 Varchar2(300)
, t9 Varchar2(300)
, m1 text
, m2 text
, m3 text
, m4 text
, m5 text
, d1 Varchar2(20)
, d2 Varchar2(20)
, d3 Varchar2(20)
, d4 Varchar2(20)
, d5 Varchar2(20)
, l1 number(10)
, l2 number(10)
, l3 number(10)
, l4 number(10)
, l5 number(10)
, gebruikerid number(10)
, bronid number(10)
, l6 number(10)
, l7 number(10)
, l8 number(10)
, l9 number(10)
);
CREATE TABLE IF NOT EXISTS a4bankverwerk
 (
 cid number(10)
, verwerking__zoomk Varchar2(30)
);
CREATE TABLE IF NOT EXISTS a4betaalwijze
 (
 betaalwijzeid number(10)
, betaalwijze__kl1 Varchar2(105)
, specificatie Varchar2(15)
, kort Varchar2(150)
);
CREATE TABLE IF NOT EXISTS a4combo
 (
 uniekid number(10)
, comboid Varchar2(150)
, cid number(10)
, inhoud Varchar2(225)
, specificatie text
, volgnummer number(10)
, wijziging Varchar2(20)
);
CREATE TABLE IF NOT EXISTS a4formeel
 (
 formeelid number(10)
, onderwerpid number(10)
, soortbeschikkingid number(10)
);
CREATE TABLE IF NOT EXISTS a4grootboek
 (
 soortrekid number(10)
, soortrekening Varchar2(150)
, rubriek Varchar2(75)
, matrixid Varchar2(15)
);
CREATE TABLE IF NOT EXISTS a4prioriteit
 (
 prioriteit number(10)
, prioriteit__kl1 Varchar2(45)
);
CREATE TABLE IF NOT EXISTS a4prognose
 (
 statusid number(10)
, status__kl1 Varchar2(120)
, specificatie text
, opbetaalbaar Varchar2(250)
, opverwerken Varchar2(250)
);
CREATE TABLE IF NOT EXISTS a4vindsoort
 (
 vsid number(10)
, vindsoortid number(10)
, vindsoort Varchar2(105)
, insertquery text
, whereid Varchar2(300)
, ocrprioriteit number(10)
);
CREATE TABLE IF NOT EXISTS a4vtlb
 (
 vtlbid number(10)
, vtlb Varchar2(150)
);
CREATE TABLE IF NOT EXISTS a5certificaat
 (
 certificaatid number(10)
, certificaat Varchar2(150)
, soort number(10)
, mogelijkheid text
);
CREATE TABLE IF NOT EXISTS a5presdia
 (
 diaid number(10)
, presonderwerpid number(10)
, dianummer number(10)
, sjabloon Varchar2(150)
, stijlblad text
, dia text
, duur number(10)
, audio Varchar2(750)
);
CREATE TABLE IF NOT EXISTS a5presentatie
 (
 presentatieid number(10)
, presentatie Varchar2(150)
);
CREATE TABLE IF NOT EXISTS a5presinhoud
 (
 presinhoudid number(10)
, presentatieid number(10)
, presonderwerpid number(10)
, agendanummer number(10)
);
CREATE TABLE IF NOT EXISTS a5presniet
 (
 nietdiaid number(10)
, presentatieid number(10)
, dia number(10)
);
CREATE TABLE IF NOT EXISTS a5presonderwerp
 (
 presonderwerpid number(10)
, onderwerp Varchar2(300)
, zelfstandig Varchar2(250)
, toelichting text
);
CREATE TABLE IF NOT EXISTS a5rubriek
 (
 rubriekid number(10)
, rubriek Varchar2(225)
, specificatie text
, inregeling text
, opties Varchar2(75)
, access Varchar2(105)
, mysql Varchar2(105)
, sqlserver Varchar2(105)
);
CREATE TABLE IF NOT EXISTS a5systeemtreffer
 (
 trefferid number(10)
, trefwoord Varchar2(150)
, gaatover number(10)
, treftid number(10)
, treftsubid number(10)
, toelichting text
);
CREATE TABLE IF NOT EXISTS a5trefwoord
 (
 trefwoordid number(10)
, trefwoord Varchar2(150)
, associatie Varchar2(150)
, omdat text
, gewicht number(10)
, intern Varchar2(250)
);
CREATE TABLE IF NOT EXISTS a6afrondscript
 (
 afrondid number(10)
, inleesgroepid number(10)
, volgnummer number(10)
, omschrijving Varchar2(300)
, doet text
, voor text
);
CREATE TABLE IF NOT EXISTS a6inleestabel
 (
 inleesid number(10)
, inleesgroepid number(10)
, serie number(10)
, volgnummer number(10)
, tabel Varchar2(150)
, sleutel Varchar2(150)
, isidentity number(10)
, kanweg Varchar2(250)
, veldenlijst text
, whereclause text
);
CREATE TABLE IF NOT EXISTS a6koppel
 (
 koppelid number(10)
, referentie Varchar2(75)
, querie text
, geenidentieke Varchar2(250)
);
CREATE TABLE IF NOT EXISTS a6union
 (
 veld1 number(10)
, veld2 Varchar2(150)
);
CREATE TABLE IF NOT EXISTS a6updateveld
 (
 updateveldid number(10)
, inleesid number(10)
, veldnaam Varchar2(150)
, referentie Varchar2(150)
, istekst Varchar2(250)
, gridid number(10)
, bijafronden number(10)
);
CREATE TABLE IF NOT EXISTS a7check
 (
 checkid number(10)
, naam Varchar2(150)
, groep Varchar2(150)
, vnr number(10)
, toelichting text
, op Varchar2(20)
, laatstekeer text
, specifiek number(10)
, certificaat Varchar2(105)
, wijziging Varchar2(20)
);
CREATE TABLE IF NOT EXISTS a7checkquery
 (
 checkQid number(10)
, checkid number(10)
, volgnummer number(10)
, tekst Varchar2(150)
, query text
, doe text
, isjaar text
, vanafjaar text
, onderhanden text
, afgesloten text
, opmerking text
, gewijzigd Varchar2(20)
);
CREATE TABLE IF NOT EXISTS a8component
 (
 componentid number(10)
, component Varchar2(150)
, tiepe number(10)
, schermid number(10)
, toelichting text
, boven number(10)
, links number(10)
, hoogte number(10)
, breedte number(10)
, zichtbaar number(10)
, topA number(10)
, toelichtingA text
, topB number(10)
, toelichtingB text
, topC number(10)
, toelichtingC text
, topD number(10)
, toelichtingD text
, topE number(10)
, toelichtingE text
, topF number(10)
, toelichtingF text
, label Varchar2(150)
);
CREATE TABLE IF NOT EXISTS a8extern
 (
 externID number(10)
, extern Varchar2(150)
, dsn text
);
CREATE TABLE IF NOT EXISTS a8faq
 (
 faqid number(10)
, groep Varchar2(150)
, faq Varchar2(225)
, soort number(10)
, selectsql text
, dossieraantal text
, trefwoorden text
, toelichting text
);
CREATE TABLE IF NOT EXISTS a8foreignkey
 (
 foreignid number(10)
, volgnummer number(10)
, tabelid number(10)
, veldid number(10)
, parentTabelid number(10)
, parentveldid number(10)
, integriteit number(10)
, controle Varchar2(250)
, filterveld number(10)
, filterconditie Varchar2(150)
, actieupdate Varchar2(250)
, actieupdateid number(10)
, actiedelete Varchar2(250)
, actiedeleteid number(10)
);
CREATE TABLE IF NOT EXISTS a8functions
 (
 functionid number(10)
, aanroep text
, toelichting text
, sqlserver text
, wijziging Varchar2(20)
, volgnummer number(10)
);
CREATE TABLE IF NOT EXISTS a8index
 (
 indexid number(10)
, indexnummer number(10)
, volgnummer number(10)
, tabelid number(10)
, veldid number(10)
, soortid number(10)
, aflopend number(10)
, geklusterd Varchar2(250)
, inbegrepen Varchar2(250)
);
CREATE TABLE IF NOT EXISTS a8scherm
 (
 schermid number(10)
, scherm Varchar2(300)
, toelichting text
, layers text
);
CREATE TABLE IF NOT EXISTS a8storedprocedure
 (
 storedid number(10)
, naam Varchar2(150)
, volgnummer number(10)
, toelichting text
, sqlserver text
, metparameters text
, wijziging Varchar2(20)
, indexen text
, dropeerst text
);
CREATE TABLE IF NOT EXISTS a8tabel
 (
 tabelid number(10)
, tabel Varchar2(60)
, tabelnaam Varchar2(75)
, toelichting text
, module number(10)
, beheerwijze number(10)
, eigenparenttabelid number(10)
, insqlserver number(10)
, integriteit text
, wijziging Varchar2(20)
, eigenwijziging number(10)
);
CREATE TABLE IF NOT EXISTS a8trigger
 (
 triggerid number(10)
, tabelid number(10)
, gridid number(10)
, serie number(10)
, volgnummer number(10)
, statement text
, tablewhere text
, herstelwhere text
, inleeswhere text
, dagelijks Varchar2(250)
, wijziging Varchar2(20)
);
CREATE TABLE IF NOT EXISTS a8veld
 (
 veldid number(10)
, tabelid number(10)
, volgnummer number(10)
, veld Varchar2(150)
, blok Varchar2(75)
, veldnaam Varchar2(150)
, rubriekid number(10)
, lengte number(10)
, proef Varchar2(30)
, masker Varchar2(150)
, layer Varchar2(45)
, standaardwaarde Varchar2(150)
, bron text
, bronsourcesqlserver text
, toelichting text
, componentid number(10)
);
CREATE TABLE IF NOT EXISTS a8veldtabel
 (
 veldid number(10)
, tabelveld Varchar2(213)
, sleutel number(10)
, tabelid number(10)
);
CREATE TABLE IF NOT EXISTS a8view
 (
 viewid number(10)
, naam Varchar2(150)
, volgnummer number(10)
, toelichting text
, sqlserver text
, metparameters text
, wijziging Varchar2(20)
, indexen text
, dropeerst text
);
CREATE TABLE IF NOT EXISTS a8visualbasic
 (
 vbid number(10)
, groep Varchar2(300)
, vbfunctie Varchar2(1500)
, vbdefinitie text
, gevaar number(10)
, trefwoorden text
, toelichting text
);
CREATE TABLE IF NOT EXISTS a8wijziging
 (
 wijzigid number(10)
, tabelid number(10)
, recordid number(10)
, wijziging Varchar2(20)
);
CREATE TABLE IF NOT EXISTS a9belasting
 (
 belastingid number(10)
, belasting Varchar2(75)
, jaar number(10)
, percentage1 number(10)
, totbedrag1 number(10)
, percentage2 number(10)
, totbedrag2 number(10)
, percentage3 number(10)
);
CREATE TABLE IF NOT EXISTS a9btw
 (
 btwid number(10)
, ingangsdatum Varchar2(20)
, laag number(10)
, hoog number(10)
);
CREATE TABLE IF NOT EXISTS a9rechtbankrubriek
 (
 rbrubriekid number(10)
, rbgroepid number(10)
, volgnummer number(10)
, rbrubriek Varchar2(300)
, bronid number(10)
, specificeren Varchar2(250)
, vervallen Varchar2(250)
, identificatie Varchar2(105)
);
CREATE TABLE IF NOT EXISTS a9rechtbankverantwoordingen
 (
 rbrubriekid number(10)
, rbrubriek Varchar2(300)
, rubriek Varchar2(330)
, volgnummer number(10)
, rbgroepid number(10)
);
CREATE TABLE IF NOT EXISTS a9rente
 (
 renteid number(10)
, rente Varchar2(150)
, jaar number(10)
, kwartaal number(10)
, percentage number(10)
);
CREATE TABLE IF NOT EXISTS adDubbeleBankInAdverplichting
 (
 nosepanummer Varchar2(102)
, bankrekening Varchar2(102)
, keer number(10)
);
CREATE TABLE IF NOT EXISTS adDubbeleBankInAdverplichtingSum
 (
 nosepanummer Varchar2(102)
, keren number(10)
);
CREATE TABLE IF NOT EXISTS adExport772034
 (
 id number(10)
, jaar number(10)
, maand number(10)
, onderwerp Varchar2(150)
, tariefcode Varchar2(75)
, omzetsoortid number(10)
, omzetsoort Varchar2(225)
, dossier Varchar2(750)
, kenmerk Varchar2(150)
, debiteurnaam Varchar2(600)
, debiteurzoeknaam Varchar2(210)
, postadres text
, straat Varchar2(150)
, huisnummer Varchar2(75)
, postcode Varchar2(75)
, plaats Varchar2(150)
, omschrijving Varchar2(450)
, bruto number(10)
, btw number(10)
, netto number(10)
, administratieid number(10)
, onderwerpid number(10)
, debiteurennummer Varchar2(300)
, externdossierkenmerk Varchar2(150)
, grootboekrekening number(10)
, kostenplaats number(10)
);
CREATE TABLE IF NOT EXISTS adHerstelSaldo
 (
 herstelid number(10)
, rekdogid number(10)
, datum Varchar2(20)
, jumpdelta number(10)
);
CREATE TABLE IF NOT EXISTS adLastAfschrift
 (
 dossierid number(10)
, dogid number(10)
, soortid number(10)
, rekening Varchar2(750)
, tenaamstelling Varchar2(750)
, soort Varchar2(750)
, contract Varchar2(750)
, boekdatum Varchar2(20)
, eindsaldo number(10)
);
CREATE TABLE IF NOT EXISTS adafschriftbron
 (
 afschriftid number(10)
, bron text
, inleesdogid number(10)
, herstelid number(10)
);
CREATE TABLE IF NOT EXISTS adbank
 (
 afschriftid number(10)
, dossierid number(10)
, rekening Varchar2(102)
, soort number(10)
, rekdogid number(10)
, nummer number(10)
, beginsaldo number(10)
, eindsaldo number(10)
, boekdatum Varchar2(20)
, aantalposten number(10)
, credit number(10)
, debet number(10)
, afschriftzoom Varchar2(300)
, inleesdogid number(10)
, methode number(10)
, laatste Varchar2(250)
, probleemid number(10)
, eindeffecten number(10)
);
CREATE TABLE IF NOT EXISTS adbankeerste
 (
 dossierid number(10)
, rekdogid number(10)
, MinVanboekdatum Varchar2(20)
);
CREATE TABLE IF NOT EXISTS adbankgeenMT940
 (
 dogid number(10)
, referentie Varchar2(750)
, dossier Varchar2(750)
, rekening Varchar2(750)
, rekeningnr Varchar2(750)
, tnv Varchar2(750)
, saldo number(10)
, eindnbspvannbspdatum Varchar2(20)
, _grid number(10)
, administratieid number(10)
, dossierid number(10)
);
CREATE TABLE IF NOT EXISTS adbankgeenMT940OFHAND
 (
 dogid number(10)
, referentie Varchar2(750)
, dossier Varchar2(750)
, rekening Varchar2(750)
, rekeningnr Varchar2(750)
, tnv Varchar2(750)
, contract Varchar2(750)
, saldo number(10)
, eindnbspvannbspdatum Varchar2(20)
, _grid number(10)
, administratieid number(10)
, dossierid number(10)
);
CREATE TABLE IF NOT EXISTS adbankgrootboek
 (
 rekeningid number(10)
, dossierid number(10)
, rekdogid number(10)
);
CREATE TABLE IF NOT EXISTS adbankpostoormerk
 (
 boid number(10)
, boekregelid number(10)
, oormerk Varchar2(150)
);
CREATE TABLE IF NOT EXISTS adbanksaldo
 (
 saldoid number(10)
, dossierid number(10)
, jaar number(10)
, soort number(10)
, rekdogid number(10)
, rekeningnummer Varchar2(102)
, beginsaldo number(10)
, af__kl1 number(10)
, bij__kl1 number(10)
, mutaties__kl1 number(10)
, eindsaldo number(10)
);
CREATE TABLE IF NOT EXISTS adbanksaldoop
 (
 saldoid number(10)
, dossierid number(10)
);
CREATE TABLE IF NOT EXISTS adbankspecs
 (
 specificatieid number(10)
, specificatie Varchar2(300)
, boekregelid number(10)
, bedrag number(10)
, dossierid number(10)
, rekdogid number(10)
);
CREATE TABLE IF NOT EXISTS adbegrotingen
 (
 dossierid number(10)
, jaar number(10)
);
CREATE TABLE IF NOT EXISTS adbeheerrekening
 (
 rekening Varchar2(750)
, dossierid number(10)
, tenaamstelling Varchar2(750)
, dogid number(10)
, soort Varchar2(750)
, soortid number(10)
);
CREATE TABLE IF NOT EXISTS adbeheerwijze
 (
 cid number(10)
, beheerwijze__kl1 Varchar2(750)
);
CREATE TABLE IF NOT EXISTS adboekhouddossiers
 (
 administratieid number(10)
, bhdossierid number(10)
, relatieid number(10)
);
CREATE TABLE IF NOT EXISTS adboekhouddossiersAll
 (
 dossierid number(10)
, eigendeclaraties number(10)
);
CREATE TABLE IF NOT EXISTS adboekregel
 (
 boekregelid number(10)
, tegenrekening Varchar2(102)
, dossierid number(10)
, rekdogid number(10)
, rekendatum Varchar2(20)
, afschriftid number(10)
, volgnummer number(10)
, datum Varchar2(20)
, bedrag number(10)
, toelichting Varchar2(1500)
, vandossierid number(10)
, af number(10)
, bij number(10)
, verwerkteposten number(10)
, verwerktbedrag number(10)
, verwerking number(10)
, bankcode number(10)
, specificatie number(10)
, endtoendid number(10)
, naamstelling Varchar2(300)
, nosepategenrek Varchar2(102)
, ruw Varchar2(1536)
);
CREATE TABLE IF NOT EXISTS adboekregelstat
 (
 rekdogid number(10)
, dossierid number(10)
, eerste Varchar2(20)
, laatste Varchar2(20)
, posten number(10)
);
CREATE TABLE IF NOT EXISTS adbtwpercentage
 (
 administratieid number(10)
, btwpercentage number(10)
);
CREATE TABLE IF NOT EXISTS adcrediteurenMEM
 (
 verplichtingid number(10)
, memoriaal number(10)
);
CREATE TABLE IF NOT EXISTS addubbeleperiodiek
 (
 verplichtingid number(10)
, bedrag number(10)
, prognoseid number(10)
, datum Varchar2(20)
, statusid number(10)
);
CREATE TABLE IF NOT EXISTS adeenbeheerrekening
 (
 dossierid number(10)
, beheerrekening Varchar2(750)
);
CREATE TABLE IF NOT EXISTS adeigenfactuuropen
 (
 verplichtingid number(10)
, gridid number(10)
);
CREATE TABLE IF NOT EXISTS adexport2786
 (
 referentie Varchar2(600)
, nummer Varchar2(300)
);
CREATE TABLE IF NOT EXISTS adexportdata
 (
 exportid number(10)
, tempveld number(10)
, administratieid number(10)
, id float
, cid1 number(10)
, regel number(10)
, k1 Varchar2(450)
, k2 Varchar2(450)
, k3 Varchar2(450)
, k4 Varchar2(450)
, k5 Varchar2(450)
, k6 Varchar2(450)
, k7 Varchar2(450)
, k8 Varchar2(450)
, k9 Varchar2(450)
, k0 Varchar2(450)
);
CREATE TABLE IF NOT EXISTS adexportkolommen
 (
 exportid number(10)
, k1 Varchar2(450)
, k2 Varchar2(450)
, k3 Varchar2(450)
, k4 Varchar2(450)
, k5 Varchar2(450)
, k6 Varchar2(450)
, k7 Varchar2(450)
, k8 Varchar2(450)
, k9 Varchar2(450)
, k10 Varchar2(450)
, k11 Varchar2(450)
, k12 Varchar2(450)
, k13 Varchar2(450)
, k14 Varchar2(450)
, k15 Varchar2(450)
, k16 Varchar2(450)
, k17 Varchar2(450)
, k18 Varchar2(450)
, k19 Varchar2(450)
, k20 Varchar2(450)
, k21 Varchar2(450)
, k22 Varchar2(450)
, k23 Varchar2(450)
, k24 Varchar2(450)
, k25 Varchar2(450)
, k26 Varchar2(450)
, k27 Varchar2(450)
, k28 Varchar2(450)
, k29 Varchar2(450)
, k30 Varchar2(450)
, k31 Varchar2(450)
, k32 Varchar2(450)
, k33 Varchar2(450)
, k34 Varchar2(450)
, k35 Varchar2(450)
, k36 Varchar2(450)
, k37 Varchar2(450)
, k38 Varchar2(450)
, k39 Varchar2(450)
, k40 Varchar2(450)
, k41 Varchar2(450)
, k42 Varchar2(450)
, k43 Varchar2(450)
, k44 Varchar2(450)
, k45 Varchar2(450)
, k46 Varchar2(450)
, k47 Varchar2(450)
, k48 Varchar2(450)
, k49 Varchar2(450)
, k50 Varchar2(450)
, k51 Varchar2(450)
, k52 Varchar2(450)
, k53 Varchar2(450)
, k54 Varchar2(450)
, k55 Varchar2(450)
, k56 Varchar2(450)
, k57 Varchar2(450)
, k58 Varchar2(450)
, k59 Varchar2(450)
, k60 Varchar2(450)
, k61 Varchar2(450)
, k62 Varchar2(450)
, k63 Varchar2(450)
, k64 Varchar2(450)
, k65 Varchar2(450)
, k66 Varchar2(450)
, k67 Varchar2(450)
, k68 Varchar2(450)
, k69 Varchar2(450)
, k70 Varchar2(450)
, id float
, cid1 number(10)
, administratieid number(10)
);
CREATE TABLE IF NOT EXISTS adfactuuropenstaandALL
 (
 verplid number(10)
, openstaand number(10)
);
CREATE TABLE IF NOT EXISTS adfactuurregel
 (
 factuurregelid number(10)
, verplichtingid number(10)
, dossierid number(10)
, volgnummer number(10)
, datum Varchar2(20)
, tekst text
, tal number(10)
, eenheid Varchar2(75)
, tarief number(10)
, bedrag number(10)
, btwcode number(10)
, bruto number(10)
, rekeningid number(10)
, sommeren Varchar2(150)
);
CREATE TABLE IF NOT EXISTS adgewaarmerkt
 (
 waarmerkid number(10)
, rekening Varchar2(102)
, naamstelling Varchar2(750)
, nosepa Varchar2(102)
, einddatum Varchar2(20)
, dossierid number(10)
, controlegetal Varchar2(45)
, door number(10)
, op Varchar2(20)
, administratieid number(10)
);
CREATE TABLE IF NOT EXISTS adinstelling
 (
 instellingid number(10)
, gridid number(10)
, dossierid number(10)
, verplichtingid number(10)
, prognoseid number(10)
, jaar number(10)
, bedrag number(10)
, post1 number(10)
, post2 number(10)
, post3 number(10)
, post4 number(10)
, post5 number(10)
, post6 number(10)
, post7 number(10)
, post8 number(10)
, post9 number(10)
, post10 number(10)
, moment Varchar2(20)
, door number(10)
, voortschrijdend number(10)
, separekening Varchar2(30)
, instdogid number(10)
, post0 number(10)
, factuurnummer Varchar2(150)
, postniet number(10)
);
CREATE TABLE IF NOT EXISTS adinstellingsregel
 (
 instellingsregelid number(10)
, dogid number(10)
, instellingid number(10)
, kolom number(10)
, verantwoordingid number(10)
, omschrijving Varchar2(750)
, bedrag number(10)
, dossierid number(10)
, factuurnummer Varchar2(750)
);
CREATE TABLE IF NOT EXISTS adinventaris
 (
 inventarisid number(10)
, referentie Varchar2(450)
, toelichting text
, idsoort1 number(10)
, id1 Varchar2(300)
, idsoort2 number(10)
, id2 Varchar2(300)
, idsoort3 number(10)
, id3 Varchar2(300)
, idsoort4 number(10)
, id4 Varchar2(300)
, aanschafdatum Varchar2(20)
, aanschafbedrag number(10)
, aantal number(10)
, boekstuk1 number(10)
, bedrag1 number(10)
, boekstuk2 number(10)
, bedrag2 number(10)
, boekstuk3 number(10)
, bedrag3 number(10)
, verzekerid number(10)
, rekeningid number(10)
, maanden number(10)
, percentage Varchar2(300)
, ontvangstwijze number(10)
, einddatum Varchar2(20)
, eindreden number(10)
, opbrengst number(10)
, eindtoelichting text
, dossierid number(10)
, restwaarde number(10)
);
CREATE TABLE IF NOT EXISTS adjournaal
 (
 journaalid number(10)
, omschrijving Varchar2(150)
, prognoseid number(10)
, boekregelid number(10)
, verplichtingid number(10)
, inventarisid number(10)
, dogid number(10)
, dossierid number(10)
, boekjaar number(10)
, periode number(10)
, journaalsoortid number(10)
, toelichting text
, clusterid number(10)
);
CREATE TABLE IF NOT EXISTS adjournaalpost
 (
 journaalpostid number(10)
, journaalid number(10)
, rekeningid number(10)
, debet number(10)
, credit number(10)
, detailid number(10)
, verklaring Varchar2(300)
);
CREATE TABLE IF NOT EXISTS adkruisboekregel
 (
 kruisboekregelid number(10)
, boekregelid number(10)
, tegenrekening Varchar2(102)
, naamstelling Varchar2(300)
, dossierid number(10)
, rekdogid number(10)
, rekendatum Varchar2(20)
, afschriftid number(10)
, volgnummer number(10)
, datum Varchar2(20)
, bedrag number(10)
, toelichting Varchar2(1812)
, vandossierid number(10)
, af number(10)
, bij number(10)
, verwerkteposten number(10)
, verwerktbedrag number(10)
, verwerking number(10)
, bankcode number(10)
, specificatieid number(10)
);
CREATE TABLE IF NOT EXISTS adleefgeldrekening
 (
 rekening Varchar2(750)
, dossierid number(10)
, tenaamstelling Varchar2(750)
, dogid number(10)
, soort Varchar2(750)
);
CREATE TABLE IF NOT EXISTS admagontbreken
 (
 ontbreekid number(10)
, omschrijving text
, rekening Varchar2(102)
);
CREATE TABLE IF NOT EXISTS adnaamnummer
 (
 probleemid number(10)
, nummer Varchar2(102)
, naamstelling Varchar2(105)
, toelichting text
);
CREATE TABLE IF NOT EXISTS adoormerk
 (
 dossierid number(10)
, oormerk Varchar2(150)
);
CREATE TABLE IF NOT EXISTS adoormerken
 (
 dossierid number(10)
, oormerk Varchar2(150)
);
CREATE TABLE IF NOT EXISTS adpatroon
 (
 verwerkid number(10)
, administratieid number(10)
, rekeningnummer Varchar2(102)
, bedragvan number(10)
, bedragtot number(10)
, woorden text
, rekeningid number(10)
, pasna number(10)
, totdatum Varchar2(20)
, dossierid number(10)
, tariefcode Varchar2(105)
);
CREATE TABLE IF NOT EXISTS adpgbcregel
 (
 pgbcrid number(10)
, dogid number(10)
, pgbfunctieid number(10)
, omschrijving Varchar2(300)
, uurtarief number(10)
, jaar number(10)
, tariefsoort number(10)
);
CREATE TABLE IF NOT EXISTS adpgbfactuur
 (
 pgbfid number(10)
, verplichtingid number(10)
, pgbcrid number(10)
, uren number(10)
, bedrag number(10)
, prognoseid number(10)
, reiskosten number(10)
, overigekosten number(10)
);
CREATE TABLE IF NOT EXISTS adpostenbestrijken
 (
 rekdogid number(10)
, eerstepost Varchar2(20)
, aantalposten number(10)
, laatstepost Varchar2(20)
);
CREATE TABLE IF NOT EXISTS adprognose
 (
 prognoseid number(10)
, verplichtingid number(10)
, schuldid number(10)
, dossierid number(10)
, eigenaarid number(10)
, datum Varchar2(20)
, overmaken Varchar2(20)
, plandatum Varchar2(20)
, bedrag number(10)
, statusid number(10)
, oormerk Varchar2(150)
, betaalrunid number(10)
, foutcode number(10)
, verklaring text
, factuurid number(10)
, betaalkenmerk Varchar2(90)
, betaalwijzeid number(10)
, prioriteit number(10)
, tegenrekening number(10)
, betaalbaar number(10)
, verwerken number(10)
, uitvoering__kl1 Varchar2(20)
, betaaldnaarrek Varchar2(105)
, pgbid number(10)
, op Varchar2(20)
, door number(10)
, btw number(10)
, basisbedrag number(10)
, regel number(10)
, eigenstatusid number(10)
, dogid number(10)
, wasstatus1 number(10)
, wasstatus2 number(10)
, betaalomschrijving__kt1 Varchar2(600)
);
CREATE TABLE IF NOT EXISTS adprognoseA
 (
 prognoseid number(10)
, verplichtingid number(10)
, schuldid number(10)
, dossierid number(10)
, eigenaarid number(10)
, datum Varchar2(20)
, overmaken Varchar2(20)
, plandatum Varchar2(20)
, bedrag number(10)
, statusid number(10)
, oormerk Varchar2(150)
, betaalrunid number(10)
, foutcode number(10)
, verklaring text
, factuurid number(10)
, betaalkenmerk Varchar2(57)
, betaalwijzeid number(10)
, prioriteit number(10)
, tegenrekening number(10)
, betaalbaar number(10)
, verwerken number(10)
, uitvoering__kl1 Varchar2(20)
, pgbid number(10)
, op Varchar2(20)
, door number(10)
, btw number(10)
);
CREATE TABLE IF NOT EXISTS adprognosedatums
 (
 prognoseid number(10)
, plandatum Varchar2(20)
, datum Varchar2(20)
, uitvoering__kl1 Varchar2(20)
, overmaken Varchar2(20)
, zondag number(10)
, beloofd number(10)
);
CREATE TABLE IF NOT EXISTS adschuld
 (
 schuldid number(10)
, dossierid number(10)
, klantid number(10)
, omschrijving text
, referentie Varchar2(150)
, crediteurid number(10)
, crediteur Varchar2(750)
, schuldeiserid number(10)
, schuldeiser Varchar2(750)
, terattentievan Varchar2(750)
, bestemming text
, soort number(10)
, schuld number(10)
, toelichting text
, ontstaanid number(10)
, ontstaansreden text
, ontstaanop Varchar2(20)
, schuldlogid number(10)
, eerstekeer number(10)
, periodiek number(10)
, percentage number(10)
, laatstekeer number(10)
, maanden number(10)
, voorstelgridid number(10)
, aantalbinnen number(10)
, binnen Varchar2(75)
, termijnen number(10)
, termijnbedrag number(10)
, iedere number(10)
, eenheidiedere number(10)
, per number(10)
, eenheidper number(10)
, maarook number(10)
, termijnen2 number(10)
, termijnbedrag2 number(10)
, iedere2 number(10)
, eenheidiedere2 number(10)
, per2 number(10)
, eenheidper2 number(10)
, totaalbetalen number(10)
, totaalpercentage number(10)
, nietbetaald number(10)
, opdatum Varchar2(20)
, miv Varchar2(20)
, miv2 Varchar2(20)
, intekst text
, basisschuld number(10)
, rekenschuld number(10)
, rekenstatus number(10)
, bankrekening Varchar2(102)
, naamstelling Varchar2(120)
, bijgewerkt number(10)
, openstaand number(10)
, toename number(10)
, eerstedatum Varchar2(20)
, laatstedatum Varchar2(20)
, voorstel number(10)
, niet number(10)
, jaarberekening text
, kosten number(10)
, afgelost number(10)
, berekening text
, nietaanschrijven Varchar2(250)
, oorspronkelijkbekendop Varchar2(20)
);
CREATE TABLE IF NOT EXISTS adschuldlog
 (
 schuldlogid number(10)
, schuldid number(10)
, datum Varchar2(20)
, statusid number(10)
, toelichting text
, berichtid number(10)
, door number(10)
, schuldhoogte number(10)
, schuldeiserid number(10)
, schuldeiser Varchar2(750)
, terattentievan Varchar2(750)
, bestemming text
, referentie Varchar2(150)
, bankrekening Varchar2(102)
, naamstelling Varchar2(120)
, extraaflossing number(10)
, kosten number(10)
, verwerkid number(10)
, dogid number(10)
, op Varchar2(20)
);
CREATE TABLE IF NOT EXISTS adverdeling
 (
 verdeelid number(10)
, dogid number(10)
, regel number(10)
, dossierid number(10)
, v1 number(10)
, v2 number(10)
, v3 number(10)
, v4 number(10)
, v5 number(10)
, v6 number(10)
, v7 number(10)
, v8 number(10)
, v9 number(10)
, v10 number(10)
, v11 number(10)
, v12 number(10)
, v13 number(10)
, v14 number(10)
, v15 number(10)
, v16 number(10)
, v17 number(10)
, v18 number(10)
, v19 number(10)
, v20 number(10)
, v21 number(10)
, v22 number(10)
, v23 number(10)
, v24 number(10)
, v25 number(10)
);
CREATE TABLE IF NOT EXISTS advermtoeslag
 (
 vtoeslagid number(10)
, dossierid number(10)
, gemsaldo number(10)
, toeslag number(10)
, tegoed number(10)
, opname number(10)
, prognosedatum Varchar2(20)
, dogid number(10)
, doorbelast number(10)
, opmerking Varchar2(150)
);
CREATE TABLE IF NOT EXISTS adverplgrid
 (
 vpgridid number(10)
, verplichtingid number(10)
, regel number(10)
, l1 number(10)
, l2 number(10)
, l3 number(10)
, t1 Varchar2(750)
, t2 Varchar2(750)
, m1 text
, l4 number(10)
, l5 number(10)
, t3 Varchar2(150)
);
CREATE TABLE IF NOT EXISTS adverplichting
 (
 verplichtingid number(10)
, dossierid number(10)
, gridid number(10)
, klantid number(10)
, schuldid number(10)
, toelichting text
, terattentievan text
, adres text
, klantreferentie number(10)
, klantnummer Varchar2(150)
, startsaldo number(10)
, relatieid number(10)
, naam Varchar2(750)
, eerstekeer Varchar2(20)
, wijzigingper Varchar2(20)
, keren number(10)
, totaalbedrag number(10)
, laatstekeer Varchar2(20)
, iedere number(10)
, eenheidiedere number(10)
, per number(10)
, eenheidper number(10)
, rekeningid number(10)
, Bedrag number(10)
, plusminbedrag number(10)
, plusmindag number(10)
, maandbedrag number(10)
, bankrekening Varchar2(102)
, naamstelling Varchar2(150)
, tegenrekening number(10)
, betaalwijzeid number(10)
, prioriteit number(10)
, hoedanid number(10)
, hoedan Varchar2(750)
, oormerk Varchar2(150)
, betaalomschrijving Varchar2(600)
, budgetbedrag number(10)
, door number(10)
, op Varchar2(20)
, alszin Varchar2(750)
, regeling text
, aantal number(10)
, aantal2 number(10)
, aantal3 number(10)
, aantal4 number(10)
, factuurid number(10)
, tekst1 Varchar2(750)
, datum Varchar2(20)
, datum2 Varchar2(20)
, hek Varchar2(36)
, tekst2 Varchar2(300)
, pgbid number(10)
, convpatroonid number(10)
, convkeren number(10)
, budgettekst text
, nettomaandbedrag number(10)
, aantal5 number(10)
, plusplusbedrag number(10)
, nosepabankrek Varchar2(102)
);
CREATE TABLE IF NOT EXISTS adverplichtingdatums
 (
 verplichtingid number(10)
, eerstekeer Varchar2(20)
, zondag number(10)
, beloofd number(10)
);
CREATE TABLE IF NOT EXISTS adverplvermtoeslag
 (
 verplichtingid number(10)
, dossierid number(10)
);
CREATE TABLE IF NOT EXISTS adverwerkendtoend
 (
 prognoseid number(10)
, verplichtingid number(10)
, dossierid number(10)
, boekregelid number(10)
, bedrag number(10)
, rekendatum Varchar2(20)
, rekeningid number(10)
, eigenaarid number(10)
, schuldid number(10)
);
CREATE TABLE IF NOT EXISTS adverwerking
 (
 verwerkid number(10)
, boekregelid number(10)
, metboekregelid number(10)
, verplichtingid number(10)
, prognoseid number(10)
, rekeningid number(10)
, bedrag number(10)
, schuldid number(10)
, door Varchar2(90)
, dogid number(10)
);
CREATE TABLE IF NOT EXISTS adverwerkteregels
 (
 boekregelid number(10)
, verwerkteregels number(10)
, totaalverwerkt number(10)
);
CREATE TABLE IF NOT EXISTS adverzekering
 (
 verzekerid number(10)
, verzsoortid number(10)
, polisnummer Varchar2(150)
, maatschappij Varchar2(450)
, assuradeurid number(10)
, verzekerden text
, opmerking text
, dossierid number(10)
, begindatum Varchar2(20)
, einddatum Varchar2(20)
, bedrag1 number(10)
, bedrag2 number(10)
, check1 Varchar2(250)
, check2 Varchar2(250)
, check3 Varchar2(250)
, check4 Varchar2(250)
, check5 Varchar2(250)
, jaarpremie number(10)
, verlenging number(10)
, verplichtingid number(10)
, verzekerd text
, verzstatus number(10)
, volgendepolis Varchar2(20)
);
CREATE TABLE IF NOT EXISTS adxbankcode
 (
 bcid number(10)
, bank Varchar2(75)
, toelichting Varchar2(225)
, codeinmt Varchar2(105)
, cid number(10)
, bic Varchar2(12)
);
CREATE TABLE IF NOT EXISTS adxbankcorrectie
 (
 bcorrid number(10)
, volgnummer number(10)
, toelichting text
, alsbevat Varchar2(150)
, maarniet Varchar2(150)
, deel Varchar2(150)
, totaan Varchar2(150)
, wordt Varchar2(150)
);
CREATE TABLE IF NOT EXISTS adxbanken
 (
 bankid number(10)
, bankcontract Varchar2(150)
, clieop Varchar2(150)
, mt940 Varchar2(150)
, woonplaats Varchar2(250)
, betaalkenmerk Varchar2(250)
, datumafhandeling number(10)
, afschriftvolgnr Varchar2(250)
, betalenopzondag Varchar2(250)
, eerderafgeschreven number(10)
, exactematch Varchar2(250)
, betalenochtend Varchar2(250)
, spaarinclieop Varchar2(250)
, bic number(10)
, CAMTid number(10)
, PAINid number(10)
, PAINsuffix Varchar2(30)
, IncassopainID number(10)
, IncassoPAINsuffix Varchar2(30)
);
CREATE TABLE IF NOT EXISTS adxbankxml
 (
 xmlid number(10)
, parentxmlid number(10)
, tag Varchar2(105)
, volgnummer number(10)
, attributen text
, bewerking text
, wordtwaarde Varchar2(105)
, overslaan text
, documentatie__kl1 text
);
CREATE TABLE IF NOT EXISTS adxbankxmlcode
 (
 xmlcodeid number(10)
, xmlveld Varchar2(105)
, nr number(10)
, bank Varchar2(75)
, xmlwaarde Varchar2(75)
, endtag text
, wordtwaarde Varchar2(105)
, toelichting text
);
CREATE TABLE IF NOT EXISTS adxconvpatroon
 (
 cpatronid number(10)
, volgnummer number(10)
, beschrijving text
, rekeningnummer Varchar2(102)
, bedragvan number(10)
, bedragtot number(10)
, woorden text
, verantwoordingid number(10)
, wijze number(10)
, alseenkeer number(10)
, correspondentie Varchar2(150)
, naamstelling Varchar2(105)
, betaalomschrijving Varchar2(450)
, betaalwijze number(10)
, resultaat Varchar2(450)
, plusmin number(10)
);
CREATE TABLE IF NOT EXISTS adxexportkolom
 (
 kolomid number(10)
, administratieid number(10)
, volgnummer number(10)
, kolomreferentie Varchar2(150)
, exportveld Varchar2(750)
, reeks Varchar2(75)
, tekenset number(10)
, opmaak number(10)
, masker Varchar2(75)
, alsleeg Varchar2(75)
, veldlengte number(10)
, cid1 number(10)
, serie number(10)
);
CREATE TABLE IF NOT EXISTS adxexportreeks
 (
 reeksid number(10)
, reeks Varchar2(75)
, in2work Varchar2(150)
, wordt Varchar2(150)
, administratieid number(10)
, cid1 number(10)
);
CREATE TABLE IF NOT EXISTS adxgrootboek
 (
 rekeningid number(10)
, rekening Varchar2(150)
, matrixid Varchar2(9)
, soort number(10)
, volgorde number(10)
, afschrijvenin number(10)
, dossierid number(10)
, activarekeningid number(10)
, bankrekeningid number(10)
, nietopboeken number(10)
, relatieid number(10)
, kostenrekeningid number(10)
);
CREATE TABLE IF NOT EXISTS adxgrootboekplus
 (
 rekid number(10)
, rek Varchar2(4000)
, mtrxid Varchar2(9)
, dossierid number(10)
);
CREATE TABLE IF NOT EXISTS adxinstelling
 (
 instelrekid number(10)
, jaar number(10)
, rekening1 number(10)
, rekening2 number(10)
, rekening3 number(10)
, rekening4 number(10)
, rekening5 number(10)
, rekening6 number(10)
, rekening7 number(10)
, rekening8 number(10)
, rekening9 number(10)
, rekening10 number(10)
);
CREATE TABLE IF NOT EXISTS adxjournaalsoort
 (
 journaalsoortid number(10)
, journaalsoort Varchar2(150)
, toelichting text
, bijaanmaken text
, bijwijzigen text
, bijverwijderen text
, prognoseid Varchar2(250)
, boekregelid Varchar2(250)
, verplichtingid Varchar2(250)
, inventarisid Varchar2(250)
, dogid Varchar2(250)
, clusterid Varchar2(250)
);
CREATE TABLE IF NOT EXISTS adxmatrix
 (
 matrixid Varchar2(9)
, matrix Varchar2(150)
, groep number(10)
, verantwoordingvolgnr number(10)
, verantwoordinggroep Varchar2(150)
, gridID Varchar2(12)
, grid Varchar2(150)
, volgnummer number(10)
);
CREATE TABLE IF NOT EXISTS adxperiode
 (
 periode number(10)
, van Varchar2(20)
, totmet Varchar2(20)
, soort number(10)
, kwartaal number(10)
);
CREATE TABLE IF NOT EXISTS adxpgbfunctie
 (
 pgbfunctieid number(10)
, functie Varchar2(150)
, functiecode Varchar2(15)
, soort number(10)
, jr2009 Varchar2(250)
, jr2010 Varchar2(250)
, jr2011 Varchar2(250)
, jr2012 Varchar2(250)
, jr2013 Varchar2(250)
, jr2014 Varchar2(250)
, jr2015 Varchar2(250)
, jr2016 Varchar2(250)
, jr2017 Varchar2(250)
, jr2018 Varchar2(250)
);
CREATE TABLE IF NOT EXISTS adxrekening
 (
 rekeningid number(10)
, matrixid Varchar2(9)
, rekening Varchar2(300)
, volgnummer number(10)
, soort number(10)
, briefnaam Varchar2(750)
, briefspecificatie Varchar2(750)
, briefspecificatie2 Varchar2(750)
, vtlbid number(10)
, archivering number(10)
, rapportage Varchar2(300)
, briefspecificatie3 Varchar2(3000)
, relatiesoortid number(10)
, rbrubriekid number(10)
, saemen number(10)
);
CREATE TABLE IF NOT EXISTS adxschuldstatus
 (
 schuldstatusid number(10)
, status Varchar2(150)
, vraaghoogte Varchar2(250)
, alsstatusis Varchar2(150)
, soort number(10)
);
CREATE TABLE IF NOT EXISTS adxtemp
 (
 tempid number(10)
, id1 number(10)
, id2 number(10)
, id3 number(10)
, melding text
, lng1 number(10)
, stmt text
);
CREATE TABLE IF NOT EXISTS adxverzekering
 (
 verzsoortid number(10)
, verzekeringsoort Varchar2(150)
, verzekeringgroep number(10)
, verzekerd number(10)
, rbrubriekid number(10)
, bedrag1 Varchar2(75)
, bedrag2 Varchar2(75)
, check1 Varchar2(75)
, check2 Varchar2(75)
, check3 Varchar2(75)
, check4 Varchar2(75)
, check5 Varchar2(75)
);
CREATE TABLE IF NOT EXISTS adzbetaald
 (
 betaaldid number(10)
, administratieid number(10)
, onderwerpid number(10)
, begeleiding number(10)
, overige number(10)
, maand Varchar2(75)
, maandvolgnr number(10)
, tegenrekening Varchar2(102)
, k1 number(10)
, k2 number(10)
, k3 number(10)
, k4 number(10)
, k5 number(10)
, pakket Varchar2(75)
, machtigingen number(10)
, voorschotten number(10)
);
CREATE TABLE IF NOT EXISTS adzbetaalrun
 (
 rekdogid number(10)
, rekening Varchar2(102)
, dossierid number(10)
, eigenaarid number(10)
, eindsaldo number(10)
, betaald number(10)
, nogleefgeld number(10)
, reservering number(10)
, rc number(10)
, horizondatum Varchar2(20)
, posten number(10)
, totaalposten number(10)
, geselecteerd number(10)
, overtemaken number(10)
, status number(10)
, incasso number(10)
, gecontroleerd number(10)
, fiatteren number(10)
);
CREATE TABLE IF NOT EXISTS adzbudgetplan
 (
 budgetid number(10)
, dossierid number(10)
, datum Varchar2(20)
, inkomsten number(10)
, uitgaven number(10)
, leefgeld number(10)
, regelingen number(10)
, reserveringen number(10)
, ruimte number(10)
, overzicht text
, soortid number(10)
);
CREATE TABLE IF NOT EXISTS adzbusiness
 (
 businessid number(10)
, dossierid number(10)
, rekeningid number(10)
, periode number(10)
, gebruikerid number(10)
, debet number(10)
, credit number(10)
);
CREATE TABLE IF NOT EXISTS adzincassorun
 (
 rekdogid number(10)
, rekening Varchar2(102)
, dossierid number(10)
, eigenaarid number(10)
, eindsaldo number(10)
, betaald number(10)
, nogleefgeld number(10)
, reservering number(10)
, rc number(10)
, horizondatum Varchar2(20)
, posten number(10)
, totaalposten number(10)
, geselecteerd number(10)
, teincasseren number(10)
, status number(10)
, incasso number(10)
, isfirst Varchar2(250)
);
CREATE TABLE IF NOT EXISTS adzomzet
 (
 omzetid number(10)
, administratieid number(10)
, onderwerpid number(10)
, tariefcode Varchar2(75)
, dossierid number(10)
, relatieid number(10)
, soort number(10)
, subid number(10)
, omschrijving Varchar2(450)
, jaar number(10)
, maand number(10)
, omzet number(10)
, netto number(10)
, btw number(10)
, geboektbruto number(10)
, geboektnetto number(10)
, vaneerder number(10)
, vanvorigjaar number(10)
, controle Varchar2(250)
, grootboekid number(10)
, kostenplaats number(10)
);
CREATE TABLE IF NOT EXISTS adzpersoneel
 (
 persstatid number(10)
, jaar number(10)
, gebruikerid number(10)
, doordeweeks number(10)
, feestencolvrij number(10)
, vakantie number(10)
, ziek number(10)
, saldo number(10)
, fte number(10)
, bijzverlof number(10)
, kwartaal number(10)
);
CREATE TABLE IF NOT EXISTS adzposten
 (
 postid number(10)
, dogid number(10)
, prognoseid number(10)
, verplichtingid number(10)
, plandatum Varchar2(20)
, betaalomschrijving Varchar2(750)
, betaalkenmerk Varchar2(90)
, bedrag number(10)
, uitvoering Varchar2(20)
, dossierid number(10)
, moment Varchar2(20)
, runid number(10)
, bankrekening Varchar2(102)
, naamstelling Varchar2(150)
, beheerrekening Varchar2(102)
, beheernaam Varchar2(150)
, bank Varchar2(105)
, incasso Varchar2(250)
, versie number(10)
, betaalwijzeid number(10)
, statusid number(10)
, xml Varchar2(250)
);
CREATE TABLE IF NOT EXISTS adzverantwoording
 (
 jaarverantid number(10)
, dossierid number(10)
, jaar number(10)
, rekeningid number(10)
, januari__kt1 number(10)
, februari__kt1 number(10)
, maart__kt1 number(10)
, april__kt1 number(10)
, mei__kt1 number(10)
, juni__kt1 number(10)
, juli__kt1 number(10)
, augustus__kt1 number(10)
, september__kt1 number(10)
, oktober__kt1 number(10)
, november__kt1 number(10)
, december__kt1 number(10)
, jaartotaal number(10)
);
CREATE TABLE IF NOT EXISTS bankafschrift
 (
 afschriftid number(10)
, administratieid number(10)
, referentie Varchar2(750)
, boekdatum Varchar2(20)
, maandBD number(10)
, afschriftzoom Varchar2(300)
, beginsaldo number(10)
, credit number(10)
, debet number(10)
, eindsaldo number(10)
, aantalposten number(10)
, inleesdogid number(10)
, probleemid number(10)
, methode number(10)
, xxtotal Varchar2(129)
, xxrijnummer float
);
CREATE TABLE IF NOT EXISTS bankkosten
 (
 jaar number(10)
, omschrijving Varchar2(750)
, tarief number(10)
, rubriekid number(10)
, dossierid number(10)
, debiteurennummer Varchar2(150)
, kenmerk Varchar2(150)
, dossier Varchar2(750)
, klant Varchar2(210)
, machtiging Varchar2(20)
, geboekt__imgv9AAA Varchar2(39)
, administratieid number(10)
, machtigingdogid number(10)
, factuurid number(10)
);
CREATE TABLE IF NOT EXISTS callsPerK
 (
 calls number(10)
, kpunt number(10)
);
CREATE TABLE IF NOT EXISTS cmgeldigheidtoeslagen
 (
 administratieid number(10)
, onderwerpid number(10)
, tariefcode Varchar2(150)
, bedrag number(10)
, gebeurtenis number(10)
, aanmaken number(10)
, ingangsdatum Varchar2(20)
, einddatum Varchar2(20)
);
CREATE TABLE IF NOT EXISTS cmhalvetarieven
 (
 tariefid number(10)
, onderwerpid number(10)
, administratieid number(10)
, tariefcode Varchar2(75)
, halvemaand number(10)
, ingangsdatum Varchar2(20)
, einddatum Varchar2(20)
);
CREATE TABLE IF NOT EXISTS cmkosten
 (
 dossierid number(10)
, MaxVand1 Varchar2(20)
, l1 number(10)
);
CREATE TABLE IF NOT EXISTS cmprijslijst
 (
 prijslijstid number(10)
, administratieid number(10)
, dossierid number(10)
, rolid number(10)
, tariefcode Varchar2(150)
, omschrijving Varchar2(765)
, facturatie number(10)
, minuten number(10)
, factor Number(36, 2)
, eenheid Varchar2(60)
, eenheden Varchar2(60)
, tarief number(10)
, perkilometer number(10)
, kilometerrekeningid number(10)
, perbezoek number(10)
, bezoekrekeningid number(10)
, bezoekomschrijving Varchar2(150)
, volgorde number(10)
, btwcode number(10)
, rekeningid number(10)
, periodiciteit number(10)
, eerder number(10)
, geldigvan Varchar2(20)
, geldigtot Varchar2(20)
, dag number(10)
, halvemaand Varchar2(250)
);
CREATE TABLE IF NOT EXISTS cmtarief
 (
 tariefid number(10)
, administratieid number(10)
, onderwerpid number(10)
, tariefcode Varchar2(75)
, tariefomschrijving Varchar2(300)
, ingangsdatum Varchar2(20)
, tarief number(10)
, rekeningid number(10)
, omschrijving Varchar2(330)
, dagvdmaand number(10)
, einddatum Varchar2(20)
, periodiciteit number(10)
, percvermogen Number(54, 8)
, jaarmax number(10)
, betaalwijzeid number(10)
, verantwoordingid number(10)
, vdmaand number(10)
, halvemaand number(10)
, declareren Varchar2(150)
, startreden number(10)
, doorgevoerd Varchar2(250)
, halvemaanddeclaratie Varchar2(250)
, grootboekrekeningid number(10)
, btw number(10)
);
CREATE TABLE IF NOT EXISTS cmtariefwaarden
 (
 tcwid number(10)
, tariefcode Varchar2(75)
, administratieid number(10)
, intake number(10)
, uitvoering number(10)
, beeindiging number(10)
, aangemaakt Varchar2(30)
, contract Varchar2(30)
, beeindigd Varchar2(30)
, afgesloten Varchar2(30)
, verwijderd Varchar2(30)
, nietdoorgegaan Varchar2(30)
);
CREATE TABLE IF NOT EXISTS cmtariefzwaarte
 (
 tzid number(10)
, onderwerpid number(10)
, tariefcode Varchar2(105)
, intake number(10)
, uitvoering number(10)
, beeindiging number(10)
, o_intake number(10)
, o_uitvoering number(10)
, o_beeindiging number(10)
, b_intake number(10)
, b_uitvoering number(10)
, b_beeindiging number(10)
);
CREATE TABLE IF NOT EXISTS cmtoeslag
 (
 toeslagid number(10)
, tariefcode Varchar2(150)
, gebeurtenis number(10)
, aanmaken number(10)
, ingangsdatum Varchar2(20)
, omschrijving text
, einddatum Varchar2(20)
, bedrag number(10)
, administratieid number(10)
, rekeningid number(10)
, onderwerpid number(10)
, bankrekeningid number(10)
);
CREATE TABLE IF NOT EXISTS coBasis
 (
 basisid number(10)
, scenarioid number(10)
, volgnummer number(10)
, kopregel Varchar2(150)
, testcase text
, trefwoorden text
, gebruikerid number(10)
, tekstresultaat Varchar2(450)
, toelichting text
, testen number(10)
, duur Number(36, 3)
, basisduur Number(36, 3)
);
CREATE TABLE IF NOT EXISTS coBasischeck
 (
 basischeckid number(10)
, basisid number(10)
, volgnummer number(10)
, header Varchar2(150)
, checkpunt Varchar2(750)
, doelstelling text
, cid1 number(10)
, cid2 number(10)
, cid3 number(10)
, cid4 number(10)
, cid6 number(10)
, cid7 number(10)
, link1 text
, link4 text
, dossierid number(10)
, toelichting text
, alsgebruiker number(10)
, reset number(10)
, initdoe text
, predoe text
, meetvariabele number(10)
, meetwaarde text
, databasewaarden text
, testresult text
, postdoe text
, basisresultaat text
, testverschil text
, fouten number(10)
);
CREATE TABLE IF NOT EXISTS coFunctie
 (
 functieid number(10)
, kopregel Varchar2(150)
, volgnummer number(10)
, functie Varchar2(300)
, testnivo number(10)
, voorelke text
, aanroep text
, herstelid number(10)
, incidenteel Varchar2(250)
, intest Varchar2(250)
, testvolgnummer number(10)
, tellers text
, toelichting text
, tijd number(10)
, verschillen number(10)
);
CREATE TABLE IF NOT EXISTS coResultaat
 (
 resultaatid number(10)
, tellerid number(10)
, administratieid number(10)
, dossierid number(10)
, gebruikerid number(10)
, extra Varchar2(105)
, startwaarde float
, eindwaarde float
, mutaties text
, door number(10)
, touched Varchar2(250)
);
CREATE TABLE IF NOT EXISTS coScenario
 (
 scenarioid number(10)
, scenario Varchar2(150)
, volgnummer number(10)
, instellingen text
);
CREATE TABLE IF NOT EXISTS coSubteller
 (
 tellerid number(10)
, extra Varchar2(105)
);
CREATE TABLE IF NOT EXISTS coTeller
 (
 tellerid number(10)
, kopregel Varchar2(150)
, teller Varchar2(1500)
, testnivo number(10)
, trefwoord Varchar2(105)
, administratiequery text
, administraties text
, dossierquery text
, dossiers text
, specificatiequery text
, gebruikerquery text
, gebruikers text
, moetnul Varchar2(250)
, intest Varchar2(250)
, toelichting text
, incidenteel Varchar2(250)
);
CREATE TABLE IF NOT EXISTS cobasisresultaat
 (
 bresultaatid number(10)
, tellerid number(10)
, administratieid number(10)
, dossierid number(10)
, gebruikerid number(10)
, extra Varchar2(105)
, basiswaarde number(10)
);
CREATE TABLE IF NOT EXISTS cobasisset
 (
 basissetid number(10)
, volgnummer number(10)
, verklaring Varchar2(150)
, querie text
, doe text
, basisid number(10)
, nietbij text
, initieel number(10)
);
CREATE TABLE IF NOT EXISTS cocalllog
 (
 clogid number(10)
, cocallid number(10)
, datum Varchar2(20)
, door Varchar2(75)
, logmelding text
);
CREATE TABLE IF NOT EXISTS cointegriteit
 (
 integriteitid number(10)
, kopregel Varchar2(105)
, teller1id number(10)
, teller2id number(10)
, toelichting text
);
CREATE TABLE IF NOT EXISTS cointegriteitT1
 (
 resultaatid number(10)
, teller1id number(10)
, teller2id number(10)
, administratieid number(10)
, dossierid number(10)
, gebruikerid number(10)
, eind1 float
, integriteitid number(10)
);
CREATE TABLE IF NOT EXISTS cointegriteitT2
 (
 resultaatid number(10)
, teller1id number(10)
, teller2id number(10)
, administratieid number(10)
, dossierid number(10)
, gebruikerid number(10)
, eind2 float
);
CREATE TABLE IF NOT EXISTS cospecificatie
 (
 specid number(10)
, resultaatid number(10)
, referentie text
, resultaat text
, verschil text
);
CREATE TABLE IF NOT EXISTS cotestverslag
 (
 testverslagid number(10)
, testdatum Varchar2(20)
, testverslag text
, databasenaam Varchar2(300)
, odbc Varchar2(750)
, testplan Varchar2(150)
, nivo number(10)
, dossiers text
);
CREATE TABLE IF NOT EXISTS dmdocument
 (
 docid number(10)
, xdocumentid number(10)
, administratieid number(10)
, dossierid number(10)
, relatieid number(10)
, referentie Varchar2(1500)
, xxxmap Varchar2(750)
, xxxbestand Varchar2(750)
, locatieid number(10)
, koppelid number(10)
, koppeltekst Varchar2(150)
, yyyy Varchar2(12)
, periodevan Varchar2(20)
, periodetot Varchar2(20)
, origineelid number(10)
, door number(10)
, op Varchar2(20)
, ocrtekst text
, paginas number(10)
, bijdocid number(10)
, isvorige number(10)
);
CREATE TABLE IF NOT EXISTS dmkoppel
 (
 docid number(10)
, dmsoortid number(10)
, koppelid number(10)
, actueel number(10)
);
CREATE TABLE IF NOT EXISTS dmocr
 (
 ocrid number(10)
, docid number(10)
, inhoud text
, dossiers number(10)
, rekeningen number(10)
, xdocumenten text
, nietxdocumenten text
, ocrdocids text
);
CREATE TABLE IF NOT EXISTS dmocrtag
 (
 ocrtagid number(10)
, ocrid number(10)
, soorttag number(10)
, tag Varchar2(300)
, start number(10)
, eind number(10)
, vindtag Varchar2(300)
, bronid number(10)
);
CREATE TABLE IF NOT EXISTS dmscanboekenals
 (
 xdocumentid number(10)
, documentnaam Varchar2(225)
, beheerformulier Varchar2(150)
, formulierid number(10)
, vo number(10)
, nieuw Varchar2(1050)
, certificaat Varchar2(75)
, behandelmap Varchar2(1500)
, hoofdmapid number(10)
, submap Varchar2(450)
);
CREATE TABLE IF NOT EXISTS dmxdocument
 (
 xdocumentid number(10)
, documentnaam Varchar2(225)
, scanrubriekid number(10)
, beheerformulier Varchar2(150)
, formulierid number(10)
, tabelid number(10)
, toelichting text
, periodeid number(10)
, trefwoorden text
);
CREATE TABLE IF NOT EXISTS dmxmap
 (
 mapid number(10)
, xdocumentid number(10)
, administratieid number(10)
, certificaat Varchar2(75)
, behandelmap Varchar2(1500)
, hoofdmapid number(10)
, nieuwmap Varchar2(1050)
, onderwerpid number(10)
, submap Varchar2(450)
);
CREATE TABLE IF NOT EXISTS dmxocrdocument
 (
 ocrdocid number(10)
, patroon Varchar2(150)
, xdocumentid number(10)
, heeftrekeningen number(10)
, exitdo Varchar2(250)
, volgnummer number(10)
, xsubid number(10)
);
CREATE TABLE IF NOT EXISTS dmxocrmapping
 (
 ocrmapid number(10)
, xdocumentid number(10)
, ocrdocid number(10)
, volgnummer number(10)
, veld Varchar2(105)
, zoeknaar Varchar2(75)
, patroon Varchar2(750)
, lengteresultaat number(10)
);
CREATE TABLE IF NOT EXISTS doDebiteurdatums
 (
 administratieid number(10)
, blokkade Varchar2(20)
, krijgikalles Varchar2(20)
, aantaldagen number(10)
, exportvanaf Varchar2(20)
);
CREATE TABLE IF NOT EXISTS doEigenMedewerkers
 (
 dossierid number(10)
, gebruikerid number(10)
, referentie Varchar2(750)
, kenmerk Varchar2(150)
, pending Varchar2(150)
);
CREATE TABLE IF NOT EXISTS doFormeel
 (
 dossierid number(10)
, jurstart Varchar2(20)
, jureind Varchar2(20)
, aantal number(10)
);
CREATE TABLE IF NOT EXISTS doOvergedragen
 (
 partij Varchar2(750)
, dossierid number(10)
, d2 Varchar2(20)
, aan Varchar2(795)
);
CREATE TABLE IF NOT EXISTS doWisselingen
 (
 versieid number(10)
, dossierid number(10)
, versie number(10)
, onderwerpid number(10)
, onderwerp Varchar2(150)
, onderwerpkort Varchar2(45)
, administratieid number(10)
, begindatum Varchar2(20)
, einddatum Varchar2(20)
);
CREATE TABLE IF NOT EXISTS doautorisatie
 (
 autorisatieid number(10)
, dossierid number(10)
, gebruikerid number(10)
, autorisatie number(10)
, beveiliging number(10)
, wachtwoord Varchar2(45)
);
CREATE TABLE IF NOT EXISTS dobeeindigen
 (
 dossierid number(10)
, beeindigen number(10)
);
CREATE TABLE IF NOT EXISTS dobetrokken
 (
 rolid number(10)
, dossierid number(10)
, dosid number(10)
, modelid number(10)
, rolmodel Varchar2(150)
, volgnummer number(10)
, naam Varchar2(300)
, relatieid number(10)
, werkzaamid number(10)
, toelichting text
, geldigvan Varchar2(20)
, geldigtot Varchar2(20)
, adresid number(10)
, emailid number(10)
, faxid number(10)
, gebruikerid number(10)
, datum Varchar2(20)
, vandaag Varchar2(250)
);
CREATE TABLE IF NOT EXISTS docontrole
 (
 dossierid number(10)
, krijgikalles Varchar2(20)
, verwerking Varchar2(750)
, formeelbegin Varchar2(20)
, startbetalen Varchar2(20)
, formeeleinde Varchar2(20)
, afgesloten Varchar2(20)
, blokkade Varchar2(20)
, netwerkmap Varchar2(750)
, tekort number(10)
, teweinig number(10)
, openstaand number(10)
);
CREATE TABLE IF NOT EXISTS dodata
 (
 dosid number(10)
, regel number(10)
, dossierid number(10)
, versie number(10)
, p1 number(10)
, p2 number(10)
, p3 number(10)
, t1 Varchar2(750)
, t2 Varchar2(750)
, t3 Varchar2(750)
, t4 Varchar2(750)
, t5 Varchar2(750)
, t6 Varchar2(750)
, t7 Varchar2(750)
, t8 Varchar2(750)
, t9 Varchar2(750)
, m1 text
, m2 text
, m3 text
, m4 text
, m5 text
, l1 number(10)
, l2 number(10)
, l3 number(10)
, l4 number(10)
, l5 number(10)
, L6 number(10)
, l7 number(10)
, l8 number(10)
, l9 number(10)
, d1 Varchar2(20)
, d2 Varchar2(20)
, d7 Varchar2(20)
, d3 Varchar2(20)
, d4 Varchar2(20)
, d5 Varchar2(20)
, d6 Varchar2(20)
, s1 Number(36, 2)
, s2 Number(36, 2)
);
CREATE TABLE IF NOT EXISTS dodata3
 (
 dosid number(10)
, regel number(10)
, dossierid number(10)
, versie number(10)
, p1 number(10)
, p2 number(10)
, p3 number(10)
, t1 Varchar2(750)
, t2 Varchar2(750)
, t3 Varchar2(750)
, t4 Varchar2(750)
, t5 Varchar2(750)
, t6 Varchar2(750)
, t7 Varchar2(750)
, t8 Varchar2(750)
, t9 Varchar2(750)
, m1 text
, m2 text
, m3 text
, m4 text
, m5 text
, l1 number(10)
, l2 number(10)
, l3 number(10)
, l4 number(10)
, l5 number(10)
, L6 number(10)
, l7 number(10)
, l8 number(10)
, l9 number(10)
, d1 Varchar2(20)
, d2 Varchar2(20)
, d7 Varchar2(20)
, d3 Varchar2(20)
, d4 Varchar2(20)
, d5 Varchar2(20)
, d6 Varchar2(20)
, s1 Number(36, 2)
, s2 Number(36, 2)
);
CREATE TABLE IF NOT EXISTS dogeenverantwoordingA
 (
 rekeningid number(10)
, bedrag number(10)
, gridid number(10)
);
CREATE TABLE IF NOT EXISTS dogezinsleden
 (
 dossierid number(10)
, relatieid number(10)
, naam Varchar2(300)
, dosid number(10)
, rolid number(10)
, aard Varchar2(750)
, geslacht Varchar2(750)
, contract Varchar2(750)
);
CREATE TABLE IF NOT EXISTS dogrid
 (
 dogid number(10)
, regel number(10)
, dossierid number(10)
, gridid number(10)
, t1 Varchar2(750)
, t2 Varchar2(750)
, t3 Varchar2(750)
, t4 Varchar2(750)
, t5 Varchar2(750)
, t6 Varchar2(750)
, t7 Varchar2(750)
, t8 Varchar2(750)
, t9 Varchar2(750)
, m1 text
, m2 text
, m3 text
, m4 text
, m5 text
, l1 number(10)
, l2 number(10)
, l3 number(10)
, l4 number(10)
, l5 number(10)
, l6 number(10)
, l7 number(10)
, l8 number(10)
, l9 number(10)
, d1 Varchar2(20)
, d2 Varchar2(20)
, d7 Varchar2(20)
, d3 Varchar2(20)
, d4 Varchar2(20)
, d5 Varchar2(20)
, d6 Varchar2(20)
, s1 Number(36, 2)
, s2 Number(36, 2)
, prevdogid number(10)
, nosepabanknr Varchar2(102)
);
CREATE TABLE IF NOT EXISTS dogrid1
 (
 eenprevdogid number(10)
, dogid number(10)
, regel number(10)
, dossierid number(10)
, gridid number(10)
, eent1 Varchar2(750)
, eent2 Varchar2(750)
, eent3 Varchar2(750)
, eent4 Varchar2(750)
, eent5 Varchar2(750)
, eent6 Varchar2(750)
, eent7 Varchar2(750)
, eent8 Varchar2(750)
, eent9 Varchar2(750)
, eenm1 text
, eenm2 text
, eenm3 text
, eenm4 text
, eenm5 text
, eenl1 number(10)
, eenl2 number(10)
, eenl3 number(10)
, eenl4 number(10)
, eenl5 number(10)
, eenl6 number(10)
, eenl7 number(10)
, eenl8 number(10)
, eenl9 number(10)
, eend1 Varchar2(20)
, eend2 Varchar2(20)
, eend7 Varchar2(20)
, eend3 Varchar2(20)
, eend4 Varchar2(20)
, eend5 Varchar2(20)
, eend6 Varchar2(20)
, eens1 Number(36, 2)
, eens2 Number(36, 2)
);
CREATE TABLE IF NOT EXISTS dogrid2
 (
 tweeprevdogid number(10)
, tweedogid number(10)
, tweedossierid number(10)
, tweegridid number(10)
, tweet1 Varchar2(750)
, tweet2 Varchar2(750)
, tweet3 Varchar2(750)
, tweet4 Varchar2(750)
, tweet5 Varchar2(750)
, twee6 Varchar2(750)
, twee7 Varchar2(750)
, tweet8 Varchar2(750)
, tweet9 Varchar2(750)
, tweem1 text
, tweem2 text
, tweem3 text
, tweem4 text
, tweem5 text
, tweel1 number(10)
, tweel2 number(10)
, tweel3 number(10)
, tweel4 number(10)
, tweel5 number(10)
, tweel6 number(10)
, tweel7 number(10)
, tweel8 number(10)
, tweel9 number(10)
, tweed1 Varchar2(20)
, tweed2 Varchar2(20)
, tweed7 Varchar2(20)
, tweed3 Varchar2(20)
, tweed4 Varchar2(20)
, tweed5 Varchar2(20)
, tweed6 Varchar2(20)
, twee1 Number(36, 2)
, twees2 Number(36, 2)
);
CREATE TABLE IF NOT EXISTS dokengetallen
 (
 wat number(10)
, betreft Varchar2(51)
, id number(10)
, op Varchar2(20)
, maand number(10)
, jaar number(10)
, duur number(10)
, dossierid number(10)
, tijdcodeid number(10)
, aantal number(10)
);
CREATE TABLE IF NOT EXISTS dolink
 (
 linkid number(10)
, vanuitid number(10)
, volgnummer number(10)
, kop Varchar2(150)
, tekst text
, ankerid number(10)
, id number(10)
, extraparameters Varchar2(450)
, toelichting text
, certificaat Varchar2(105)
, einddatum Varchar2(20)
);
CREATE TABLE IF NOT EXISTS domachtigingen
 (
 dogid number(10)
, dossierid number(10)
, prijslijstid number(10)
, omschrijving Varchar2(984)
, xxxvo number(10)
);
CREATE TABLE IF NOT EXISTS donaarbeheer
 (
 dossierid number(10)
, wasow number(10)
, wasgrafisch Varchar2(75)
, onderwerpid number(10)
, tariefcode Varchar2(75)
);
CREATE TABLE IF NOT EXISTS donaarkanton
 (
 dossierid number(10)
, wasow number(10)
, wasgrafisch Varchar2(75)
, onderwerpid number(10)
, tariefcode Varchar2(75)
);
CREATE TABLE IF NOT EXISTS doovergenomen
 (
 overnameid number(10)
, partijdogid number(10)
, bsn Varchar2(45)
, geslacht number(10)
, voorletters Varchar2(150)
, roepnaam Varchar2(150)
, tussenvoegsel Varchar2(75)
, achternaam Varchar2(150)
, meisjesnaam Varchar2(150)
, geboortedatum Varchar2(20)
, geboorteplaats Varchar2(150)
, postcode Varchar2(21)
, huisnummer Varchar2(150)
, telefoonnummer Varchar2(45)
, emailadres Varchar2(300)
, beheerrekening Varchar2(75)
, leefgeldrekening Varchar2(75)
, tariefcode Varchar2(75)
, beheerderid number(10)
, toelichting text
, relatieid number(10)
, hundossierid number(10)
, hunkenmerk Varchar2(150)
, hunreferentie Varchar2(750)
, dossierid number(10)
, administratieid number(10)
, nieuwdossier Varchar2(250)
, hunonderwerpid number(10)
, hunrelatieid number(10)
, eigencontract Varchar2(20)
, budgetplan Varchar2(20)
, startbetalen Varchar2(20)
, hunbeheerder Varchar2(150)
, huntariefcode Varchar2(75)
, op Varchar2(20)
, duur number(10)
, eenl2 number(10)
, eenl3 number(10)
, eenl5 number(10)
, hunbeheerderid number(10)
, hunfaseid number(10)
, zoeknaam Varchar2(210)
);
CREATE TABLE IF NOT EXISTS doovergenomendata
 (
 overgenomendataid number(10)
, gegeven Varchar2(75)
, wasid number(10)
, wasreferentie Varchar2(750)
, wordtid number(10)
, wordtreferentie Varchar2(750)
, partijdogid number(10)
, lng1 number(10)
, lng2 number(10)
, lng3 number(10)
, txt1 Varchar2(300)
, koppelid number(10)
);
CREATE TABLE IF NOT EXISTS doovergenomenregel
 (
 overnameregelid number(10)
, overnametabid number(10)
, regelnummer number(10)
, regelinhoud text
);
CREATE TABLE IF NOT EXISTS doovergenomenrelatie
 (
 overnamerelid number(10)
, hunid number(10)
, referentie Varchar2(1500)
, soort number(10)
, eigenid number(10)
, partijdogid number(10)
, nieuwerelatie number(10)
, kenmerken text
, officielenaam Varchar2(300)
, nodig number(10)
);
CREATE TABLE IF NOT EXISTS doovergenomentabs
 (
 overnametabid number(10)
, overnameid number(10)
, tabblad Varchar2(150)
, inhoud text
, berichtid number(10)
, jaar number(10)
, regels number(10)
);
CREATE TABLE IF NOT EXISTS doovergenomenuser
 (
 ouserid number(10)
, partijdogid number(10)
, hungebruikerid number(10)
, gebruiker Varchar2(150)
, aanmeldnaam Varchar2(750)
, afkorting Varchar2(150)
, geblokkeerd number(10)
, gebruikerid number(10)
);
CREATE TABLE IF NOT EXISTS dopersonen1
 (
 relatieid number(10)
, werkzaamid number(10)
, naam Varchar2(750)
, officielenaam Varchar2(750)
, refnaam Varchar2(750)
, dossierid number(10)
, dogid number(10)
, gezin number(10)
, aard number(10)
, klantid number(10)
, toestandid number(10)
, xyzonderwerpid number(10)
);
CREATE TABLE IF NOT EXISTS dorapportage
 (
 rapportageid number(10)
, dossierid number(10)
, actieid number(10)
, aansturing Varchar2(750)
, titel Varchar2(300)
, rapport text
, getal1 number(10)
, getal2 number(10)
, getal3 number(10)
, getal4 number(10)
, getal5 number(10)
, door number(10)
, op Varchar2(20)
, berichtid number(10)
);
CREATE TABLE IF NOT EXISTS dorechtenALL
 (
 dossierid number(10)
, faseid number(10)
, gebruikerid number(10)
);
CREATE TABLE IF NOT EXISTS dossier
 (
 dossierid number(10)
, referentie Varchar2(750)
, kenmerk Varchar2(150)
, hunkenmerk Varchar2(150)
, onderwerpid number(10)
, pakket__kl1 Varchar2(75)
, faseid number(10)
, toestandID number(10)
, versie number(10)
, trefwoorden Varchar2(750)
, gewijzigdop Varchar2(20)
, administratieid number(10)
, gebied1id number(10)
, beheerderid number(10)
, beheerder2id number(10)
, beheerder__kh1 Varchar2(105)
, ondersteuningid number(10)
, ondersteuning__kl1 Varchar2(45)
, klantid number(10)
, groep__kl1 Varchar2(150)
, foto Varchar2(750)
);
CREATE TABLE IF NOT EXISTS dossierIndexed
 (
 dossierid number(10)
, referentie Varchar2(750)
, kenmerk Varchar2(150)
, kenref Varchar2(906)
, signaalbeheerder Varchar2(250)
, hunkenmerk Varchar2(150)
, onderwerpid number(10)
, onderwerp Varchar2(150)
, onderwerpkort Varchar2(45)
, pakket__kl1 Varchar2(75)
, faseid number(10)
, fase Varchar2(105)
, actueledossiers Varchar2(250)
, alledossiers Varchar2(250)
, statusparent number(10)
, voorblad Varchar2(150)
, betalen Varchar2(250)
, toestandid number(10)
, toestand Varchar2(225)
, productieversie number(10)
, administratieid number(10)
, gebied1id number(10)
, versieid number(10)
, versie number(10)
, versiedatum Varchar2(20)
, trefwoorden Varchar2(750)
, buttonids Varchar2(750)
, foto Varchar2(750)
, gewijzigdop Varchar2(20)
, modellayout Varchar2(3)
, grafisch Varchar2(75)
, beheerder__kh1 Varchar2(105)
, ondersteuning__kl1 Varchar2(45)
, klantid number(10)
, beheerderid number(10)
, beheerder2id number(10)
, ondersteuningid number(10)
, groep__kl1 Varchar2(150)
);
CREATE TABLE IF NOT EXISTS dossierduur
 (
 t Varchar2(24)
, id number(10)
, op Varchar2(20)
, duur number(10)
, dossierid number(10)
);
CREATE TABLE IF NOT EXISTS dossiergrid
 (
 eenprevdogid number(10)
, dogid number(10)
, regel number(10)
, dossierid number(10)
, gridid number(10)
, eent1 Varchar2(750)
, eent2 Varchar2(750)
, eent3 Varchar2(750)
, eent4 Varchar2(750)
, eent5 Varchar2(750)
, eent6 Varchar2(750)
, eent7 Varchar2(750)
, eent8 Varchar2(750)
, eent9 Varchar2(750)
, eenm1 text
, eenm2 text
, eenm3 text
, eenm4 text
, eenm5 text
, eenl1 number(10)
, eenl2 number(10)
, eenl3 number(10)
, eenl4 number(10)
, eenl5 number(10)
, eenl6 number(10)
, eenl7 number(10)
, eenl8 number(10)
, eenl9 number(10)
, eend1 Varchar2(20)
, eend2 Varchar2(20)
, eend7 Varchar2(20)
, eend3 Varchar2(20)
, eend4 Varchar2(20)
, eend5 Varchar2(20)
, eend6 Varchar2(20)
, eens1 Number(36, 2)
, eens2 Number(36, 2)
, tweeprevdogid number(10)
, tweedogid number(10)
, tweedossierid number(10)
, tweegridid number(10)
, tweet1 Varchar2(750)
, tweet2 Varchar2(750)
, tweet3 Varchar2(750)
, tweet4 Varchar2(750)
, tweet5 Varchar2(750)
, twee6 Varchar2(750)
, twee7 Varchar2(750)
, tweet8 Varchar2(750)
, tweet9 Varchar2(750)
, tweem1 text
, tweem2 text
, tweem3 text
, tweem4 text
, tweem5 text
, tweel1 number(10)
, tweel2 number(10)
, tweel3 number(10)
, tweel4 number(10)
, tweel5 number(10)
, tweel6 number(10)
, tweel7 number(10)
, tweel8 number(10)
, tweel9 number(10)
, tweed1 Varchar2(20)
, tweed2 Varchar2(20)
, tweed7 Varchar2(20)
, tweed3 Varchar2(20)
, tweed4 Varchar2(20)
, tweed5 Varchar2(20)
, tweed6 Varchar2(20)
, twee1 Number(36, 2)
, twees2 Number(36, 2)
);
CREATE TABLE IF NOT EXISTS dossierregel
 (
 dossierid number(10)
, alfabet Varchar2(3)
, referentie Varchar2(750)
, kenmerk Varchar2(150)
, kenref Varchar2(906)
, signaalbeheerder Varchar2(250)
, hunkenmerk Varchar2(150)
, onderwerpid number(10)
, onderwerp Varchar2(150)
, onderwerpkort Varchar2(45)
, pakket__kl1 Varchar2(75)
, faseid number(10)
, fase Varchar2(105)
, actueledossiers Varchar2(250)
, alledossiers Varchar2(250)
, statusparent number(10)
, voorblad Varchar2(150)
, toestandid number(10)
, toestand Varchar2(225)
, productieversie number(10)
, administratieid number(10)
, gebied1id number(10)
, versieid number(10)
, versie number(10)
, versiedatum Varchar2(20)
, trefwoorden Varchar2(750)
, buttonids Varchar2(750)
, foto Varchar2(750)
, gewijzigdop Varchar2(20)
, modellayout Varchar2(3)
, grafisch Varchar2(75)
, klantid number(10)
);
CREATE TABLE IF NOT EXISTS dosubdossiersA
 (
 id number(10)
, rootdossierid number(10)
);
CREATE TABLE IF NOT EXISTS dosubdossiersB
 (
 id number(10)
, rootdossierid number(10)
);
CREATE TABLE IF NOT EXISTS dosubdossiersC
 (
 id number(10)
, rootdossierid number(10)
);
CREATE TABLE IF NOT EXISTS dotarief
 (
 tariefid number(10)
, dossierid number(10)
, ingangsdatum Varchar2(20)
, reden number(10)
, detailid number(10)
, tarief Varchar2(75)
, toelichting text
, eerste Varchar2(250)
, huidige Varchar2(250)
, op Varchar2(20)
, door number(10)
, gridid number(10)
, wastarief Varchar2(75)
, stopt Varchar2(20)
, half Varchar2(250)
, machtiging Varchar2(250)
, toestemming Varchar2(250)
, exitmachtiging Varchar2(250)
, exittoestemming Varchar2(250)
, halftarief number(10)
, machtigingtarief number(10)
, toestemmingtarief number(10)
, exitmachtigingtarief number(10)
, exittoestemmingtarief number(10)
, exithalf Varchar2(250)
, exithalftarief number(10)
, dhalf Varchar2(250)
, dhalftarief number(10)
, dexithalf Varchar2(250)
, dexithalftarief number(10)
, declaratietarief Varchar2(105)
, aanmaakdatum Varchar2(20)
);
CREATE TABLE IF NOT EXISTS doversie
 (
 versieid number(10)
, versie number(10)
, versiedatum Varchar2(20)
, dossierid number(10)
, toelichting text
, einddatum Varchar2(20)
, onderwerpid number(10)
, administratieid number(10)
);
CREATE TABLE IF NOT EXISTS dowilnaar
 (
 dossierid number(10)
, wasow number(10)
, wasgrafisch Varchar2(75)
, onderwerpid number(10)
, tariefcode Varchar2(75)
);
CREATE TABLE IF NOT EXISTS dozaansluiting
 (
 statusid number(10)
, dossierid number(10)
, datum Varchar2(20)
, onderwerpid number(10)
, administratieid number(10)
, actueel number(10)
, formele_kubus number(10)
, formele_statistiek number(10)
, tarief_statistiek number(10)
, juridisch number(10)
, uitvoering number(10)
, tarieven number(10)
, injurstat number(10)
, intariefstat number(10)
);
CREATE TABLE IF NOT EXISTS doznummer
 (
 vindnummerid number(10)
, dossierid number(10)
, relatieid number(10)
, kenmerk Varchar2(750)
, nummer Varchar2(750)
, zoeknummer Varchar2(750)
, bronid number(10)
, vindsoortid number(10)
, certificaten Varchar2(300)
, ocrprioriteit number(10)
);
CREATE TABLE IF NOT EXISTS dozstatistiek
 (
 statistiekid number(10)
, administratieid number(10)
, maandvanaf2000 number(10)
, jaar number(10)
, maand number(10)
, onderwerpid number(10)
, beginstand number(10)
, minus number(10)
, delta number(10)
, plus number(10)
, eindstand number(10)
, sluitnietaan Varchar2(250)
, tariefcode Varchar2(105)
);
CREATE TABLE IF NOT EXISTS gebestand
 (
 gebestandid number(10)
, bestandsnaam Varchar2(1050)
, toelichting Varchar2(750)
, tabelid number(10)
, keyid number(10)
, alias Varchar2(300)
);
CREATE TABLE IF NOT EXISTS gecall
 (
 callid Varchar2(108)
, betreftids Varchar2(45)
, betreft text
, omschrijving text
, databasenaam Varchar2(105)
, calldatum Varchar2(20)
, gebruikerid number(10)
, callinfo text
, lastlogid Varchar2(108)
, afgehandeld Varchar2(20)
, bijgewerkt Varchar2(20)
, zworkid number(10)
, behandelid number(10)
, callonderwerpid number(10)
, helpdeskprioriteit number(10)
, melder Varchar2(150)
, toworkcallid number(10)
, trefwoord Varchar2(150)
);
CREATE TABLE IF NOT EXISTS gecalllog
 (
 calllogid Varchar2(108)
, callid Varchar2(108)
, datum Varchar2(20)
, statusid number(10)
, actietoelichting text
, voortgang text
, bijlage text
, syncd Varchar2(250)
, actie Varchar2(150)
, actiebij number(10)
, actiedoor Varchar2(150)
, door number(10)
, doorafkorting Varchar2(45)
);
CREATE TABLE IF NOT EXISTS gecallonderwerpen
 (
 id number(10)
, onderwerp Varchar2(150)
);
CREATE TABLE IF NOT EXISTS gecallscreen
 (
 callscreenid Varchar2(108)
, callid Varchar2(108)
, volgnummer number(10)
, titel Varchar2(300)
, hdcode Varchar2(300)
, cid1 number(10)
, cid3 number(10)
, cid6 number(10)
, beheerformulier Varchar2(150)
, html text
, info text
, databasenaam Varchar2(300)
, toworkcallscreenid number(10)
, addendum text
, betreft Varchar2(75)
, bij2work Varchar2(250)
);
CREATE TABLE IF NOT EXISTS geetiket
 (
 eeid number(10)
, toelichting Varchar2(150)
, maxkol number(10)
, maxrow number(10)
, topmargin number(10)
, leftmargin number(10)
, widthcel number(10)
, widthright number(10)
, heighttop number(10)
, heightcel number(10)
, heightbottom number(10)
, stylesheet Varchar2(150)
, bodyclass Varchar2(150)
, aanwijzing text
);
CREATE TABLE IF NOT EXISTS gelook
 (
 lookid number(10)
, dossierid number(10)
, email Varchar2(750)
, vanaf Varchar2(20)
, totmet Varchar2(20)
, tabbladen Varchar2(75)
, rekeningen number(10)
, scans number(10)
, rapportages number(10)
, oormerken number(10)
, toelichting text
, tosync Varchar2(75)
, verwijderen number(10)
, meekijkdossierid number(10)
);
CREATE TABLE IF NOT EXISTS gelooker
 (
 lookerid number(10)
, emailadres Varchar2(750)
, wachtwoord Varchar2(36)
, parentlookerid number(10)
, syncd number(10)
, pincode Varchar2(36)
, managementmail Varchar2(750)
, meekijkerid number(10)
, tabbladen Varchar2(45)
, zichtbaar number(10)
, presentatie number(10)
, betalen number(10)
, verantwoording number(10)
, contract Varchar2(1050)
, administratieid number(10)
, maxbedrag number(10)
, lastlogin Varchar2(20)
, pogingen number(10)
);
CREATE TABLE IF NOT EXISTS gelookertarief
 (
 ltid number(10)
, lookerid number(10)
, tariefcode Varchar2(150)
);
CREATE TABLE IF NOT EXISTS gelooksub
 (
 looksubid number(10)
, lookid Varchar2(108)
, betreft number(10)
, id number(10)
, referentie Varchar2(300)
, stuur1 number(10)
, stuur2 number(10)
, stuur3 number(10)
, tosyncsub Varchar2(250)
, syncmemo Varchar2(450)
, meekijktabid number(10)
);
CREATE TABLE IF NOT EXISTS gepincodes
 (
 parentlookerid number(10)
, pincodes number(10)
);
CREATE TABLE IF NOT EXISTS geprimkeys
 (
 sleutel Varchar2(150)
, laatste number(10)
, tabel Varchar2(45)
, gewijzigdop Varchar2(20)
);
CREATE TABLE IF NOT EXISTS gequePrint
 (
 gequePrintID number(10)
, inhoud text
, statusid number(10)
, pc Varchar2(375)
, gebruiker number(10)
, papier Varchar2(150)
, blad1 Varchar2(750)
, ladeblad1 number(10)
, vervolg Varchar2(150)
, ladevervolg number(10)
, pZwartWit number(10)
, plandschap number(10)
, pduplex number(10)
, naarklembord number(10)
, geenkantlijnen number(10)
);
CREATE TABLE IF NOT EXISTS gequeue
 (
 queueid number(10)
, moment Varchar2(20)
, gebruikerid number(10)
, uittevoeren Varchar2(750)
, aanroep text
, voortgang Varchar2(750)
, voortgang2 text
, op Varchar2(20)
, duur number(10)
, eenheden number(10)
, keren number(10)
, opeen number(10)
, omgeving Varchar2(300)
, eigenaar number(10)
, opserver number(10)
);
CREATE TABLE IF NOT EXISTS geregel
 (
 rid number(10)
, regelid number(10)
, tabelid number(10)
, inhoud Varchar2(225)
, specificatie text
, volgnummer number(10)
, L1 number(10)
, L2 number(10)
, L3 number(10)
, T1 Varchar2(300)
, T2 Varchar2(300)
);
CREATE TABLE IF NOT EXISTS gescan
 (
 scanid number(10)
, dossierid number(10)
, relatieid number(10)
, document Varchar2(750)
, soort Varchar2(150)
, pagina number(10)
, scandocid number(10)
, toelichting text
, papier Varchar2(3)
, op Varchar2(20)
, tolookblob number(10)
, datum Varchar2(20)
, xdocumentid number(10)
, id number(10)
);
CREATE TABLE IF NOT EXISTS getabel
 (
 tabelid number(10)
, tabel Varchar2(150)
, toelichting text
);
CREATE TABLE IF NOT EXISTS gexcallstatus
 (
 callstatusid number(10)
, isstatus Varchar2(105)
, isbij number(10)
, actie Varchar2(75)
, wordtstatus Varchar2(105)
, komtbij number(10)
);
CREATE TABLE IF NOT EXISTS gexscaninmail
 (
 mailscanid number(10)
, emailadresvan Varchar2(300)
, emailadresaan Varchar2(300)
, bijlagen number(10)
, onderwerpbevat Varchar2(150)
, inhoudbevat Varchar2(150)
, bijlage1 Varchar2(150)
, bijlage2 Varchar2(150)
, afhandeling1 number(10)
, afhandeling2 number(10)
, automatisch Varchar2(250)
);
CREATE TABLE IF NOT EXISTS iladministratie
 (
 administratieid number(10)
, administratie Varchar2(45)
, relatieid number(10)
, correspondentie number(10)
, stijl Varchar2(15)
, vlagl1 number(10)
, vlagl2 number(10)
, vlagl3 Varchar2(250)
, vlagl4 number(10)
, vlagl5 number(10)
, vlagl6 number(10)
, vlagl7 number(10)
, vlagl8 number(10)
, vlagl9 number(10)
, vlagm1 text
, vlagm2 text
, vlagm3 text
, vlagm4 text
, vlagm5 text
, vlagm6 text
, vlagm7 text
, vlagm8 text
, vlagm9 text
);
CREATE TABLE IF NOT EXISTS ilcertificaat
 (
 certificaatid number(10)
, gebruikerid number(10)
, certificaat Varchar2(105)
, coordinator Varchar2(250)
, toelichting text
);
CREATE TABLE IF NOT EXISTS ilelkeadministratie
 (
 administratieid number(10)
, administratie Varchar2(45)
);
CREATE TABLE IF NOT EXISTS ilfase
 (
 ifid number(10)
, gebruikerid number(10)
, faseid number(10)
, autorisatie number(10)
);
CREATE TABLE IF NOT EXISTS ilgebied
 (
 usergebiedid number(10)
, gebruikerid number(10)
, gebiedid number(10)
);
CREATE TABLE IF NOT EXISTS ilgebruiker
 (
 gebruikerid number(10)
, gebruiker Varchar2(150)
, relatieid number(10)
, werkzaamid number(10)
, aanmeldnaam Varchar2(150)
, wachtwoord Varchar2(30)
, afkorting Varchar2(45)
, briefafkorting Varchar2(30)
, administratieid number(10)
, gebied1id number(10)
, geblokkeerd number(10)
, toegang number(10)
, rechtstreeks Varchar2(250)
, urenperdag number(10)
, startdag number(10)
, actieuitvoeren Varchar2(60)
, bijnietid number(10)
, datummasker number(10)
, browser Varchar2(150)
, layoutfilter Varchar2(3)
, fotos number(10)
, files number(10)
, handtekening Varchar2(750)
, paraaf Varchar2(750)
, inopdracht text
, spreekuur text
, bereikbaar text
, tekenendoor number(10)
, postbusid number(10)
, capaciteit number(10)
, toestel Varchar2(45)
, telefoonmemo text
, nietstoren Varchar2(250)
, taken Varchar2(250)
, bewaken Varchar2(250)
, agenda Varchar2(105)
, agendacertificaat Varchar2(105)
, pending Varchar2(150)
, subonderschrift text
, eigeninvoeralsnieuw Varchar2(250)
, groepid number(10)
, newsseen Varchar2(20)
, nieuwgelezen Varchar2(250)
, seeing Varchar2(150)
, signalen Varchar2(250)
);
CREATE TABLE IF NOT EXISTS ilgebruikers
 (
 gebruikerid number(10)
, gebruiker Varchar2(150)
, referentie Varchar2(600)
);
CREATE TABLE IF NOT EXISTS ilgebruikersWR
 (
 gebruikerid number(10)
, gebruiker Varchar2(150)
, vo number(10)
);
CREATE TABLE IF NOT EXISTS ilgebruiksrecht
 (
 uaid number(10)
, gebruikerid number(10)
, administratieid number(10)
);
CREATE TABLE IF NOT EXISTS ilgroepen
 (
 groepid number(10)
, groepnaam Varchar2(150)
, groep Varchar2(45)
, administratieid number(10)
);
CREATE TABLE IF NOT EXISTS ilmail
 (
 mailid number(10)
, gebruikerid number(10)
, emailid number(10)
, standaard Varchar2(250)
, onderschrift text
, voorkeuremail Varchar2(250)
, voorkeurbericht Varchar2(250)
, metvriendelijkegroet Varchar2(250)
, bereikbaarheid Varchar2(250)
, volgnummer number(10)
, geselecteerd number(10)
, mailaccountid number(10)
, smtpid number(10)
);
CREATE TABLE IF NOT EXISTS ilmailaccount
 (
 mailaccountid number(10)
, account Varchar2(150)
, mailserver Varchar2(765)
, poort number(10)
, wachtwoord Varchar2(765)
, removedelay number(10)
);
CREATE TABLE IF NOT EXISTS ilopmaak
 (
 stijlid number(10)
, stijl Varchar2(15)
, beschrijving text
, mail text
, brief text
, rapport text
, factuur text
, aansturing text
, euroteken Varchar2(150)
, huisstijl text
, voorbeeld text
, briefkenmerk Varchar2(300)
, correspondentieadres number(10)
, dossierkenmerk Varchar2(150)
, kwitantie text
, briefmail text
, creditnota text
, instellingen Varchar2(75)
, bewindbrieven Varchar2(150)
, onskantoor Varchar2(150)
, handtekening text
);
CREATE TABLE IF NOT EXISTS ilprotocoller
 (
 gebruikerid number(10)
, gebruiker Varchar2(150)
, protocolnbspdoor__kt1 Varchar2(150)
);
CREATE TABLE IF NOT EXISTS ilsamenwerking
 (
 samenwerkingid number(10)
, gebruikerid number(10)
, metgebruikerid number(10)
);
CREATE TABLE IF NOT EXISTS ilsignaal
 (
 signaalid number(10)
, gebruikerid number(10)
, volgnummer number(10)
, sqlquery text
, signaaltekst text
);
CREATE TABLE IF NOT EXISTS ilsmtp
 (
 smtpid number(10)
, smtpserver Varchar2(765)
, smtppoort number(10)
, smtpaccount Varchar2(150)
, smtpwachtwoord Varchar2(765)
, domein Varchar2(300)
, adressering number(10)
, smtpautorisatie number(10)
);
CREATE TABLE IF NOT EXISTS ilxrol
 (
 rolid Varchar2(3)
, rol Varchar2(75)
);
CREATE TABLE IF NOT EXISTS imafspraak
 (
 imafspraakid number(10)
, groepid number(10)
, afspraak Varchar2(750)
);
CREATE TABLE IF NOT EXISTS imbudgetpost
 (
 imbudgetpostid number(10)
, budgetkolom number(10)
, kopregel Varchar2(150)
, volgnummer number(10)
, budgetpost Varchar2(300)
, matrixid Varchar2(15)
, rekeningid number(10)
, verplicht Varchar2(250)
);
CREATE TABLE IF NOT EXISTS imbudgetpostniet
 (
 imnietid number(10)
, imoptieid number(10)
, imbudgetpostid number(10)
);
CREATE TABLE IF NOT EXISTS imdoelstelling
 (
 imdoelid number(10)
, volgnummer number(10)
, doelstelling Varchar2(300)
);
CREATE TABLE IF NOT EXISTS iminformatiepakket
 (
 informatiepakketid number(10)
, informatiepakket Varchar2(150)
);
CREATE TABLE IF NOT EXISTS imomstandigheid
 (
 omstandigheidid number(10)
, budgetkolom number(10)
, groep Varchar2(150)
, vraag Varchar2(225)
, volgnummer number(10)
, standaardwaarde number(10)
, nahef Varchar2(300)
);
CREATE TABLE IF NOT EXISTS imomstandigoptie
 (
 imoptieid number(10)
, omstandigheidid number(10)
, optie Varchar2(75)
, waarde number(10)
, volgnummer number(10)
);
CREATE TABLE IF NOT EXISTS imvolledig
 (
 volledigid number(10)
, imoptieid number(10)
, als number(10)
, faqid number(10)
, dan text
);
CREATE TABLE IF NOT EXISTS imxafspraakstatus
 (
 imafspraakstatusid number(10)
, afspraakstatus Varchar2(150)
, volgnummer number(10)
, klaar Varchar2(250)
);
CREATE TABLE IF NOT EXISTS inDossierInregelingen
 (
 dossierid number(10)
, taakid number(10)
, aanmaakwijzeid number(10)
, id number(10)
);
CREATE TABLE IF NOT EXISTS inaanhef
 (
 aanhefid number(10)
, aanhef Varchar2(150)
, slotzin Varchar2(300)
);
CREATE TABLE IF NOT EXISTS inafspraaksoort
 (
 soortid number(10)
, soortafspraak Varchar2(150)
, dossier number(10)
, onderwerpen Varchar2(150)
, magverwijderen number(10)
, moetlocatie number(10)
, uitnodigingid number(10)
, aansturing text
, middel1 number(10)
, middel2 number(10)
, middel3 number(10)
, kantooragenda Varchar2(250)
, cursus number(10)
);
CREATE TABLE IF NOT EXISTS inafwijkend
 (
 afwijkendid number(10)
, volgorde number(10)
, afwijking Varchar2(750)
, runsqlserver text
, inhoud text
, id number(10)
, veldid number(10)
, tabelid number(10)
);
CREATE TABLE IF NOT EXISTS inapart
 (
 apartid number(10)
, onderwerpid number(10)
, naam Varchar2(150)
, layoutid number(10)
, aansturing text
);
CREATE TABLE IF NOT EXISTS inbasisinstelling
 (
 biid number(10)
, groep Varchar2(150)
, basisinstelling Varchar2(150)
, waarde Varchar2(250)
, toelichting text
, volgnummer number(10)
, doorgevoerd Varchar2(250)
, bron text
);
CREATE TABLE IF NOT EXISTS inbasisinstellingsql
 (
 bi2id number(10)
, biid number(10)
, waarde Varchar2(250)
, volgnummer number(10)
, toelichting text
, runsqlserver text
, doe text
);
CREATE TABLE IF NOT EXISTS inbeheerdersprobleem
 (
 probleemid number(10)
, groep Varchar2(150)
, volgnummer number(10)
, probleem text
, analysesql text
, titel Varchar2(300)
, subtitelsql text
, detailsql text
, aansturing Varchar2(150)
, beheerformulier Varchar2(150)
, datum Varchar2(20)
, beheerknop Varchar2(300)
, openop Varchar2(150)
, resultaat number(10)
, toelichting text
, link1 text
, link2 text
, link3 text
, link4 text
);
CREATE TABLE IF NOT EXISTS inbericht
 (
 berichtid number(10)
, hoofdstuk number(10)
, bericht Varchar2(300)
, subtitel Varchar2(450)
, berichtkort Varchar2(45)
, onderwerp text
, inuit number(10)
, groep Varchar2(150)
, volgnummer number(10)
, tabnummer number(10)
, kenmerk Varchar2(150)
, toelichting text
, beschrijving text
, afhandeling Varchar2(450)
, eerder number(10)
, voorbeeld text
, stuurinformatie text
, tekenwijze number(10)
, certificaat Varchar2(105)
, isklantrapportage Varchar2(250)
, eigen Varchar2(250)
);
CREATE TABLE IF NOT EXISTS inberichtdocument
 (
 documentid number(10)
, berichtid number(10)
, berichtwijzeid number(10)
, onderwerpid number(10)
, variant Varchar2(3)
, bijlage number(10)
, label Varchar2(300)
, plaats Varchar2(300)
, datum Varchar2(150)
, onskenmerk Varchar2(300)
, hunkenmerk Varchar2(300)
, onderwerp text
, aanhef Varchar2(300)
, eigendocument text
, document text
, slotzin Varchar2(750)
, afzender text
, papierbrief Varchar2(6)
, papierfax Varchar2(6)
, op Varchar2(20)
, door number(10)
);
CREATE TABLE IF NOT EXISTS inberichtmodel
 (
 modelid number(10)
, berichtid number(10)
, volgnummer number(10)
, soort number(10)
, onderwerpid number(10)
, blok Varchar2(150)
, naam Varchar2(150)
, parentid number(10)
, rubriekid number(10)
, veldid number(10)
, standaardwaardesqlserver text
, proef Varchar2(75)
, masker text
, bronsqlserver text
, toelichting text
, componentid number(10)
);
CREATE TABLE IF NOT EXISTS inberichtwijze
 (
 berichtwijzeid number(10)
, berichtwijze Varchar2(150)
, soort number(10)
);
CREATE TABLE IF NOT EXISTS inchecklist
 (
 inchecklistid number(10)
, taakid number(10)
, procedureid number(10)
, volgnummer number(10)
, koptekst Varchar2(150)
, punt text
, instructie text
, onderwerpen Varchar2(750)
, aansturing text
, wusformulierid number(10)
);
CREATE TABLE IF NOT EXISTS incode
 (
 codeid number(10)
, codenaam Varchar2(450)
, jaar number(10)
, laatste number(10)
, codeformaat Varchar2(150)
, administratieid number(10)
);
CREATE TABLE IF NOT EXISTS incube
 (
 cubeid number(10)
, cube Varchar2(150)
, rijbron text
, kolombron text
, celbron text
, basisaccess text
, basissqlserver text
, parameters Varchar2(750)
, defaults Varchar2(150)
, startfilter text
);
CREATE TABLE IF NOT EXISTS index_column_info
 (
 object_name Varchar2(384)
, index_name Varchar2(384)
, column Varchar2(384)
, column_usage Varchar2(24)
);
CREATE TABLE IF NOT EXISTS inevent
 (
 eventid number(10)
, titel Varchar2(150)
, soort number(10)
, procedure2work text
);
CREATE TABLE IF NOT EXISTS infase
 (
 faseid number(10)
, fase Varchar2(105)
, onderwerpid number(10)
, nieuw number(10)
, nieuwcertificaat Varchar2(105)
, toestand Varchar2(45)
, zichtbaar Varchar2(30)
, buttonids Varchar2(750)
, modellayout Varchar2(3)
, toelichting text
, grafisch Varchar2(75)
, actueledossiers Varchar2(250)
, alledossiers Varchar2(250)
, statusparent number(10)
, voorblad Varchar2(150)
, signaalbeheerder Varchar2(250)
, betalen Varchar2(250)
);
CREATE TABLE IF NOT EXISTS infasering
 (
 infaseringid number(10)
, faseid number(10)
, naarid number(10)
, wijze number(10)
);
CREATE TABLE IF NOT EXISTS ingebied
 (
 gebiedid number(10)
, gebied Varchar2(75)
, volgnummer number(10)
, toelichting text
);
CREATE TABLE IF NOT EXISTS inhandboek
 (
 handboekid number(10)
, handboekhfdid number(10)
, volgnummer number(10)
, gebeurtenis text
, groep Varchar2(150)
, wiewanneer text
, hoe text
, vervolg text
, opmerkingen text
, helpid number(10)
, trefwoorden text
);
CREATE TABLE IF NOT EXISTS inhandboekhfd
 (
 handboekhfdid number(10)
, deel Varchar2(300)
, hoofdstuk Varchar2(750)
, volgnummer Varchar2(150)
, fasering text
, tabnummer number(10)
, eigen Varchar2(250)
);
CREATE TABLE IF NOT EXISTS inhandeling
 (
 handelingid number(10)
, handeling Varchar2(300)
, certificaat Varchar2(105)
);
CREATE TABLE IF NOT EXISTS inmapstructuur
 (
 mapid number(10)
, betreft number(10)
, naam Varchar2(150)
, onderwerpid number(10)
, rootmapid number(10)
);
CREATE TABLE IF NOT EXISTS inmelding
 (
 meldingid number(10)
, optie number(10)
, button Varchar2(30)
, melding Varchar2(150)
, meldingen Varchar2(150)
, sqlid number(10)
, volgnummer number(10)
, subtabblad number(10)
, tabblad number(10)
, schermoptie number(10)
);
CREATE TABLE IF NOT EXISTS inmodel
 (
 modelid number(10)
, parentmodelid number(10)
, modelgroepid number(10)
, soort number(10)
, volgnummer number(10)
, layout Varchar2(30)
, stamgegevens Varchar2(75)
, blok Varchar2(150)
, naam Varchar2(150)
, rubriekid number(10)
, veldid number(10)
, regel number(10)
, standaardwaardesqlserver text
, proef Varchar2(75)
, masker text
, certificaat Varchar2(105)
, brontabelid number(10)
, bronsqlserver text
, toelichting text
, eventid number(10)
, systeem number(10)
, gewijzigd Varchar2(20)
, componentid number(10)
, sleutelveld number(10)
, filterveld number(10)
, filterconditie Varchar2(750)
);
CREATE TABLE IF NOT EXISTS inmodelgroep
 (
 modelgroepid number(10)
, modelgroep Varchar2(150)
);
CREATE TABLE IF NOT EXISTS inmodelidperonderwerpid
 (
 onderwerpid number(10)
, modelid number(10)
);
CREATE TABLE IF NOT EXISTS inmodelonderwerp
 (
 modelonderwerpid number(10)
, onderwerpid number(10)
, modelgroepid number(10)
);
CREATE TABLE IF NOT EXISTS inonderwerp
 (
 onderwerpid number(10)
, onderwerp Varchar2(150)
, onderwerpen Varchar2(150)
, onderwerpkort Varchar2(45)
, groep Varchar2(75)
, kenmerk Varchar2(150)
, button Varchar2(75)
, nieuwtekst Varchar2(75)
, toelichting text
, eerder text
, gewijzigd Varchar2(20)
, pagina number(10)
, client Varchar2(250)
);
CREATE TABLE IF NOT EXISTS inpapier
 (
 papierid number(10)
, Papier Varchar2(3)
, stijl Varchar2(15)
, omschrijving text
, opmaakpapier Varchar2(60)
, logo text
, links number(10)
, boven number(10)
, rechts number(10)
, onder number(10)
, eerstefooter text
, zwartwit number(10)
, landschap number(10)
, dubbelzijdig number(10)
, achterzijdetop text
, achterzijdefooter text
, opmaakvervolg Varchar2(60)
, logovervolg text
, linksvervolg number(10)
, bovenvervolg number(10)
, rechtsvervolg number(10)
, ondervervolg number(10)
, vervolgtop text
, vervolgfooter text
, sizetofit number(10)
);
CREATE TABLE IF NOT EXISTS inprocedure
 (
 procedureid number(10)
, groep Varchar2(150)
, procedurenaam Varchar2(150)
, start number(10)
, id number(10)
, id2 number(10)
, id3 number(10)
, ookalsactie Varchar2(250)
, toelichting text
, foutafhandeling number(10)
, herstelprocedure text
, gewijzigd Varchar2(20)
, bijnietversturen text
, nawelversturen text
, certificaat Varchar2(105)
, protocoldoor number(10)
, protocolaansturing text
, eigen Varchar2(250)
);
CREATE TABLE IF NOT EXISTS inproceduremodel
 (
 varid number(10)
, procedureid number(10)
, soort number(10)
, volgnummer number(10)
, layer Varchar2(150)
, blok Varchar2(150)
, label Varchar2(150)
, rubriekid number(10)
, standaardwaarde Varchar2(750)
, berichtwaarde Varchar2(750)
, proef Varchar2(150)
, masker Varchar2(150)
, bronsqlserver text
, opmaak Varchar2(150)
, toelichting text
, regel number(10)
, veldid number(10)
, eventid number(10)
);
CREATE TABLE IF NOT EXISTS inprocedures
 (
 procedureid number(10)
, groep Varchar2(150)
, procedurenaam Varchar2(150)
, start number(10)
, id number(10)
, id2 number(10)
, id3 number(10)
, ookalsactie Varchar2(250)
, toelichting text
, foutafhandeling number(10)
, herstelprocedure text
, gewijzigd Varchar2(20)
, bijnietversturen text
, nawelversturen text
, gebruikerid number(10)
);
CREATE TABLE IF NOT EXISTS inprocedurestap
 (
 procstapid number(10)
, naam Varchar2(150)
, procedureid number(10)
, soortid number(10)
, volgnummer number(10)
, ingangen Varchar2(150)
, uitgangen Varchar2(150)
, links number(10)
, boven number(10)
, toelichting text
, l1 number(10)
, l2 number(10)
, l3 number(10)
, l4 number(10)
, l5 number(10)
, t1 Varchar2(750)
, t2 Varchar2(750)
, t3 Varchar2(150)
, t4 Varchar2(150)
, t5 Varchar2(150)
, t6 Varchar2(150)
, m1 text
, m2 text
, m3 text
);
CREATE TABLE IF NOT EXISTS inscandocument
 (
 scandocid number(10)
, document Varchar2(150)
, onderwerpid number(10)
, persoonlijk number(10)
);
CREATE TABLE IF NOT EXISTS insetting
 (
 settingid number(10)
, cid number(10)
, waarde text
, eigen Varchar2(250)
);
CREATE TABLE IF NOT EXISTS intaak
 (
 taakid number(10)
, taak Varchar2(750)
, taakkort Varchar2(600)
, taakrelatieid number(10)
, groep Varchar2(150)
, alsactie Varchar2(250)
, alstaak Varchar2(250)
, aarddossier number(10)
, statusmodel Varchar2(150)
, startstatusid number(10)
, periode number(10)
, tabblad number(10)
, certificaat Varchar2(105)
, onderwerpid number(10)
, rekeningid number(10)
, toelichting text
, verzendbericht1 number(10)
, aansturing1sqlserver text
, verzendbericht2 number(10)
, aansturing2sqlserver text
, verzendbericht3 number(10)
, aansturing3sqlserver text
, verzendbericht4 number(10)
, aansturing4sqlserver text
, verzendbericht5 number(10)
, aansturing5sqlserver text
, gereedaantal number(10)
, gereedeenheid number(10)
, gereedperiode number(10)
, aantaleerder number(10)
, eenheideerder number(10)
, voertuit number(10)
, protocol Varchar2(250)
, alsalgemenetaak number(10)
, eigen Varchar2(250)
);
CREATE TABLE IF NOT EXISTS intaakbladen
 (
 taakbladid number(10)
, taakid number(10)
, volgnummer number(10)
, status Varchar2(150)
, toelichting text
, alssql text
, tekst Varchar2(150)
, pagina text
, rapportage Varchar2(250)
);
CREATE TABLE IF NOT EXISTS intaakinregeling
 (
 taakregelingid number(10)
, intaakid number(10)
, onderwerpid number(10)
, tariefcode Varchar2(105)
, ingangsdatum Varchar2(20)
, einddatum Varchar2(20)
, aanmaakwijze number(10)
, label Varchar2(105)
, volgnummer number(10)
, nietals Varchar2(150)
);
CREATE TABLE IF NOT EXISTS intaakstatus
 (
 cid number(10)
, comboid Varchar2(150)
, inhoud Varchar2(225)
, specificatie text
, volgnummer number(10)
, klaar number(10)
, briefverzenden number(10)
, toelichting text
, saverapportage Varchar2(250)
, kleur Varchar2(21)
);
CREATE TABLE IF NOT EXISTS intermijn
 (
 termijnid number(10)
, melding Varchar2(300)
, meldingen Varchar2(300)
, query text
, taken Varchar2(300)
, statusid number(10)
, als number(10)
, aantal number(10)
, certificaat Varchar2(105)
, bewaakt number(10)
, qbesql text
, qbeaansturing Varchar2(750)
, qbezoek Varchar2(3000)
, beheerform Varchar2(150)
, laatstekeer Varchar2(20)
);
CREATE TABLE IF NOT EXISTS inverzamel
 (
 verzamelid number(10)
, groep Varchar2(150)
, document Varchar2(300)
, scandocid number(10)
, individueel number(10)
, inberichtid number(10)
, controlesqlserver text
, controletekst text
, geldigtot Varchar2(250)
, soort number(10)
, eigen Varchar2(250)
, subpunt text
);
CREATE TABLE IF NOT EXISTS inverzamelfase
 (
 verzamelfaseid number(10)
, verzamelid number(10)
, faseid number(10)
, verplicht Varchar2(250)
, nietintakebrief Varchar2(250)
, nodigaanvraag Varchar2(250)
);
CREATE TABLE IF NOT EXISTS inxinkomend
 (
 inkomendid number(10)
, bericht Varchar2(150)
, groep Varchar2(150)
, volgnummer number(10)
, actieid number(10)
, gridid number(10)
, notitieid number(10)
, taakid number(10)
, dossierid number(10)
, schermid number(10)
);
CREATE TABLE IF NOT EXISTS inxprocsoort
 (
 soortid number(10)
, soort Varchar2(150)
, parameters text
, kleurnummer number(10)
);
CREATE TABLE IF NOT EXISTS inxreactie
 (
 reactieid number(10)
, betreft number(10)
, id number(10)
, antwoordop text
, alsantwoord text
, afhandeling text
);
CREATE TABLE IF NOT EXISTS iscontent
 (
 contentid number(10)
, content Varchar2(150)
, groep Varchar2(105)
, volgnummer number(10)
, onderwerpid number(10)
, faseid number(10)
, weergave number(10)
, titelsqlsqlserver text
, supertitel Varchar2(300)
, titel Varchar2(300)
, subtitel Varchar2(300)
, foto Varchar2(150)
, paramsqlsqlserver text
, toelichting text
, test Varchar2(750)
, extraparameter Varchar2(750)
, gewijzigd Varchar2(20)
, papier Varchar2(3)
);
CREATE TABLE IF NOT EXISTS iscontentband
 (
 bandid number(10)
, bandnaam Varchar2(150)
, contentid number(10)
, frame number(10)
, aanroep Varchar2(30)
, volgnummer number(10)
, bijprinten Varchar2(250)
, bronsqlserver text
, voor text
, elke text
, erna text
, anders text
, toelichting text
, weergave number(10)
, gewijzigd Varchar2(20)
);
CREATE TABLE IF NOT EXISTS iscontentstring
 (
 stringid number(10)
, nummer number(10)
, qstring Varchar2(75)
, soort number(10)
, contentid number(10)
, standaardwaarde Varchar2(75)
, rubriekid number(10)
, masker Varchar2(75)
, toelichting text
, bronsqlserver text
);
CREATE TABLE IF NOT EXISTS isdocumentatie
 (
 docid number(10)
, datum Varchar2(20)
, aanleiding Varchar2(75)
, door number(10)
, SVP text
, prioriteit number(10)
, rubriek number(10)
, trefwoorden text
, documentatie text
, klaar Varchar2(20)
, klaardoor number(10)
, besproken Varchar2(20)
, getest Varchar2(20)
, getestdoor number(10)
, gedocumenteerd number(10)
, xxbeloofd Varchar2(250)
, xxprioriteit Varchar2(250)
);
CREATE TABLE IF NOT EXISTS isform
 (
 formid number(10)
, naam Varchar2(150)
, bron text
, supertitel Varchar2(150)
, titel Varchar2(150)
, subtitel Varchar2(150)
, locktekst Varchar2(75)
, breedtes Varchar2(450)
, toelichting text
, synchroniseer Varchar2(150)
);
CREATE TABLE IF NOT EXISTS isformelement
 (
 elementid number(10)
, formid number(10)
, regel number(10)
, volgnummer number(10)
, label Varchar2(150)
, veldid number(10)
, cel Varchar2(450)
, extra Varchar2(150)
, nawijzigen text
);
CREATE TABLE IF NOT EXISTS ishelp
 (
 helpid number(10)
, naam text
, groep Varchar2(150)
, parentid Varchar2(150)
, volgnummer number(10)
, pagina text
, zieook Varchar2(150)
, trefwoorden text
, gewijzigd Varchar2(20)
, door number(10)
, controleren Varchar2(9)
, alleen2Work Varchar2(250)
, veelgesteld Varchar2(150)
);
CREATE TABLE IF NOT EXISTS islayout
 (
 layoutid number(10)
, groepid number(10)
, parentid number(10)
, volgnummer number(10)
, tekst Varchar2(150)
, content text
, specificatie text
, sqlsqlserver text
, layoutfilter Varchar2(75)
, certificaat Varchar2(105)
, fasegrafisch Varchar2(30)
, gewijzigd Varchar2(20)
, help text
, contentDN text
, specificatieDN text
, sqlsqlserverDN text
, gewijzigdDN Varchar2(20)
);
CREATE TABLE IF NOT EXISTS islijsten
 (
 lijstid number(10)
, lijstnaam Varchar2(150)
, lijstgroepid number(10)
, toelichting__kl1 text
, query text
, aansturing text
, selectie Varchar2(30)
, binnendossier number(10)
, eigen Varchar2(250)
, onderwerpid number(10)
, cid3 number(10)
);
CREATE TABLE IF NOT EXISTS islijstgroep
 (
 lijstgroepid number(10)
, lijstgroep Varchar2(150)
, volgorde number(10)
);
CREATE TABLE IF NOT EXISTS islijstrecht
 (
 lijstrechtid number(10)
, lijstid number(10)
, certificaat Varchar2(105)
);
CREATE TABLE IF NOT EXISTS isoverzicht
 (
 overzichtid number(10)
, soort number(10)
, velden text
, zoek text
);
CREATE TABLE IF NOT EXISTS isreleasenote
 (
 rnid number(10)
, versie number(10)
, soort number(10)
, notitie text
, beheerder Varchar2(250)
, vetgedrukt Varchar2(250)
, rodeachtergrond Varchar2(250)
, hdcodes Varchar2(150)
, databases Varchar2(750)
, oplossing Varchar2(150)
, groep number(10)
, calls Varchar2(600)
, correctie text
, doe text
, vb text
, fixversie Varchar2(30)
, infixmdb number(10)
, in2workmde number(10)
, inpatch number(10)
, door number(10)
, basis text
, oorzaak text
, nietopgelost number(10)
);
CREATE TABLE IF NOT EXISTS isselectie
 (
 selectieid number(10)
, selectie Varchar2(150)
, toelichting text
);
CREATE TABLE IF NOT EXISTS isselectieregel
 (
 selectieregelid number(10)
, selectieid number(10)
, tekst Varchar2(150)
, volgorde number(10)
, layout Varchar2(150)
, query text
, masker Varchar2(150)
, rubriekid number(10)
, header text
, headersql text
, bronsql text
, verplicht Varchar2(250)
);
CREATE TABLE IF NOT EXISTS issql
 (
 sqlid number(10)
, volgnummer number(10)
, supertitel Varchar2(300)
, titel Varchar2(300)
, subtitel text
, foto Varchar2(150)
, sqlserver text
, titelsqlserver text
, zoek text
, test Varchar2(750)
, gewijzigd Varchar2(20)
, titelsqlserverDN text
, gewijzigdDN Varchar2(20)
);
CREATE TABLE IF NOT EXISTS isxml
 (
 xmlid number(10)
, groepid number(10)
, referentie Varchar2(150)
, importstructuurid number(10)
, documenttag text
, aansturing Varchar2(150)
, veldenpatroon Varchar2(300)
, toelichting text
, verslag text
, verslagsql text
, documentatie text
);
CREATE TABLE IF NOT EXISTS isxml2db
 (
 xmldbid number(10)
, xmlid number(10)
, soort number(10)
, beschrijving text
, volgnummer number(10)
, voorelke text
, doe text
, sleutel1 number(10)
, sleutel2 number(10)
, sleutel3 number(10)
);
CREATE TABLE IF NOT EXISTS isxsd
 (
 xsdid number(10)
, xmlid number(10)
, parentxsdid number(10)
, volgnummer number(10)
, tag Varchar2(300)
, attribuut Varchar2(75)
, pad text
);
CREATE TABLE IF NOT EXISTS isxsdmapping
 (
 xsdmapid number(10)
, xmlid number(10)
, xsdid number(10)
, pad text
, tagging Varchar2(3)
, nieuw Varchar2(250)
, nivo number(10)
, regel number(10)
, mapping Varchar2(75)
, bewerking text
, toelichting text
);
CREATE TABLE IF NOT EXISTS licentiestatistics
 (
 datum Varchar2(20)
, dossierid number(10)
, referentie Varchar2(750)
, aantal number(10)
, erbij999 number(10)
, eraf999 number(10)
, erbij675 number(10)
, eraf675 number(10)
, erbijXXL number(10)
, erafXXL number(10)
, erbij800 number(10)
, eraf800 number(10)
, erbijrest number(10)
, erafrest number(10)
);
CREATE TABLE IF NOT EXISTS md_archieflog (
  moment varchar(25) ,
  userinfo varchar(100),
  typeinfo varchar(100),
  payload varchar(1500)
 );
CREATE TABLE IF NOT EXISTS me_betrokken
(
   rolid        decimal(10),
   dossierid    decimal(10),
   dosid        decimal(10),
   modelid      decimal(10),
   rolmodel     text,
   volgnummer   decimal(10),
   naam         text,
   relatieid    decimal(10),
   werkzaamid   decimal(10),
   toelichting  text,
   geldigvan    varchar(20),
   geldigtot    varchar(20),
   adresid      decimal(10),
   emailid      decimal(10),
   faxid        decimal(10),
   gebruikerid  decimal(10),
   datum        varchar(20),
   vandaag        varchar(250)  --waar komt deze klom vandaan???
);
CREATE TABLE IF NOT EXISTS me_prognose
 (
   prognoseid               int             NOT NULL,
   verplichtingid           int,
   schuldid                 int,
   dossierid                int,
   eigenaarid               int,
   datum                    text,
   overmaken                text,
   plandatum                text,
   bedrag                   decimal(10,2),
   statusid                 int,
   oormerk                  varchar(50),
   betaalrunid              int,
   foutcode                 int,
   verklaring               text,
   factuurid                int,
   betaalkenmerk            varchar(30),
   betaalwijzeid            int,
   prioriteit               int,
   tegenrekening            int,
   betaalbaar               int,
   verwerken                int,
   uitvoering__kl1          text,
   betaaldnaarrek           varchar(35),
   pgbid                    int,
   op                       text,
   door                     int,
   btw                      int,
   basisbedrag              decimal(10,2),
   regel                    int,
   eigenstatusid            int,
   dogid                    int,
   wasstatus1               int,
   wasstatus2               int,
   betaalomschrijving__kt1  varchar(200),
   toelichting              text,
   terattentievan           text,
   adres                    text,
   klantreferentie          decimal(10),
   klantnummer              text,
   relatieid                decimal(10),
   naam                     text,
   verpl_bedrag             decimal(10,2),
   maandbedrag              decimal(10,2),
   bankrekening             text,
   naamstelling             text
 );
CREATE TABLE IF NOT EXISTS mgbudgetpost
 (
 mgbudgetpostid number(10)
, dossierid number(10)
, imbudgetpostid number(10)
, iswaarde number(10)
, streefwaarde number(10)
, toelichting text
, statusid number(10)
);
CREATE TABLE IF NOT EXISTS mgcommunicatie
 (
 mgcommunicatieid number(10)
, dossierid number(10)
, vanaf Varchar2(20)
, wijze number(10)
, frequentie number(10)
, laatste Varchar2(20)
, totenmet Varchar2(20)
, toelichting text
, volgende Varchar2(20)
, administratieid number(10)
, adresid number(10)
, emailid number(10)
, faxid number(10)
, informatie text
, informatieid number(10)
, naam Varchar2(600)
, oormerken number(10)
, pincode Varchar2(18)
, rapportages number(10)
, rekeningen number(10)
, relatieid number(10)
, scans number(10)
, tabbladen Varchar2(75)
, tosync number(10)
, vandaag Varchar2(250)
, wachtwoord Varchar2(75)
, werkzaamid number(10)
);
CREATE TABLE IF NOT EXISTS mgdoelstelling
 (
 mgdoelstellingid number(10)
, dossierid number(10)
, geldigvanaf Varchar2(20)
, doelstelling text
, geldigtm Varchar2(20)
, op Varchar2(20)
, door number(10)
);
CREATE TABLE IF NOT EXISTS mginventarisatie
 (
 mginventarisatieid number(10)
, dossierid number(10)
, omstandigheidid number(10)
, waarde number(10)
, op Varchar2(20)
, door number(10)
, actueel Varchar2(250)
, toelichting text
);
CREATE TABLE IF NOT EXISTS mglook
 (
 mglookid number(10)
, mgcommunicatieid number(10)
, betreft number(10)
, referentie Varchar2(300)
, id number(10)
, stuur1 number(10)
, stuur2 number(10)
, stuur3 number(10)
, tosyncsub Varchar2(250)
, syncmemo Varchar2(450)
);
CREATE TABLE IF NOT EXISTS mglooker
 (
 lookerid number(10)
, relatieid number(10)
, vanlookerid number(10)
, aanmeldnaam Varchar2(300)
, wachtwoord Varchar2(45)
, administratieid number(10)
, syncd number(10)
, emailid number(10)
, tabbladen Varchar2(45)
, zichtbaar number(10)
, presentatie number(10)
, betalen number(10)
, verantwoording number(10)
, maxbedrag number(10)
, zichtbaarprive number(10)
, presentatieprive number(10)
, laatste Varchar2(20)
);
CREATE TABLE IF NOT EXISTS mglookertarief
 (
 mgltid number(10)
, tariefcode Varchar2(150)
, lookerid number(10)
);
CREATE TABLE IF NOT EXISTS mgvolledig
 (
 mgvolledigid number(10)
, dossierid number(10)
, volledigid number(10)
, op Varchar2(20)
);
CREATE TABLE IF NOT EXISTS mgwerkafspraak
 (
 werkafspraakid number(10)
, groepid number(10)
, werkafspraak text
, dossierid number(10)
, gemaaktop Varchar2(20)
, einddatum Varchar2(20)
, laatstewerkstatusid number(10)
, op Varchar2(20)
, door number(10)
, vandaag Varchar2(250)
);
CREATE TABLE IF NOT EXISTS ow600BesteedOormerk
 (
 oormerk Varchar2(150)
, bedrag number(10)
);
CREATE TABLE IF NOT EXISTS ow600Bewindvoerders
 (
 dossierid number(10)
, naam Varchar2(300)
, relatieid number(10)
, referentie Varchar2(600)
, werkzaamid number(10)
, officielenaam Varchar2(600)
, faseid number(10)
, toestandid number(10)
, signaalbeheerder Varchar2(250)
);
CREATE TABLE IF NOT EXISTS ow600inkomsteuitgave
 (
 MatrixID Varchar2(9)
, Matrix Varchar2(150)
, rekening Varchar2(300)
, bedrag number(10)
, Groep number(10)
, dossierid number(10)
);
CREATE TABLE IF NOT EXISTS ow695refref
 (
 dossierid number(10)
, dossier_ Varchar2(750)
, relatieid number(10)
, naam Varchar2(300)
);
CREATE TABLE IF NOT EXISTS ow696intake
 (
 dossierid number(10)
, afspraakid number(10)
, toestandid number(10)
, intakegesprek Varchar2(20)
, kenmerk Varchar2(150)
, berichtid number(10)
);
CREATE TABLE IF NOT EXISTS ow696sub
 (
 dossierid number(10)
, dosid number(10)
, MaxVanberichtid number(10)
, INberichtid number(10)
, schuldid number(10)
, verplichtingid number(10)
, relatieid number(10)
);
CREATE TABLE IF NOT EXISTS ow696zitting
 (
 dossierid number(10)
, zittingnbspop__kt1 Varchar2(20)
);
CREATE TABLE IF NOT EXISTS ow710laatsteA
 (
 dossierid number(10)
, op Varchar2(20)
);
CREATE TABLE IF NOT EXISTS ow969beheerrek
 (
 dossierid number(10)
, Beheerrek_aangevraagd Varchar2(20)
, datumtijd Varchar2(20)
, berichtid number(10)
);
CREATE TABLE IF NOT EXISTS ow969gestuurdINEINDE
 (
 dossierid number(10)
, aangeschreven number(10)
);
CREATE TABLE IF NOT EXISTS ow969lopendeBeheersvergoeding
 (
 dossierid number(10)
, laatstekeer Varchar2(20)
, AantalVanverplichtingid number(10)
);
CREATE TABLE IF NOT EXISTS ow969lopendeperiodieken
 (
 dossierid number(10)
, laatstekeer Varchar2(20)
, AantalVanverplichtingid number(10)
);
CREATE TABLE IF NOT EXISTS ow969nogbetalen
 (
 betalen number(10)
, dossierid number(10)
, grafisch Varchar2(75)
);
CREATE TABLE IF NOT EXISTS rapportagekantonALLsub
 (
 dossierid number(10)
, l1 number(10)
, maxdogid number(10)
);
CREATE TABLE IF NOT EXISTS rladres
 (
 adresid number(10)
, relatieid number(10)
, dossierid number(10)
, rolid number(10)
, locatie Varchar2(450)
, aanduiding text
, straat Varchar2(150)
, huisnummer Varchar2(75)
, postcode Varchar2(75)
, plaats Varchar2(150)
, label text
, landid number(10)
, postadres Varchar2(250)
, bezoekadres Varchar2(250)
, opmerking Varchar2(750)
, geldigvan Varchar2(20)
, geldigtot Varchar2(20)
, moment Varchar2(20)
, instellingid number(10)
, nietdubbel Varchar2(250)
);
CREATE TABLE IF NOT EXISTS rladresgemeente
 (
 adresid number(10)
, plaats Varchar2(150)
, gemeente Varchar2(150)
, cbsgemeente number(10)
);
CREATE TABLE IF NOT EXISTS rlafdeling
 (
 relatieid number(10)
, categorieid number(10)
, organisatieid number(10)
, aanafdelingid number(10)
);
CREATE TABLE IF NOT EXISTS rlatie
 (
 relatieid number(10)
, zoeknaam Varchar2(210)
, officielenaam Varchar2(600)
, referentie Varchar2(600)
, aard number(10)
, status number(10)
, trefwoorden Varchar2(750)
, moment Varchar2(20)
, bezoekadresid number(10)
, postadresid number(10)
, telefoonid number(10)
, mobielid number(10)
, faxid number(10)
, emailid number(10)
, webpagina text
, foto Varchar2(750)
);
CREATE TABLE IF NOT EXISTS rlatierubriek
 (
 rubriekid number(10)
, rubriek Varchar2(225)
);
CREATE TABLE IF NOT EXISTS rlcertificaat
 (
 ncid number(10)
, nummerid number(10)
, werkzaamid number(10)
, adresid number(10)
, certificaat Varchar2(105)
);
CREATE TABLE IF NOT EXISTS rleigenrekeningen
 (
 categorieid number(10)
, nummer Varchar2(300)
);
CREATE TABLE IF NOT EXISTS rlfavoriet
 (
 favorietid number(10)
, gebruikerid number(10)
, relatieid number(10)
);
CREATE TABLE IF NOT EXISTS rlfavorieten
 (
 relatieid number(10)
, zoeknaam Varchar2(210)
, aard number(10)
, plaats Varchar2(150)
, officielenaam Varchar2(600)
, referentie Varchar2(600)
, gebruikerid number(10)
);
CREATE TABLE IF NOT EXISTS rlinformatie
 (
 rlinformatieid number(10)
, relatieid number(10)
, informatie text
);
CREATE TABLE IF NOT EXISTS rlnaamlabel
 (
 relatieid number(10)
, naamlabel Varchar2(4000)
, postadresid number(10)
);
CREATE TABLE IF NOT EXISTS rlnummer
 (
 nummerid number(10)
, relatieid number(10)
, werkzaamid number(10)
, rolid number(10)
, categorieid number(10)
, kenmerk Varchar2(300)
, nummer Varchar2(300)
, naamstelling Varchar2(300)
, bijrelatieid number(10)
, opmerking Varchar2(750)
, geldigvan Varchar2(20)
, geldigtot Varchar2(20)
, moment Varchar2(20)
, nosepabanknum Varchar2(102)
);
CREATE TABLE IF NOT EXISTS rlnummersAllA
 (
 relatieid number(10)
, relid number(10)
, wzid number(10)
, nummerid number(10)
, direct number(10)
, stars Varchar2(6)
);
CREATE TABLE IF NOT EXISTS rlnummersV
 (
 nummerid number(10)
, categorieid number(10)
, geldigvan Varchar2(20)
, geldigtot Varchar2(20)
, nummer Varchar2(300)
, kenmerk Varchar2(300)
);
CREATE TABLE IF NOT EXISTS rlorganisatie
 (
 relatieid number(10)
, brancheid number(10)
, rechtsvormid number(10)
, grootteid number(10)
, subnaam Varchar2(450)
, directie number(10)
);
CREATE TABLE IF NOT EXISTS rlpersoon
 (
 relatieid number(10)
, titelatuurid number(10)
, titelsvoor Varchar2(75)
, voorletters Varchar2(45)
, voornamen Varchar2(150)
, tussenvoegsels Varchar2(45)
, voornaam Varchar2(75)
, achternaam Varchar2(150)
, meisjesnaam Varchar2(150)
, titelsna Varchar2(75)
, huishoudid number(10)
);
CREATE TABLE IF NOT EXISTS rlpgbnummers
 (
 nummerid number(10)
, relatieid number(10)
);
CREATE TABLE IF NOT EXISTS rlrekeningenNIETBETALEN
 (
 id number(10)
, nummer Varchar2(750)
, naamstelling Varchar2(750)
, soort number(10)
, nosepanr Varchar2(102)
);
CREATE TABLE IF NOT EXISTS rlrelatiebron
 (
 rbriekid number(10)
, rbriek Varchar2(405)
);
CREATE TABLE IF NOT EXISTS rlverwijzers
 (
 dossierid number(10)
, relatieid number(10)
, verwijzer Varchar2(600)
);
CREATE TABLE IF NOT EXISTS rlwerkzaam
 (
 werkzaamid number(10)
, organisatieid number(10)
, medewerkerid number(10)
, afdelingid number(10)
, groepid number(10)
, functie Varchar2(450)
, opmerking Varchar2(750)
, geldigvan Varchar2(20)
, geldigtot Varchar2(20)
, moment Varchar2(20)
, bezoekadresid number(10)
, postadresid number(10)
, telefoonid number(10)
, mobielid number(10)
, faxid number(10)
, emailid number(10)
, userid number(10)
);
CREATE TABLE IF NOT EXISTS rlxafdeling
 (
 categorieid number(10)
, categorie Varchar2(105)
, bijaard number(10)
, soort number(10)
);
CREATE TABLE IF NOT EXISTS rlxafstand
 (
 afstandid number(10)
, van Varchar2(150)
, vanpc Varchar2(45)
, vanhuisnr Varchar2(30)
, naar Varchar2(150)
, naarpc Varchar2(45)
, naarhuisnr Varchar2(30)
, enkelereis number(10)
);
CREATE TABLE IF NOT EXISTS rlxgemeente
 (
 cbsgemeente number(10)
, gemeente Varchar2(150)
, provid number(10)
, kantonid number(10)
, svb number(10)
, belasting number(10)
, uwv number(10)
);
CREATE TABLE IF NOT EXISTS rlxgrootte
 (
 grootteid number(10)
, grootte Varchar2(105)
);
CREATE TABLE IF NOT EXISTS rlxkanton
 (
 kantonid number(10)
, kanton Varchar2(150)
, rechtbank Varchar2(150)
, relatieid number(10)
, klanttekenen number(10)
, boedelbeschrijving number(10)
, rekenverantwoording number(10)
, geldigtot Varchar2(20)
);
CREATE TABLE IF NOT EXISTS rlxland
 (
 landid number(10)
, landcode Varchar2(9)
, land Varchar2(150)
, telefoniekeuze number(10)
, adreslayout number(10)
, synoniemen text
, postcodemask Varchar2(45)
);
CREATE TABLE IF NOT EXISTS rlxnummer
 (
 categorieid number(10)
, categorie Varchar2(75)
, volgnummer number(10)
, groepid number(10)
, rubriekid number(10)
, invoermasker Varchar2(150)
, proef Varchar2(75)
, organisatie Varchar2(250)
, persoon Varchar2(250)
, huishouden Varchar2(250)
, afdeling Varchar2(250)
, werkzaam Varchar2(250)
, minstens number(10)
, extraregel number(10)
, bijrelatie number(10)
);
CREATE TABLE IF NOT EXISTS rlxplaatsNL
 (
 plaatsid number(10)
, landid number(10)
, plaats Varchar2(75)
, kengetal Varchar2(12)
, provid number(10)
, cbsgemeente number(10)
, synoniemen text
);
CREATE TABLE IF NOT EXISTS rlxpostcodenl
 (
 pcid number(10)
, even number(10)
, hnrvanaf number(10)
, hnrtotmet number(10)
, plaatsid number(10)
, postcode Varchar2(30)
, straat Varchar2(135)
, gewijzigdop Varchar2(20)
, vervallen Varchar2(20)
);
CREATE TABLE IF NOT EXISTS rlxprovincienl
 (
 provid number(10)
, provincie Varchar2(75)
);
CREATE TABLE IF NOT EXISTS rlxrechtsvorm
 (
 rechtsvormid number(10)
, rechtsvormkort Varchar2(45)
, rechtsvormlang Varchar2(150)
);
CREATE TABLE IF NOT EXISTS rlxrubriek
 (
 rubriekid number(10)
, rubriek Varchar2(75)
, rubriekomschrijving Varchar2(375)
, trefwoorden text
, groep Varchar2(105)
);
CREATE TABLE IF NOT EXISTS rlxtitelatuur
 (
 titelatuurid number(10)
, titelatuur Varchar2(150)
, status Varchar2(750)
, geslacht number(10)
, aanhef Varchar2(150)
);
CREATE TABLE IF NOT EXISTS rlxwerkzaam
 (
 categorieid number(10)
, categorie Varchar2(105)
);
CREATE TABLE IF NOT EXISTS tkaap
 (
 aapid number(10)
, aap text
, groep number(10)
, voor number(10)
, vanaf Varchar2(20)
, prioriteit number(10)
, klaar Varchar2(20)
, lastchatid number(10)
, toelichting text
, deadline Varchar2(20)
, dossierid number(10)
, berichtid number(10)
, actieid number(10)
);
CREATE TABLE IF NOT EXISTS tkactie
 (
 actieid number(10)
, actiesoortid number(10)
, stapid number(10)
, procstapid number(10)
, procid number(10)
, actiestatus number(10)
, lastlogid number(10)
, onderwerpid number(10)
, dossierid number(10)
, actie text
, start Varchar2(20)
, streefeind Varchar2(20)
, bijnietid number(10)
, pagina Varchar2(150)
, navberichtid number(10)
, navafspraakid number(10)
, fout number(10)
, actiekort Varchar2(420)
, telaatdatum Varchar2(20)
, streefeindformat Varchar2(60)
, streefeindsort Varchar2(36)
, status__kl1 Varchar2(150)
, periodevan Varchar2(20)
, periodetot Varchar2(20)
, taakid number(10)
, klantid number(10)
, plangroepid number(10)
, prioriteit number(10)
, beloofd number(10)
, termijnalarm number(10)
, dogid number(10)
, navactieid number(10)
, duur number(10)
, inzet number(10)
, naacties Varchar2(450)
, instructie number(10)
, kansid number(10)
, digitaal Varchar2(105)
);
CREATE TABLE IF NOT EXISTS tkactiegeduurd
 (
 actieid number(10)
, geduurd number(10)
);
CREATE TABLE IF NOT EXISTS tkactielog
 (
 actielogid number(10)
, actieid number(10)
, logmeldingid number(10)
, toelichting text
, door number(10)
, op Varchar2(20)
, duur number(10)
, tijdcodeid number(10)
, berichtid number(10)
, factuurid number(10)
, bevestiging Varchar2(20)
, emailadres Varchar2(450)
, factuurrolid number(10)
);
CREATE TABLE IF NOT EXISTS tkafspraak
 (
 afspraakid number(10)
, startdatum Varchar2(20)
, starttijd Varchar2(20)
, einddatum Varchar2(20)
, eindtijd Varchar2(20)
, duur number(10)
, afspraak text
, locatie Varchar2(765)
, onderwerpid number(10)
, soortafspraak Varchar2(150)
, soortafspraakid number(10)
, berichtid number(10)
, toestandid number(10)
, gewijzigd Varchar2(20)
, tijdcodeid number(10)
, tijdcodeduur number(10)
, tijdcodekm number(10)
, verslag text
, factuurid number(10)
, algemeen Varchar2(250)
, middel1 number(10)
, middel2 number(10)
, middel3 number(10)
, factuurrolid number(10)
);
CREATE TABLE IF NOT EXISTS tkagenda
 (
 agendaid number(10)
, afspraakid number(10)
, volgnummer number(10)
, actieid number(10)
, dossierid number(10)
);
CREATE TABLE IF NOT EXISTS tkagendadagen
 (
 dag number(10)
, maand Varchar2(96)
, gebruikerid number(10)
);
CREATE TABLE IF NOT EXISTS tkagendadossier
 (
 afspraakid number(10)
, dossier Varchar2(750)
);
CREATE TABLE IF NOT EXISTS tkagendaregels
 (
 afspraakid number(10)
, relatieid number(10)
, werkzaamid number(10)
, gebruikerid number(10)
, startdatum Varchar2(20)
, starttijd Varchar2(20)
, einddatum Varchar2(20)
, eindtijd Varchar2(20)
, afspraak text
, soortafspraak Varchar2(150)
, locatie Varchar2(765)
, toestandid number(10)
, onderwerpid number(10)
, Kleur Varchar2(18)
, volgnummer number(10)
, referentie Varchar2(750)
);
CREATE TABLE IF NOT EXISTS tkapenvoortgang
 (
 aapid number(10)
, doen number(10)
, gedaan number(10)
);
CREATE TABLE IF NOT EXISTS tkattachment
 (
 attachmentid number(10)
, berichtid number(10)
, volgnummer number(10)
, contenttype Varchar2(750)
, id number(10)
, naam Varchar2(750)
, contentid Varchar2(750)
, encoding Varchar2(75)
, attachment Varchar2(250)
);
CREATE TABLE IF NOT EXISTS tkautoresponse
 (
 autorid number(10)
, mailadres Varchar2(150)
, vanaf Varchar2(20)
, totmet Varchar2(20)
, onderwerp Varchar2(750)
, autorespons text
, deletemail number(10)
, vrijedag Varchar2(250)
);
CREATE TABLE IF NOT EXISTS tkbericht
 (
 berichtid number(10)
, kenmerk Varchar2(150)
, hunkenmerk Varchar2(150)
, datumtijd Varchar2(20)
, inuit number(10)
, inberichtid number(10)
, berichtwijzeid number(10)
, onderwerp Varchar2(750)
, kopievan number(10)
, reactieop number(10)
, toestand number(10)
, door number(10)
, op Varchar2(20)
, attachments Varchar2(6)
, messageid Varchar2(1050)
, stijl Varchar2(15)
, stuurinfo text
, archiefdatabase Varchar2(3)
, leesbevestiging Varchar2(250)
, afzender__kt1 text
, aan__kt1 text
, klaardoor number(10)
, klaarop Varchar2(20)
);
CREATE TABLE IF NOT EXISTS tkberichtcontent
 (
 berichtid number(10)
, invoer Varchar2(250)
, inhoud Varchar2(250)
);
CREATE TABLE IF NOT EXISTS tkberichtdata
 (
 berichtdataid number(10)
, berichtid number(10)
, dossierid number(10)
, t1 Varchar2(450)
, t2 Varchar2(450)
, t3 Varchar2(450)
, t4 Varchar2(450)
, t5 Varchar2(450)
, t6 Varchar2(450)
, t7 Varchar2(450)
, t8 Varchar2(450)
, t9 Varchar2(450)
, d1 Varchar2(20)
, d2 Varchar2(20)
, d3 Varchar2(20)
, d4 Varchar2(20)
, d5 Varchar2(20)
, l1 number(10)
, l2 number(10)
, l3 number(10)
, l4 number(10)
, l5 number(10)
, l6 number(10)
, l7 number(10)
, l8 number(10)
, m1 text
, m2 text
, m3 text
, m4 text
, m5 text
);
CREATE TABLE IF NOT EXISTS tkberichtdossier
 (
 bdid number(10)
, berichtid number(10)
, dossierid number(10)
, onderwerpid number(10)
, dosid number(10)
, schuldid number(10)
, verplichtingid number(10)
, relatieid number(10)
, afspraakid number(10)
, toelichting Varchar2(765)
);
CREATE TABLE IF NOT EXISTS tkberichtnietklaar
 (
 berichtid number(10)
, statusid number(10)
);
CREATE TABLE IF NOT EXISTS tkberichtrol
 (
 brolid number(10)
, berichtid number(10)
, rolid number(10)
, naam Varchar2(750)
, relatieid number(10)
, werkzaamid number(10)
, adresid number(10)
, emailid number(10)
, faxid number(10)
, statusid number(10)
, aantal number(10)
, bevestigd number(10)
, gebruikerid number(10)
);
CREATE TABLE IF NOT EXISTS tkbetrokken
 (
 betrokkenid number(10)
, stapid number(10)
, actieid number(10)
, afspraakid number(10)
, naam Varchar2(300)
, relatieid number(10)
, werkzaamid number(10)
, rolid Varchar2(3)
, rol Varchar2(150)
, statusid number(10)
, indirect Varchar2(250)
, vervoer number(10)
, gebruikerid number(10)
, volgnummer number(10)
, long1 number(10)
, long2 number(10)
);
CREATE TABLE IF NOT EXISTS tkbezitlog
 (
 bezitlogid number(10)
, bezittingid number(10)
, op Varchar2(20)
, door number(10)
, waarde number(10)
, toelichting text
, betreftid number(10)
, referentienummer Varchar2(150)
);
CREATE TABLE IF NOT EXISTS tkbezitwaardeA
 (
 bezittingid number(10)
, laatsteid Varchar2(20)
);
CREATE TABLE IF NOT EXISTS tkchat
 (
 chatid number(10)
, op Varchar2(20)
, door number(10)
, chat text
, aapid number(10)
, callid Varchar2(108)
, soort number(10)
);
CREATE TABLE IF NOT EXISTS tkchecklist
 (
 checklistid number(10)
, checklistvanid number(10)
, id number(10)
, koptekst Varchar2(150)
, volgnummer number(10)
, punt text
, instructie text
, statusid number(10)
, op Varchar2(20)
, door number(10)
, inchecklistid number(10)
, voortgangsmelding text
, deadline Varchar2(20)
, deelactieid number(10)
);
CREATE TABLE IF NOT EXISTS tkdebiteurenall
 (
 debiteurid number(10)
, tariefcode Varchar2(150)
, facturatie number(10)
);
CREATE TABLE IF NOT EXISTS tkformulierdata
 (
 tkformdataid number(10)
, formulieridentificatie Varchar2(150)
, identificatie Varchar2(150)
, inhoud Varchar2(300)
, memo text
);
CREATE TABLE IF NOT EXISTS tkgeescaleerdeacties
 (
 actieid number(10)
, stapid number(10)
, op Varchar2(20)
, Kleur Varchar2(18)
, pagina Varchar2(150)
, dossierid number(10)
, kenmerk Varchar2(150)
, referentie Varchar2(750)
, actie_ Varchar2(420)
, start Varchar2(20)
, streefeind Varchar2(20)
, status__kl1 Varchar2(150)
);
CREATE TABLE IF NOT EXISTS tkmailinglist
 (
 mailingid number(10)
, maildosid number(10)
, relatieid number(10)
, werkzaamid number(10)
, aan Varchar2(750)
, tav Varchar2(750)
, aanhef Varchar2(300)
, aid number(10)
, emid number(10)
, fxid number(10)
, statusid number(10)
, alfabetisch Varchar2(150)
, dossierid number(10)
);
CREATE TABLE IF NOT EXISTS tkmemo
 (
 memoid number(10)
, van number(10)
, aan number(10)
, memotekst text
, invoer Varchar2(20)
, plek number(10)
, datum Varchar2(20)
, kleur Varchar2(21)
, relatieid number(10)
, dossierid number(10)
, berichtid number(10)
, naam Varchar2(450)
, nummer Varchar2(105)
, gedaan Varchar2(20)
, door number(10)
, vanaf Varchar2(20)
);
CREATE TABLE IF NOT EXISTS tknotitie
 (
 notitieid number(10)
, notitie text
, door number(10)
, op Varchar2(20)
, systeem Varchar2(250)
, dossierid number(10)
, onderwerpid number(10)
, duur number(10)
, tijdcodeid number(10)
, bestand Varchar2(750)
, factuurid number(10)
, factuurrolid number(10)
);
CREATE TABLE IF NOT EXISTS tkpad
 (
 padid number(10)
, padnaam Varchar2(750)
, padcode Varchar2(6)
, dossierid number(10)
, toestandid number(10)
, kalenderid number(10)
, volgnummer number(10)
, managerid number(10)
, pplanstart Varchar2(20)
, pplaneinde Varchar2(20)
, pechtestart Varchar2(20)
, pechteinde Varchar2(20)
, toelichting text
);
CREATE TABLE IF NOT EXISTS tkpgbperiode
 (
 actieid number(10)
, Omschrijving Varchar2(3)
, dossierid number(10)
, periodevan Varchar2(20)
);
CREATE TABLE IF NOT EXISTS tkprocedure
 (
 procid number(10)
, procedureid number(10)
, regel number(10)
, dossierid number(10)
, berichtid number(10)
, referentie Varchar2(300)
, relatieid number(10)
, verplichtingid number(10)
, t1 Varchar2(450)
, t2 Varchar2(450)
, t3 Varchar2(450)
, t4 Varchar2(450)
, t5 Varchar2(450)
, t6 Varchar2(450)
, t7 Varchar2(450)
, t8 Varchar2(450)
, t9 Varchar2(450)
, d1 Varchar2(20)
, d2 Varchar2(20)
, d3 Varchar2(20)
, d4 Varchar2(20)
, d5 Varchar2(20)
, l1 number(10)
, l2 number(10)
, l3 number(10)
, l4 number(10)
, l5 number(10)
, l6 number(10)
, l7 number(10)
, l8 number(10)
, m1 text
, m2 text
, m3 text
, door number(10)
, op Varchar2(20)
, beloofd number(10)
, ingeplandop number(10)
, ingeplandvoor number(10)
, plangroepid number(10)
, prioriteit number(10)
, termijnalarm number(10)
, alsantwoord number(10)
);
CREATE TABLE IF NOT EXISTS tkprocedure1
 (
 procid number(10)
, procedureid number(10)
, regel number(10)
, dossierid number(10)
, berichtid number(10)
, referentie Varchar2(300)
, relatieid number(10)
, verplichtingid number(10)
, t1 Varchar2(450)
, t2 Varchar2(450)
, t3 Varchar2(450)
, t4 Varchar2(450)
, t5 Varchar2(450)
, t6 Varchar2(450)
, t7 Varchar2(450)
, t8 Varchar2(450)
, t9 Varchar2(450)
, d1 Varchar2(20)
, d2 Varchar2(20)
, d3 Varchar2(20)
, d4 Varchar2(20)
, d5 Varchar2(20)
, l1 number(10)
, l2 number(10)
, l3 number(10)
, l4 number(10)
, l5 number(10)
, l6 number(10)
, l7 number(10)
, l8 number(10)
, m1 text
, m2 text
, m3 text
, door number(10)
, op Varchar2(20)
, beloofd number(10)
, ingeplandop number(10)
, ingeplandvoor number(10)
, plangroepid number(10)
, prioriteit number(10)
, termijnalarm number(10)
, alsantwoord number(10)
);
CREATE TABLE IF NOT EXISTS tkprocedure2
 (
 procid number(10)
, procedureid number(10)
, regel number(10)
, dossierid number(10)
, berichtid number(10)
, referentie Varchar2(300)
, relatieid number(10)
, verplichtingid number(10)
, t1 Varchar2(450)
, t2 Varchar2(450)
, t3 Varchar2(450)
, t4 Varchar2(450)
, t5 Varchar2(450)
, t6 Varchar2(450)
, t7 Varchar2(450)
, t8 Varchar2(450)
, t9 Varchar2(450)
, d1 Varchar2(20)
, d2 Varchar2(20)
, d3 Varchar2(20)
, d4 Varchar2(20)
, d5 Varchar2(20)
, l1 number(10)
, l2 number(10)
, l3 number(10)
, l4 number(10)
, l5 number(10)
, l6 number(10)
, l7 number(10)
, l8 number(10)
, m1 text
, m2 text
, m3 text
, door number(10)
, op Varchar2(20)
, beloofd number(10)
, ingeplandop number(10)
, ingeplandvoor number(10)
, plangroepid number(10)
, prioriteit number(10)
, termijnalarm number(10)
, alsantwoord number(10)
);
CREATE TABLE IF NOT EXISTS tkprocedurestap
 (
 procstapid number(10)
, naam Varchar2(150)
, procedureid number(10)
, soortid number(10)
, volgnummer number(10)
, ingangen Varchar2(150)
, uitgangen Varchar2(150)
, links number(10)
, boven number(10)
, toelichting text
, l1 number(10)
, l2 number(10)
, l3 number(10)
, l4 number(10)
, l5 number(10)
, t1 Varchar2(750)
, t2 Varchar2(750)
, t3 Varchar2(150)
, t4 Varchar2(150)
, t5 Varchar2(150)
, t6 Varchar2(150)
, m1 text
, m2 text
, m3 text
);
CREATE TABLE IF NOT EXISTS tkregelingenA
 (
 taakid number(10)
, taak Varchar2(750)
, groep Varchar2(150)
, dossierid number(10)
, tabblad number(10)
);
CREATE TABLE IF NOT EXISTS tkrooster
 (
 roosterid number(10)
, datum Varchar2(20)
, gebruikerid number(10)
, roostersoort number(10)
, uren number(10)
, dogid number(10)
, begintijd Varchar2(15)
, eindtijd Varchar2(15)
);
CREATE TABLE IF NOT EXISTS tksignaal
 (
 signaalid number(10)
, actieid number(10)
, afspraakid number(10)
, gebruikerid number(10)
, toelichting text
, start Varchar2(20)
, op Varchar2(20)
, duur number(10)
, eenheden number(10)
, keren number(10)
, systeem Varchar2(250)
);
CREATE TABLE IF NOT EXISTS tkspam
 (
 berichtid number(10)
, INberichtid number(10)
, statusid number(10)
, rolid number(10)
);
CREATE TABLE IF NOT EXISTS tkstap
 (
 stapid number(10)
, stap text
, padid number(10)
, stapcode Varchar2(18)
, planstart Varchar2(20)
, planeinde Varchar2(20)
, toestandid number(10)
, toelichting text
, nastappen Varchar2(750)
, duur number(10)
, echteinde Varchar2(20)
, staplogid number(10)
);
CREATE TABLE IF NOT EXISTS tktaak
 (
 taakid number(10)
, dossierid number(10)
, taak Varchar2(750)
, intaakid number(10)
, categorieid number(10)
, klantid number(10)
, toelichting text
, relatieid number(10)
, naam Varchar2(750)
, terattentievan Varchar2(750)
, adres Varchar2(1500)
, klantreferentie number(10)
, klantnummer Varchar2(150)
, startperiode Varchar2(20)
, eindperiode Varchar2(20)
, aantalperiode number(10)
, eenheidperiode number(10)
, gereedaantal number(10)
, gereedeenheid number(10)
, gereedperiode number(10)
, laatstekeer Varchar2(20)
, keren number(10)
, legendaid number(10)
, statusmodel Varchar2(150)
, startstatusid number(10)
, aantaleerder number(10)
, eenheideerder number(10)
, voertuit number(10)
, ondersteunt number(10)
, door number(10)
, op Varchar2(20)
, volgendekeer Varchar2(20)
, periode Varchar2(450)
, gereed Varchar2(150)
, aanmaken Varchar2(150)
, wijzigingper Varchar2(20)
);
CREATE TABLE IF NOT EXISTS tktaakdata
 (
 taakdataid number(10)
, taakid number(10)
, dossierid number(10)
, regel number(10)
, t1 Varchar2(450)
, t2 Varchar2(450)
, t3 Varchar2(450)
, t4 Varchar2(450)
, t5 Varchar2(450)
, t6 Varchar2(450)
, t7 Varchar2(450)
, t8 Varchar2(450)
, t9 Varchar2(450)
, d1 Varchar2(20)
, d2 Varchar2(20)
, d3 Varchar2(20)
, d4 Varchar2(20)
, l1 number(10)
, d5 Varchar2(20)
, l2 number(10)
, l3 number(10)
, l4 number(10)
, l5 number(10)
, l6 number(10)
, l7 number(10)
, l8 number(10)
, m1 text
, m2 text
, m3 text
, m4 text
, m5 text
, m6 text
, m7 text
, m8 text
, m9 text
);
CREATE TABLE IF NOT EXISTS tktelefoon
 (
 telefoonid number(10)
, statusid number(10)
, relatieid number(10)
, relatie Varchar2(210)
, werkzaamid number(10)
, werkzaam Varchar2(210)
, nummer Varchar2(75)
, dossierid number(10)
, verslag text
, bijwerkzaam Varchar2(75)
, duur number(10)
, op Varchar2(20)
, door number(10)
, verwerktdoor number(10)
, inuit number(10)
, terugbelid number(10)
, tijdcodeid number(10)
, factuurid number(10)
, factuurrolid number(10)
, factuurtekst text
);
CREATE TABLE IF NOT EXISTS tktelefoonverwerkt
 (
 tvid number(10)
, telefoonid number(10)
, wat Varchar2(180)
, watid number(10)
, groep number(10)
, dossierid number(10)
);
CREATE TABLE IF NOT EXISTS tktermijn
 (
 tktermijnid number(10)
, termijnid number(10)
, dossierid number(10)
, id number(10)
);
CREATE TABLE IF NOT EXISTS tkteverzenden
 (
 berichtid number(10)
, kenmerk Varchar2(150)
, onderwerp Varchar2(750)
, inuit number(10)
, status Varchar2(225)
, berichtwijzeid number(10)
, door number(10)
, toestand number(10)
, rolid number(10)
, naam Varchar2(750)
, afzender number(10)
, statusid number(10)
, emailid number(10)
);
CREATE TABLE IF NOT EXISTS tktoewijzing
 (
 toewijsid number(10)
, berichtid number(10)
, gebruikerid number(10)
, nieuw Varchar2(250)
, prioriteit Varchar2(250)
, beloofd Varchar2(250)
, opmerking text
, kopregel Varchar2(300)
, dossierid number(10)
, docid number(10)
);
CREATE TABLE IF NOT EXISTS tktoken
 (
 procedureid number(10)
, id number(10)
, token Varchar2(300)
, tokenid number(10)
, moment Varchar2(20)
);
CREATE TABLE IF NOT EXISTS tkvernieuwd
 (
 nieuwid number(10)
, knop number(10)
, soortid number(10)
, gebruikerid number(10)
, beheerform Varchar2(75)
, id number(10)
, toelichting text
, zoomveld Varchar2(750)
, door number(10)
, op Varchar2(20)
, idtwee number(10)
);
CREATE TABLE IF NOT EXISTS tkverzamel
 (
 tkverzamelid number(10)
, dossierid number(10)
, verzamelid number(10)
, relatieid number(10)
, klantid number(10)
, document Varchar2(750)
, status number(10)
, geldigtot Varchar2(20)
, door number(10)
, op Varchar2(20)
, gescand number(10)
, toelichting text
, groep Varchar2(150)
, bestand Varchar2(750)
, betreft Varchar2(105)
, nummer Varchar2(150)
, perid number(10)
, verplicht number(10)
, nietintakebrief number(10)
, soort number(10)
);
CREATE TABLE IF NOT EXISTS tkverzonden
 (
 berichtid number(10)
, kenmerk Varchar2(150)
, onderwerp Varchar2(750)
, inuit number(10)
, status Varchar2(225)
, berichtwijzeid number(10)
, door number(10)
, toestand number(10)
, rolid number(10)
, naam Varchar2(750)
, afzender number(10)
, emailid number(10)
);
CREATE TABLE IF NOT EXISTS tkxfeestdag
 (
 feestid number(10)
, feestdatum Varchar2(20)
, omschrijving Varchar2(150)
, vrij number(10)
, geenbetaalverkeer Varchar2(250)
);
CREATE TABLE IF NOT EXISTS tkxgemeente
 (
 gemeenteid number(10)
, cbsgemeente number(10)
, relatieid number(10)
, terattentievan Varchar2(105)
, adresid number(10)
, aanvraagbijzbijstand number(10)
, aanvraaggereedper number(10)
, aanvraaggereedeenheid number(10)
, aanvraagtermijn number(10)
, aantaleerder number(10)
, eenheideerder number(10)
, verlengenbijzbijstand number(10)
, voertuit number(10)
, nota number(10)
, notaper number(10)
, notaeenheid number(10)
, notagereedper number(10)
, notagereedeenheid number(10)
, notatermijn number(10)
);
CREATE TABLE IF NOT EXISTS tkxkanton
 (
 xkantonid number(10)
, kantonid number(10)
, vanaf Varchar2(45)
, totmet Varchar2(45)
, aanvraagperiode number(10)
, aanvraaggereedper number(10)
, aanvraaggereedeenheid number(10)
, aanvraagtermijn number(10)
, aantaleerder number(10)
, eenheideerder number(10)
, voertuit number(10)
, aanmaken Varchar2(750)
, gereed Varchar2(750)
);
CREATE TABLE IF NOT EXISTS tkxlocatie
 (
 locatieid number(10)
, locatie Varchar2(765)
);
CREATE TABLE IF NOT EXISTS tkxmiddel
 (
 middelid number(10)
, middel Varchar2(150)
, einddatum Varchar2(20)
);
CREATE TABLE IF NOT EXISTS tkxonderwerp
 (
 onderwerpid number(10)
, onderwerp Varchar2(150)
, kleur Varchar2(18)
, inonderwerpen text
, soort number(10)
, alstekst text
);
CREATE TABLE IF NOT EXISTS tkxplangroep
 (
 plangroepid number(10)
, plangroep Varchar2(105)
, volgnummer number(10)
, randkleur Varchar2(18)
);
CREATE TABLE IF NOT EXISTS tkxrol
 (
 rolid Varchar2(3)
, rol Varchar2(150)
, volgnummer number(10)
, actief Varchar2(250)
);
CREATE TABLE IF NOT EXISTS tkxrooster
 (
 xroosterid number(10)
, gebruikerid number(10)
, ingangsdatum Varchar2(20)
, week number(10)
, dag1 number(10)
, dag2 number(10)
, dag3 number(10)
, dag4 number(10)
, dag5 number(10)
, dag6 number(10)
, dag7 number(10)
, urenperweek Varchar2(24)
, adv number(10)
);
CREATE TABLE IF NOT EXISTS tkxspam
 (
 spamid number(10)
, soortspamid number(10)
, bestemming Varchar2(150)
, door number(10)
);
CREATE TABLE IF NOT EXISTS tkxwerktijden
 (
 werktijdid number(10)
, werktijd Varchar2(150)
, roostercode Varchar2(15)
, van1 Varchar2(15)
, tot1 Varchar2(15)
, van2 Varchar2(15)
, tot2 Varchar2(15)
, van3 Varchar2(15)
, tot3 Varchar2(15)
, uren number(10)
);
CREATE TABLE IF NOT EXISTS udbureaublad
 (
 bbid number(10)
, gebruikerid number(10)
, volgnummer number(10)
, kindid number(10)
, id number(10)
, tekst Varchar2(150)
, logo Varchar2(150)
, tooltip Varchar2(750)
, returnbutton number(10)
);
CREATE TABLE IF NOT EXISTS uddelbericht
 (
 berichtid number(10)
, datumtijd Varchar2(20)
, messageid Varchar2(750)
);
CREATE TABLE IF NOT EXISTS uddoslog
 (
 logid number(10)
, gebruikerid number(10)
, dossierid number(10)
, actie number(10)
, moment Varchar2(20)
, toelichting text
);
CREATE TABLE IF NOT EXISTS udexeclog
 (
 execlogid number(10)
, functieaanroep Varchar2(750)
, op Varchar2(20)
, gebruikerid number(10)
, melding text
, rubriekid number(10)
);
CREATE TABLE IF NOT EXISTS udexportlog
 (
 exportlogid number(10)
, administratieid number(10)
, cid1 number(10)
, op Varchar2(20)
, door number(10)
, melding text
, exportbestand Varchar2(750)
, actie number(10)
);
CREATE TABLE IF NOT EXISTS udftplog
 (
 ftpid number(10)
, betreftid number(10)
, bestand Varchar2(750)
, map Varchar2(750)
, op Varchar2(20)
, wat text
, uitgevoerd Varchar2(20)
, gebruikerid number(10)
, oudeversie number(10)
);
CREATE TABLE IF NOT EXISTS udquerylog
 (
 queryid number(10)
, gebruikerid number(10)
, moment Varchar2(20)
, sqlquery text
, formulier Varchar2(60)
, fout text
, positie text
, stack text
, bronid number(10)
);
CREATE TABLE IF NOT EXISTS udrooster
 (
 udroosterid number(10)
, datum Varchar2(20)
, gebruikerid number(10)
, werktijden number(10)
, rooster text
, minuren Varchar2(36)
, maxuren Varchar2(36)
, uren number(10)
);
CREATE TABLE IF NOT EXISTS udspamlog
 (
 spamlogid number(10)
, moment Varchar2(20)
, geadresseerde text
, afzender text
, mailbericht text
, spamregel number(10)
, messageid Varchar2(1050)
);
CREATE TABLE IF NOT EXISTS udtabellog
 (
 tabellogid number(10)
, tabelid number(10)
, veldid number(10)
, regel number(10)
, recordid number(10)
, tabellogactie number(10)
, op Varchar2(20)
, door number(10)
, was Varchar2(105)
, werd Varchar2(105)
);
CREATE TABLE IF NOT EXISTS uduserbutton
 (
 udubid number(10)
, gebruikerid number(10)
, kindid number(10)
, id number(10)
, tabblad number(10)
, tabselect number(10)
, viewtab number(10)
, viewselect number(10)
, curpage text
, link1 text
, link2 text
, link3 Varchar2(300)
, link4 Varchar2(300)
, pagina number(10)
, subviewtab number(10)
, subviewselect number(10)
, moment Varchar2(20)
);
CREATE TABLE IF NOT EXISTS uduserlog
 (
 sessieid number(10)
, gebruikerid number(10)
, administratieid number(10)
, computer Varchar2(150)
, starttijd Varchar2(20)
, eindtijd Varchar2(20)
);
CREATE TABLE IF NOT EXISTS ut_qry132
 (
 cid number(10)
, inhoud Varchar2(225)
, comboid Varchar2(150)
);
CREATE TABLE IF NOT EXISTS ut_qry161
 (
 categorieid number(10)
, categorie Varchar2(105)
, inhoud Varchar2(225)
);
CREATE TABLE IF NOT EXISTS vContentweergave
 (
 wid number(10)
, wgv Varchar2(225)
);
CREATE TABLE IF NOT EXISTS vKopRelevanteInfo
 (
 inhoud Varchar2(225)
, vanuitid number(10)
);
CREATE TABLE IF NOT EXISTS vLijstjeOpen
 (
 dossierid number(10)
, maxmoment Varchar2(20)
, gebruikerid number(10)
);
CREATE TABLE IF NOT EXISTS vLijstjeTW
 (
 dossierid number(10)
, maxmoment Varchar2(20)
, gebruikerid number(10)
);
CREATE TABLE IF NOT EXISTS voorpaginalinks
 (
 kop Varchar2(150)
, vn number(10)
, id number(10)
, tekst_ text
, ankerid number(10)
, extraparameters Varchar2(450)
, vanuitid number(10)
, certificaat Varchar2(105)
, einddatum Varchar2(20)
);
CREATE TABLE IF NOT EXISTS wachtlijstVerwijzerA
 (
 onderwerpid number(10)
, berichtid number(10)
, procid number(10)
, d1 Varchar2(20)
, datumtijd Varchar2(20)
, anoniem Varchar2(9)
, verwijzerid number(10)
, referentie Varchar2(300)
, aanverwijzer number(10)
, ontvangen Varchar2(20)
, INberichtid number(10)
, dossierid number(10)
, afwijsid number(10)
);
CREATE TABLE IF NOT EXISTS wachtlijstverwijzerB
 (
 verwijzerid number(10)
, referentie Varchar2(600)
, laatste mutatie Varchar2(20)
);
CREATE TABLE IF NOT EXISTS wscache
 (
 id number(10)
, content Varchar2(750)
, siteid number(10)
, gebruikerid number(10)
, frame number(10)
, pagina text
, moment Varchar2(20)
);
CREATE TABLE IF NOT EXISTS wsrespons
 (
 responsid number(10)
, formulierid number(10)
, siteid number(10)
, velden text
, moment Varchar2(20)
, onderwerp text
, bericht text
, email Varchar2(600)
, emailstatus number(10)
, dossierid number(10)
);
CREATE TABLE IF NOT EXISTS wusbericht
 (
 wusberichtid number(10)
, wuscomid number(10)
, wusberichtsoortid number(10)
, identificatie Varchar2(105)
, subidentificatie1 Varchar2(105)
, subidentificatie2 Varchar2(105)
, administratieid number(10)
, dossierid number(10)
, dogid number(10)
, relevantid number(10)
, t1 Varchar2(750)
, t2 Varchar2(750)
, t3 Varchar2(300)
, t4 Varchar2(300)
, t5 Varchar2(300)
, t6 Varchar2(300)
, t7 Varchar2(300)
, t8 Varchar2(300)
, t9 Varchar2(300)
, d1 Varchar2(20)
, d2 Varchar2(20)
, d3 Varchar2(20)
, d4 Varchar2(20)
, d5 Varchar2(20)
, l1 number(10)
, l2 number(10)
, l3 number(10)
, l4 number(10)
, l5 number(10)
, l6 number(10)
, l7 number(10)
, l8 number(10)
, l9 number(10)
, behandelaarid number(10)
, m1 text
, m2 text
, ontvangen Varchar2(20)
, referentie text
, verwerkt Varchar2(20)
, voortgang number(10)
, wusstatusid number(10)
);
CREATE TABLE IF NOT EXISTS wuscodelijst
 (
 wuscodelijstid number(10)
, codelijst Varchar2(225)
, codereferentie Varchar2(225)
, toegestanewaarde Varchar2(225)
);
CREATE TABLE IF NOT EXISTS wuscommunicatie
 (
 wuscomid number(10)
, wuserviceid number(10)
, referentie Varchar2(300)
, administratieid number(10)
, dossierid number(10)
, xmlbestand Varchar2(250)
, op Varchar2(20)
, door number(10)
, antwoordopwuscomid number(10)
, verstuurd Varchar2(20)
, wuscomstatus number(10)
, beperking Varchar2(250)
, cookie Varchar2(150)
, incorrect Varchar2(250)
, notificatie Varchar2(20)
, rijen number(10)
, startrij number(10)
, wusberichtid number(10)
);
CREATE TABLE IF NOT EXISTS wuservice
 (
 wuserviceid number(10)
, servicenaam Varchar2(300)
, service Varchar2(75)
, methode Varchar2(105)
, wsdl Varchar2(250)
, productie Varchar2(250)
, communicatie Varchar2(250)
, richting number(10)
, status number(10)
, gebruik number(10)
, geenpaginering text
, welpaginering text
, soapurl Varchar2(750)
, soapaction Varchar2(750)
, xmlid number(10)
);
CREATE TABLE IF NOT EXISTS wusformulier
 (
 wusformulierid number(10)
, formulier Varchar2(300)
, wusformuliergroepid number(10)
, sjabloonidentificatie Varchar2(105)
, formstatusid number(10)
, definitie text
, versiedatum Varchar2(20)
, versiemodel number(10)
, testactieid number(10)
);
CREATE TABLE IF NOT EXISTS wusformulierband
 (
 wusbandid number(10)
, wusformulierid number(10)
, parentbandid number(10)
, volgnummer number(10)
, bandsoortid number(10)
, band Varchar2(225)
, identificatie Varchar2(150)
);
CREATE TABLE IF NOT EXISTS wusformulierbron
 (
 wusbronid number(10)
, wusformulierid number(10)
, volgnummer number(10)
, bronreferentie Varchar2(225)
, bronstatement text
, totaaltelling Varchar2(75)
, totaalin number(10)
);
CREATE TABLE IF NOT EXISTS wusformuliergegeven
 (
 wusformgegevenid number(10)
, wusformulierid number(10)
, identificatie Varchar2(150)
, referentie Varchar2(150)
, verplicht Varchar2(250)
, tiepe Varchar2(45)
, aansturing text
, isverantw Varchar2(250)
, relevantieregels Varchar2(250)
, alleenlezen Varchar2(250)
, invoer number(10)
, bronid number(10)
, controle Varchar2(250)
, opmerking Varchar2(150)
);
CREATE TABLE IF NOT EXISTS wusformulierlogica
 (
 wuslogicaid number(10)
, wusformulierid number(10)
, identificatie Varchar2(150)
, testidentificatie Varchar2(150)
, vergelijking Varchar2(75)
, testwaarde Varchar2(75)
);
CREATE TABLE IF NOT EXISTS wusformulieropbouw
 (
 wusformulierid number(10)
, identificatie Varchar2(150)
, bandid number(10)
, band Varchar2(225)
, bandvolgnummer number(10)
, elementid number(10)
, element Varchar2(225)
, elementvolgnumme number(10)
, gridelementid number(10)
, gridelement Varchar2(225)
, gridelementvolgnummer number(10)
);
CREATE TABLE IF NOT EXISTS wuslogboek
 (
 wuslogid number(10)
, wusberichtid number(10)
, wuserviceid number(10)
, wusstatusid number(10)
, logdatum Varchar2(20)
, logging text
);
CREATE TABLE IF NOT EXISTS wusparameter
 (
 wusparameterid number(10)
, administratieid number(10)
, wusparameter Varchar2(105)
, parameterwaarde Varchar2(300)
, zwork Varchar2(250)
);
CREATE TABLE IF NOT EXISTS wustag
 (
 wustagid number(10)
, wuserviceid number(10)
, tagis text
, tagwordt text
);
CREATE TABLE IF NOT EXISTS wustestscenario
 (
 wustestid number(10)
, beschrijving Varchar2(300)
, service number(10)
, volgnummer number(10)
, xml text
, zaakid Varchar2(150)
, formulierid Varchar2(150)
, taakid Varchar2(150)
, berichtid Varchar2(150)
, persoonsid Varchar2(150)
, anderid Varchar2(150)
, ontvangen Varchar2(250)
);
CREATE VIEW MV_BERICHT
 AS
  select
 a.berichtid as bberichtid,
 a.bdid,
 a.dossierid,
 a.onderwerpid,
 a.dosid,
 a.schuldid,
 a.verplichtingid,
 a.afspraakid,
 a.toelichting,
 b.*
 from tkberichtdossier a
 join tkbericht b on  a.berichtid=b.berichtid;
CREATE VIEW MV_CLIENT
 AS
 select
 r.*,
 e.nummer as email,
 m.nummer as telnr,
 p1.postcode as postcode_bezoekadres,
 p1.straat as straat_bezoekadres,
 p2.postcode as postcode_postadres,
 p2.straat as straat_postkadres,
 pl1.plaats as plaats_bezoekadres,
 pl2.plaats as plaats_postadres

 from rlatie r
 join rlnummer e on  r.emailid=e.nummerid
 join rlnummer m on  m.nummerid=r.mobielid
 join rlxpostcodenl p1 on  p1.pcid=r.bezoekadresid
 join rlxpostcodenl p2 on  p2.pcid=r.postadresid
 left join rlxplaatsnl pl1 on  p1.plaatsid=pl1.plaatsid
 left join rlxplaatsnl pl2 on  p2.plaatsid=pl2.plaatsid;
CREATE VIEW MV_KIND
 AS
 select
 d5.klantid as relatieid,
 d1.vindnummerid,
 d1.dossierid,
 d1.kenmerk,
 d1.nummer,
 d1.zoeknummer,
 d1.bronid,
 d1.vindsoortid,
 d1.certificaten,
 d1.ocrprioriteit,
 --d2.nummer as 'burgerservicenummer',
 d2.nummer as 'burgerservicenummer',
 d4.d1 as 'geboortedatum'
 -- d4.*
 -- d3.nummer as 'geboortedatum'
 from doznummer d1
 join doznummer d2 on  d1.dossierid=d2.dossierid and d1.bronid=d2.bronid and d2.Kenmerk = 'Burgerservicenummer ' || d1.nummer
 --join "2work".dbo.doznummer d3 on  d1.bronid=d3.bronid and convert(varchar(max), d3.[Kenmerk]) = Concat('Geboortedatum ', d1.nummer)
 join dogrid d4 on  d1.bronid=d4.dogid
 join dossier d5 on  d1.dossierid=d5.dossierid
 where d1.Kenmerk = 'Kind';
CREATE INDEX md_archieflogi01 on md_archieflog (moment);
CREATE INDEX md_archieflogi02 on md_archieflog (userinfo);
CREATE INDEX md_archieflogi03 on md_archieflog (typeinfo);
CREATE INDEX me_prognosi01 on me_prognose (dossierid);
CREATE INDEX me_prognosi02 on me_prognose (dossierid, datum desc, bedrag desc);
COMMIT;
