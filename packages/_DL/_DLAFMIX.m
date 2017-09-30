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

;%DLAFMIX^INT^1^59547,73867^0
DLAFMIX ;
 
 
 
 
 
 
 N ATR,CTR,JOUR,JOURD,JOURF,NL,TYP
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("MIX sur le carnet de commande"),0)
 S TYP="C"
 
DATD S DX=0,DY=5 D CLEBAS^%VVIDEO
 X XY D LIRE2^%VREAD($$^%QZCHW("Jour de debut")_" : ","",8,RM-4,DY+1,DY-1,"","",.CTR,.JOURD)
 I CTR'="" Q
 I JOURD="" G DATF
 S JOUR=$$CORRECT^%VYDAT(JOURD)
 I JOUR="" G DATD
 S JOURD=JOUR
 S DX=25 X XY W JOURD
 
DATF S DX=0,DY=7 D CLEBAS^%VVIDEO
 X XY D LIRE2^%VREAD($$^%QZCHW("Jour de fin")_" : ","",8,RM-4,DY+1,DY-1,"","",.CTR,.JOURF)
 I CTR'="" G DATD
 I JOURF="" G ATREP
 S JOUR=$$CORRECT^%VYDAT(JOURF)
 I JOUR="" G DATF
 S JOURF=JOUR
 I $$10^%QMDATE1(JOURF)<$$10^%QMDATE1(JOURD) D ^%VZEAVT($$^%QZCHW("Le jour de fin doit etre superieur au jour de debut")) G DATF
 S DX=23 X XY W JOURF
 
ATREP 
 S ATR=$$ATRSOR
 I ATR="" G DATF
 D CRLI(.NL,JOURD,JOURF)
 I $$CARD^%QSGEST7(NL)=0 D ^%VZEAVT($$^%QZCHW("Il n'existe aucune commande comprise entre ces 2 dates")) G FIN2
 
VISU 
 N FORM,GL,TABC
 S GL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GLO") K @(GL)
 D CONS(NL,GL)
 
 N TABC
 S TABC(1)="HISTOGRAMME",TABC(2)="ETOILE",TABC(3)="CAMEMBERT"
ACT D POCLEPA^%VVIDEO W $$^%QZCHW("Sous quelle forme")," : "
 S FORM=$E($$^%VZECHO("TABC"),1,3) I (FORM=1)!(FORM=6) G FIN
 D @FORM
 G ACT
 
HIS 
 D CLEPAG^%VVIDEO
 D ^%HXYPARA(0,2,80,19,"INIT^%DLAFMI2","AFF^%DLAFMI2","IMP^%DLAFMI2","","")
 D CLEPAG^%VVIDEO
 Q
 
FIN K @(GL)
FIN2 I TYP="C" D ^%VZEATT,DEL^%QSGES11(NL)
 Q
 
ETO 
 I ^TOZE($I,"TYPTERM")'="PT-100G" G HIS
 D ^%DLAFMI2("ETOILE",GL)
 Q
 
CAM 
 I ^TOZE($I,"TYPTERM")'="PT-100G" G HIS
 D ^%DLAFMI2("CAMEMBERT",GL)
 Q
 
CONS(NL,GL) 
 N ADR,ART,CPT,L,LIEN,NBR,REP,VAL
 S REP=$$LAN^%DLCON2
 S LIEN=$$LIEN1^%QSGEL2(REP,$$ART^%DLCON2,3)
 S ADR=$$ADRLIS^%QSGEST7(NL)
 K @(GL)
 S CPT=0,L=""
 F NBR=0:1 S L=$O(@ADR@(L)) Q:L=""  D INS
 S @GL=NBR
 Q
INS 
 S ART=$$^%QSCALVA(REP,L,LIEN)
 S VAL=$$^%QSCALVA($$ART^%DLCON2,ART,ATR) Q:VAL=""
 D CH(VAL,.CPT)
 S CH=$S($D(@GL@(CPT)):@GL@(CPT),1:0)+1
 S @GL@(CPT)=CH,@GL@(CPT,"TEXT")=VAL
 Q
CH(V,N) 
 N %C,C,ST
 S C="",ST=0
 F %C=0:0 S C=$O(@GL@(C)) Q:C=""  I @GL@(C,"TEXT")=V S ST=1 Q
 I ST=1 S N=C Q
 S N=N+1 Q
 
ATRSOR() 
 N ATD,ATR,CTR,EX
 S ATD=$S($D(^[QUI]RQSGLO("JALON","ATTRIBUT.REPARTITION")):^[QUI]RQSGLO("JALON","ATTRIBUT.REPARTITION"),1:"")
ATR S DX=0,DY=10 D CLEBAS^%VVIDEO
 X XY D LIRE2^%VREAD($$^%QZCHW("Attribut de repartition")_" : ",ATD,8,RM-4,DY+1,DY-1,"","",.CTR,.ATR)
 I CTR'="" Q ""
 I ATR="" S ATR=ATD Q:ATR="" "" G SOR
 S EX=$$LEX^%LXSTOCK(ATR,.ATR)
 I EX=1 G SOR
 I EX=0 D ^%VZEAVT($$^%QZCHW("Attribut inconnu"))
 I EX=2 D ^%VZEAVT($$^%QZCHW("Attribut ambigu"))
 G ATR
SOR S ^[QUI]RQSGLO("JALON","ATTRIBUT.REPARTITION")=ATR
 Q ATR
 
CRLI(NL,DD,DF) 
 
 N ATT,CARD,DATD,DATF,L,OR,REPL,V
 S REPL=$$LAN^%DLCON2
 S NL=$$NOM^%QSGES11("TMP")
 D MSG^%VZEATT($$^%QZCHW("Creation de la liste")_" "_NL)
 D CRETYP^%QSGES11(REPL,NL,"TMP",0,"JALONNEMENT",$$STO^%QSGES11(NL),$$^%QZCHW("LISTE.DE.LANCEMENTS.LANCES"),"INDIVIDU",$$STOTRI^%QSGES11)
 
 S:DD'="" DATD=DD
 I DF="" S DATF=""
 S:DF'="" DATF=$$10^%QMDATE1(DF)
 
 S ATT=$$DELNEC^%DLCON2
 I DD="" S V=DD G CRV
 S V=DATD
 I $$FINT^%QMDAUC(REPL,ATT,.V)=0 Q
 I '($$VAR^%QSGE5(REPL,ATT,V)) G CRV
 S OR="" G CRO
CRV S V=$$NXTRAV^%QSTRUC8(REPL,ATT,V) I V="" G FCR
 I DATF'="",V>DATF G FCR
 S OR=""
CRO S OR=$$NXTRAVO^%QSTRUC8(REPL,ATT,V,OR) I OR="" G CRV
 S L=""
CRI S L=$$NXTRAVOI^%QSTRUC8(REPL,ATT,V,OR,L) I L="" G CRO
 
 I $$^%QSCALVA(REPL,L,$$LIEN1^%QSGEL2(REPL,$$ART^%DLCON2,3))="" G CRI
 D STOCK^%QSGES11(NL,L)
 G CRI
FCR D CARDL^%QSGES11(NL,.CARD)
 Q
 
 
EXT(ETU,NL) 
 N ATR,TYP
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("MIX sur l'etude")_" "_ETU,0)
 S ATR=$$ATRSOR
 I ATR="" Q
 S TYP="E"
 G VISU

