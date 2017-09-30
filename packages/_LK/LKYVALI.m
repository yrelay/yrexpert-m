;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;LKYVALI^INT^1^59547,74868^0
LKYVALI ;
 
 
 
 
 N %I,ADR,ATT,ERR,GL,I,MSG,NOM,NUM,REP,STOP,TEMP,VAL,RES
NOM 
 D CLEPAG^%VVIDEO,^%VZCD(0,39,0,4,1,0,$$^%QZCHW("Validation"))
 S DX=10,DY=10 D CLEBAS^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW("Nom de la passerelle")_" : ","",1,RM-4,DY+1,DY-1,"","",.STOP,.NOM)
 I (NOM="")!(STOP'="") Q
 I NOM="?" S NOM=$$SELECT^%QSGEST6("^[QUI]LKY2",$$^%QZCHW("Choisissez une passerelle")) G:NOM="" NOM
 I '($D(^[QUI]LKY2(NOM))) D ^%VZEAVT($$^%QZCHW("Cette passerelle n'existe pas")) G NOM
 S RES=$$VALID(NOM,1)
 Q
 
VALID(NOM,TRACE) 
 N %I,ADR,ATT,ERR,GL,I,MSG,NUM,REP,STOP,TEMP,VAL
 
DEB S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S GL=$$CONCAS^%QZCHAD(TEMP,"GL"),ERR=$$CONCAS^%QZCHAD(TEMP,"ERR")
 D:TRACE ^%VZEATT
 S ADR=$$CONCAS^%QZCHAD("^[QUI]LKY2",NOM)
 
 S MSG=$$OUT^%QZCHGE(ADR,1,.VAL)
 I MSG'=0 D INS($$^%QZCHW("Le nombre d'enregistrements n'est pas defini"))
 I VAL="" S VAL=0
 I '($$POS^%QZNBN(VAL)) D INS($$^%QZCHW("Le nombre d'enregistrements doit avoir une valeur strictement positive")) S VAL=1
 S @GL@("ENR","NBRE")=VAL
 
 S MSG=$$OUT^%QZCHGE(ADR,2,.VAL)
 I MSG'=0 D INS($$^%QZCHW("Le separateur n'est pas defini"))
 S @GL@("SEP")=VAL
 
 S MSG=$$OUT^%QZCHGE(ADR,3,.REP)
 I MSG'=0 D INS($$^%QZCHW("Le repertoire de base n'est pas defini")) G AFF
 I $$REPM^%QSGEST9(REP)=0 D INS($$^%QZCHW("Le repertoire")_" "_REP_" "_$$^%QZCHW("n'est pas un repertoire du modele installe")) G AFF
 
 
 S ADR=$$CONCAS^%QZCHAD("^[QUI]LKYENR2",NOM)
 S NUM=""
 F %I=0:0 S NUM=$O(@ADR@(NUM)) Q:NUM=""  D TE
 S REP=$$NOMINT^%QSF(REP)
 
 
 D ^LKYVAL1(NOM)
 I '($D(@ERR)) D:TRACE ^%VZEAVT($$^%QZCHW("Validation correcte")) S ^[QUI]RQSDON("LK",NOM,"ETAT")="OK"
 
 D:TRACE MSG^%VZEATT($$^%QZCHW("Tests sur la presence des attributs NOM"))
 
 S STOP=1
 S ADR=$$CONCAS^%QZCHAD("^[QUI]LKYATR2",NOM)
 I '($D(@ADR@("NOM"))) D INS($$^%QZCHW("L'attribut NOM n'existe pas pour le repertoire")_" "_$$NOMLOG^%QSF(REP)) S STOP=0
 S ATT=""
 F %I=0:0 S ATT=$O(@GL@("LIEN",ATT)) Q:ATT=""  S NUM=2 D TL
 
 I ^[QUI]RQSNCLES(REP)=1 G AFFER
 
 
 N BASEC,BASEP,CHEM,LIEN,OR
 S BASEC=REP,CHEM="",OR=^[QUI]RQSNCLES(REP)
PERE 
 D PEREFILS^%QSGEL2(BASEC,.BASEP,.LIEN)
 S LIEN=$$LIENI^%QSGEL2(BASEP,BASEC,LIEN,2)
 S CHEM=CHEM_LIEN
 I '($D(@GL@("LIEN","NOM~"_CHEM))) D INS($$^%QZCHW("L'attribut NOM n'existe pas pour le repertoire")_" "_$$NOMLOG^%QSF(BASEP)) S STOP=0
 S BASEC=BASEP,(BASEP,LIEN)=""
 S CHEM=CHEM_"~"
 S OR=OR-1
 I OR'=1 G PERE
 
 
AFFER 
 S ^[QUI]RQSDON("LK",NOM,"OKNOM")=STOP
 I STOP=1 D:TRACE ^%VZEAVT($$^%QZCHW("Tous les attributs NOM necessaires sont definis"))
 I STOP=0 D:TRACE ^%VZEAVT($$^%QZCHW("Il manque des attributs NOM ==> vous pourrez utiliser la passerelle seulement en ecriture"))
AFF 
 I $D(@ERR) D:TRACE AFFERR^%QULIMZ(ERR,$$^%QZCHW("Erreurs sur la passerelle")_" "_NOM)
 K @(TEMP) Q $D(@ERR)
 
TE 
 I NUM>@GL@("ENR","NBRE") D INS($$^%QZCHW("Le numero d'enregistrement")_" "_NUM_" "_$$^%QZCHW("est superieur au nombre d'enregistrements"))
 S MSG=$$OUT^%QZCHGE($$CONCAS^%QZCHAD(ADR,NUM),1,.VAL)
 I (MSG'=0)!(VAL="") D INS($$^%QZCHW("La longueur de l'enregistrement")_" "_NUM_" "_$$^%QZCHW("n'est pas definie"))
 I '($$POS^%QZNBN(VAL)) D INS($$^%QZCHW("La longueur de l'enregistrement")_" "_NUM_" "_$$^%QZCHW("doit avoir une valeur strictement positive"))
 
 S @GL@("ENR",NUM)=$S(VAL="":0,1:VAL)
 Q
 
TL 
 S LIEN="~"_$P(ATT,"~",2,NUM) Q:$P(LIEN,"~",NUM)=""
 S VAL=$$ZSUBST^%QZCHSUB(LIEN,"~LIEN.","~")
 S VAL=$$ZSUBST^%QZCHSUB(VAL,"~INVERSE.","~")
 I $E(VAL)="~" S VAL=$E(VAL,2,$L(VAL))
 
 I '($D(@ADR@("NOM~"_VAL))) D INS($$^%QZCHW("L'attribut NOM n'existe pas pour")_" "_VAL) S STOP=0
FTL S NUM=NUM+1 G TL
 
INS(M) 
 N L
 S L=$ZP(@ERR@(""))+1
 S @ERR@(L)=M
 Q
 
TEST 
 X ^DMO
 S NOM="TEST.LKYVALI"
 K ^[QUI]LKYENR2(NOM),^[QUI]LKYATR2(NOM),^[QUI]LKY2(NOM)
 S ^[QUI]LKY2(NOM)="2^*^ARTICLE^"
 S ^[QUI]LKYENR2(NOM,1)="150^"
 S ^[QUI]LKYENR2(NOM,2)="200^"
 S ^[QUI]LKYATR2(NOM,"CONSTANTE",1,1)="20^^NOM.ARTICLE^"
 S ^[QUI]LKYATR2(NOM,"NOM",1,21)="40^^NOM^N^^^N^^"
 S ^[QUI]LKYATR2(NOM,"DATE.TEST",1,41)="50^^01/01/89^N^^^O^3^"
 S ^[QUI]LKYATR2(NOM,"LONGUEUR",1,51)="60^^50^O^3^^N^^"
 S ^[QUI]LKYATR2(NOM,"QUANTITE~LIEN.COMPOSE.DE",1,100)="120^^0^O^3^^N^^"
 S ^[QUI]LKYATR2(NOM,"ACTION~GAMME.MOZART~OPERATION.MOZART",1,121)="150^^***^N^^^N^^"
 G DEB

