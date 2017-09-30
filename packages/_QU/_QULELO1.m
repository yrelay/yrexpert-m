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
;! Nomprog     : %QULELO1(NUMET,DEFETU,RFR)                                   !
;! Module      : EDITEUR DE LIEN                                              !
;! But         : Affichage de l'editeur de lier                               !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!     NUMET : Numero d'etude                                                 !
;!     DEFETU : Global definissant l'etude                                    !
;!     RFR : Rafaichissement de l'etude                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

%QULELO1(NUMET,DEFETU,RFR) ;
 
 N TPX,DEJAFAIT,PILE,TABUTI
 N REPE,REP,LIEN,DIAL,CONFIG,EMPIL,GLOCONF,NREP,NLIEN
 N RAC,TEMP,GRAP,GRAC,UCONT,TGR,CONF,TRANSL,ORDO,LARA,TITRE
 N GLOET,CARETU
 S TPX=$$TEMP^%SGUTIL K @(TPX)
 S DEJAFAIT=$$CONCAS^%QZCHAD(TPX,"T"),PILE=$$CONCAS^%QZCHAD(TPX,"P")
 S TABUTI=$$CONCAS^%QZCHAD(TPX,"U")
 
 S EMPIL=0
 
 I NUMET'="" S DEFETU=$$DEFETU^%QULELOE(NUMET) D:RFR SETETAT^%QULELOE(NUMET,1) G INI
 I DEFETU="" S DEFETU=$$^%QULELO2("") G:DEFETU="" FTOT
 
RUN S NUMET=$$NOUVET^%QULELOE(DEFETU)
 
 D SETETAT^%QULELOE(NUMET,0)
 
INI S CARETU=$$GLOCAR^%QULELOE(NUMET) D GETADR
 S EMPIL=EMPIL+1
 S @PILE@(EMPIL,"N")=NUMET
 S @DEJAFAIT@(NUMET)=DEFETU
 I $$GETETAT^%QULELOE(NUMET)>0 G APLOAD
 I $$LOAD^%QULELO3(DEFETU)'="" G FTOT
 D SETETAT^%QULELOE(NUMET,1)
APLOAD S @PILE@(EMPIL,"C")=CARETU,@PILE@(EMPIL,"D")=NUMET
 
EDITE 
 D CLEPAG^%VVIDEO,^%VZEATT
 
 S REP=@CAR@("REP"),LIEN=@CAR@("LIEN"),ORDO=@CAR@("ORDO")
 I $$GETETAT^%QULELOE(NUMET)>1 G APMKGRA
 D MAKEGRA^%QULELOM
 D MAKEUC,OFF^%VZEATT
 
APMKGRA I $$GETETAT^%QULELOE(NUMET)'<2 S ADREXE=$$GLOEXEC^%QULELOE(NUMET) G APMKSTR
 S @CAR@("PORT")=$I
 S RESSTR=$$INIT^%QULELV(GRAP,GRAC,@CAR@("LARA"),3,UCONT,@CAR@("TITRE")_NUMET,NUMET)
 S ADREXE=$$GLOEXEC^%QULELOE(NUMET)
 D COPY^%QCAGLC(RESSTR,ADREXE)
 K @(RESSTR)
 S @RESUL@("P")="",@RESUL@("O")=$O(@GRAC@(""))
 D SETETAT^%QULELOE(NUMET,2)
APMKSTR 
 S @PILE@(EMPIL,"S")=ADREXE
SUITE 
 D NEWVERS^%QULELV(ADREXE,NUMET)
 S @CAR@("PORT")=$I
 D RUN^%QULELV1(ADREXE,@RESUL@("O"),@RESUL@("P"),1,RFR,RESUL) S RFR=0
 G:'($D(@RESUL@("NUMUC"))) SUITE
 I @RESUL@("NUMUC")'=2 G STOP2
 
 S NREP=$$REPINT(@RESUL@("N"))
 K @(TABUTI) D LIEN^%QSGEST9(NREP,TABUTI) S NLIEN=$$UN^%PKCHOIX(TABUTI,10,12,8) G:NLIEN="" SUITE
 S VALDEF=$$NOMLOG^%QSF(NREP)_$C(0)_NLIEN_$C(0)_@RESUL@("O")_$C(0)_$C(0)
 
 S DEFETU=$$^%QULELO2(VALDEF) G:DEFETU="" SUITE
 K @(TABUTI) I $$EXIETU^%QULELOE(DEFETU,TABUTI) S NUMET="" F %I=0:0 S NUMET=$O(@TABUTI@(NUMET)) Q:NUMET=""  I $$CONFIRM^%PKUTIL(2,14,60,"reprise de "_NUMET_" ?") G INI
 G RUN
 
 
STOP2 I @RESUL@("NUMUC")'="CTRLA" G STOP3
 I EMPIL=1 G FTOT
 
 S EMPIL=EMPIL-1
 S NUMET=@PILE@(EMPIL,"N")
 S CARETU=@PILE@(EMPIL,"C") D GETADR
 S ADREXE=@PILE@(EMPIL,"S")
 G SUITE
 
 
STOP3 I @RESUL@("NUMUC")'=3 G STOP4
 S NUMETN=$$CHOIX^%QULELOF G:NUMETN="" SUITE
 S NUMET=NUMETN
 S DEFETU=$$DEFETU^%QULELOE(NUMET)
 S RFR=0 I $$CONFIRM^%PKUTIL(2,14,60,$$^%QZCHW("rafraichissement de l'affichage ?")) S RFR=1
 G INI
 
 
STOP4 I @RESUL@("NUMUC")'=4 G STOP5
FTOT K @(TPX)
 Q
 
STOP5 G SUITE
 
GETADR S GRAP=$$CONCAS^%QZCHAD(CARETU,"G"),UCONT=$$CONCAS^%QZCHAD(CARETU,"U")
 S CONF=$$CONCAS^%QZCHAD(CARETU,"C"),TRANSL=$$CONCAS^%QZCHAD(CARETU,"T")
 S RESUL=$$CONCAS^%QZCHAD(CARETU,"RES"),GRAC=$$CONCAS^%QZCHAD(CARETU,"R")
 S DIAL=$$CONCAS^%QZCHAD(CARETU,"GD"),GLOCONF=$$CONCAS^%QZCHAD(CARETU,"GG")
 S CAR=$$CONCAS^%QZCHAD(CARETU,"GC")
 Q
 
 
 
MAKEUC
 N %AA
 S %AA=1 K @(UCONT)
 S @UCONT@("AUTRE",%AA)="TRAITER^%QULELOP",@UCONT@("AUTRE",%AA,"TXT")=$$^%QZCHW("Traiter"),@UCONT@("AUTRE",%AA,"COM")=$$^%QZCHW("Activation d'un traitement sur l'individu courant"),@UCONT@("AUTRE",%AA,"CTR")="T",%AA=%AA+1
 S @UCONT@("AUTRE",%AA)="ABAND^%QULELO1",@UCONT@("AUTRE",%AA,"TXT")=$$^%QZCHW("Editer"),@UCONT@("AUTRE",%AA,"COM")=$$^%QZCHW("Rappel de ce meme editeur sur un autre lien"),@UCONT@("AUTRE",%AA,"CTR")="E",%AA=%AA+1
 S @UCONT@("AUTRE",%AA)="ABAND^%QULELO1",@UCONT@("AUTRE",%AA,"TXT")=$$^%QZCHW("Etude"),@UCONT@("AUTRE",%AA,"COM")=$$^%QZCHW("Rappel d'une etude"),%AA=%AA+1
 S @UCONT@("AUTRE",%AA)="ABAND^%QULELO1",@UCONT@("AUTRE",%AA,"TXT")=$$^%QZCHW("Abandon"),@UCONT@("AUTRE",%AA,"COM")=$$^%QZCHW("Fin de la session"),@UCONT@("AUTRE",%AA,"CTR")="F",%AA=%AA+1
 
 S @UCONT@("AUTRE",%AA)="CTRB^%QULELOP",@UCONT@("AUTRE",%AA,"TXT")=$$^%QZCHW("Acces individu"),@UCONT@("AUTRE",%AA,"COM")=$$^%QZCHW("Visualisation des attributs de l'individu"),@UCONT@("AUTRE",%AA,"CTR")="B",%AA=%AA+1
 
 S @UCONT@("AUTRE",%AA)="CTRR^%QULELO1",@UCONT@("AUTRE",%AA,"TXT")=$$^%QZCHW("Rafraichir"),@UCONT@("AUTRE",%AA,"COM")=$$^%QZCHW("Recalculer et reafficher le graphe"),@UCONT@("AUTRE",%AA,"CTR")="R",%AA=%AA+1
 
 S:$$QUAL^%QSGEL2(REP,LIEN) @UCONT@("AUTRE",%AA)="CTRV^%QULELOP",@UCONT@("AUTRE",%AA,"TXT")=$$^%QZCHW("Acces lien"),@UCONT@("AUTRE",%AA,"COM")=$$^%QZCHW("Visualisation des attributs de l'individu lien"),@UCONT@("AUTRE",%AA,"CTR")="V",%AA=%AA+1
 S:$$TYPEL^%QSGES90(LIEN)'<3 @UCONT@("AUTRE",%AA)="INDIV^%QULELOP",@UCONT@("AUTRE",%AA,"TXT")=$$^%QZCHW("Lier"),@UCONT@("AUTRE",%AA,"COM")=$$^%QZCHW("Ajout d'une liaison a l'individu courant"),@UCONT@("AUTRE",%AA,"CTR")="I",%AA=%AA+1
 S @UCONT@("AFF")="$$ABRV^%QULELON",@UCONT@("INFO")="$$INFO^%QULELON",@UCONT@("FULL")="$$FULL^%QULELON"
 S:$$TYPEL^%QSGES90(LIEN)'<3 @UCONT@("CUT")="CUT^%QULELOP"
 S:$$TYPEL^%QSGES90(LIEN)'<3 @UCONT@("PASTE")="PASTE^%QULELOP"
 S @UCONT@("GOTO")="$$GOTO^%QULELON"
 S @UCONT@("GOTO","TXT")=$$^%QZCHW("Localiser")
 S @UCONT@("GOTO","COM")=$$^%QZCHW("Localiser un element du graphe et se postionner dessus")
 I $D(@CONF@("POIDS")) S @UCONT@("TRI")="$$POIDS^%QULELON"
 Q
 
ABAND(TP) 
 S FINEXE=1 Q
 
CTRR(TP) 
 S MODG=1 Q
 
REPINT(NIV) 
 N REP,LIEN
 S REP=@CAR@("REP")
 Q:NIV=1 REP S LIEN=@CAR@("LIEN") Q:$$TYPEL^%QSGES90(LIEN)>3 REP Q $$REPD^%QSGEL2(REP,LIEN)
 ;

