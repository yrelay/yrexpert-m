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

;%QULELA1^INT^1^59579,36686^0
%QULELA1(NUMET,DEFETU,RFR) ;;10:26 AM  6 Oct 1992; ; 09 Oct 92 11:44 AM
 
 
 
 N TPX,DEJAFAIT,PILE,TABUTI
 N REPE,REP,LIEN,DIAL,CONFIG,EMPIL,GLOCONF,NREP,NLIEN
 N RAC,TEMP,GRAP,GRAC,UCONT,TGR,CONF,TRANSL,LARA,TITRE
 N GLOET,CARETU
 S TPX=$$TEMP^%SGUTIL K @(TPX)
 S DEJAFAIT=$$CONCAS^%QZCHAD(TPX,"T"),PILE=$$CONCAS^%QZCHAD(TPX,"P")
 S TABUTI=$$CONCAS^%QZCHAD(TPX,"U")
 
 S EMPIL=0
 
 I NUMET'="" S DEFETU=$$DEFETU^%QULELAE(NUMET) D:RFR SETETAT^%QULELAE(NUMET,1) G INI
 I DEFETU="" S DEFETU=$$^%QULELA2("") G:DEFETU="" FTOT
 
RUN S NUMET=$$NOUVET^%QULELAE(DEFETU)
 
 D SETETAT^%QULELAE(NUMET,0)
 
INI S CARETU=$$GLOCAR^%QULELAE(NUMET) D GETADR
 S EMPIL=EMPIL+1
 S @PILE@(EMPIL,"N")=NUMET
 S @DEJAFAIT@(NUMET)=DEFETU
 I $$GETETAT^%QULELAE(NUMET)>0 G APLOAD
 I $$LOAD^%QULELA3(DEFETU)'="" G FTOT
 D SETETAT^%QULELAE(NUMET,1)
APLOAD S @PILE@(EMPIL,"C")=CARETU,@PILE@(EMPIL,"D")=NUMET
 
EDITE 
 D CLEPAG^%VVIDEO,^%VZEATT
 
 S REP=@CAR@("REP"),LISTEATT=@CAR@("LIEN"),LISTE=@CAR@("LISTE")
 I $$GETETAT^%QULELAE(NUMET)>1 G APMKGRA
 D MAKEGRA^%QULELAM
 D MAKEUC,OFF^%VZEATT
 
APMKGRA I $$GETETAT^%QULELAE(NUMET)'<2 S ADREXE=$$GLOEXEC^%QULELAE(NUMET) G APMKSTR
 S @CAR@("PORT")=$I
 S RESSTR=$$INIT^%QULELV(GRAP,GRAC,@CAR@("LARA"),3,UCONT,@CAR@("TITRE")_NUMET,NUMET)
 S ADREXE=$$GLOEXEC^%QULELAE(NUMET)
 D COPY^%QCAGLC(RESSTR,ADREXE)
 K @(RESSTR)
 S @RESUL@("P")="",@RESUL@("O")=$O(@GRAC@(""))
 D SETETAT^%QULELAE(NUMET,2)
APMKSTR 
 S @PILE@(EMPIL,"S")=ADREXE
SUITE 
 D NEWVERS^%QULELV(ADREXE,NUMET)
 S @CAR@("PORT")=$I
 D RUN^%QULELV1(ADREXE,@RESUL@("O"),@RESUL@("P"),1,RFR,RESUL) S RFR=0
 G:'($D(@RESUL@("NUMUC"))) SUITE
 I @RESUL@("NUMUC")'=6 G STOP2
 
 S NREP=@TRANSL@(@RESUL@("O")),NOBJ=$P(NREP,$C(0),2),NREP=$P(NREP,$C(0))
 S VALDEF=$$NOMLOG^%QSF(NREP)_$C(0)_$C(0)_NOBJ_$C(0)_$C(0)
 
 S DEFETU=$$^%QULELA2(VALDEF) G:DEFETU="" SUITE
 K @(TABUTI) I $$EXIETU^%QULELAE(DEFETU,TABUTI) S NUMET="" F %I=0:0 S NUMET=$O(@TABUTI@(NUMET)) Q:NUMET=""  I $$CONFIRM^%PKUTIL(2,14,60,"reprise de "_NUMET_" ?") G INI
 G RUN
 
STOP2 I @RESUL@("NUMUC")'="CTRLA" G STOP3
 
 
 I EMPIL=1 G FTOT
 
 S EMPIL=EMPIL-1
 S NUMET=@PILE@(EMPIL,"N")
 S CARETU=@PILE@(EMPIL,"C") D GETADR
 S ADREXE=@PILE@(EMPIL,"S")
 G SUITE
 
 
STOP3 I @RESUL@("NUMUC")'=3 G STOP4
 S NUMETN=$$CHOIX^%QULELAF G:NUMETN="" SUITE
 S NUMET=NUMETN
 S DEFETU=$$DEFETU^%QULELAE(NUMET)
 S RFR=0 I $$CONFIRM^%PKUTIL(2,14,60,$$^%QZCHW("rafraichissement de l'affichage ?")) S RFR=1
 G INI
 
 
STOP4 I @RESUL@("NUMUC")'=7 G STOP5
FTOT K @(TPX)
 Q
 
STOP5 G SUITE
 
GETADR S GRAP=$$CONCAS^%QZCHAD(CARETU,"G"),UCONT=$$CONCAS^%QZCHAD(CARETU,"U")
 S CONF=$$CONCAS^%QZCHAD(CARETU,"C"),TRANSL=$$CONCAS^%QZCHAD(CARETU,"T")
 S RESUL=$$CONCAS^%QZCHAD(CARETU,"RES"),GRAC=$$CONCAS^%QZCHAD(CARETU,"R")
 S DIAL=$$CONCAS^%QZCHAD(CARETU,"GD"),GLOCONF=$$CONCAS^%QZCHAD(CARETU,"GG")
 S LISTE=$$CONCAS^%QZCHAD(CARETU,"L")
 S CAR=$$CONCAS^%QZCHAD(CARETU,"GC")
 Q
 
 
 
MAKEUC 
 N %AA
 S %AA=1 K @(UCONT)
 
 S @UCONT@("AUTRE",%AA)="CTRB^%QULELAP",@UCONT@("AUTRE",%AA,"TXT")=$$^%QZCHW("Acces individu"),@UCONT@("AUTRE",%AA,"COM")=$$^%QZCHW("Visualisation des attributs de l'individu"),@UCONT@("AUTRE",%AA,"CTR")="B",%AA=%AA+1
 
 S @UCONT@("AUTRE",%AA)="CTRV^%QULELAP",@UCONT@("AUTRE",%AA,"TXT")=$$^%QZCHW("Acces lien"),@UCONT@("AUTRE",%AA,"COM")=$$^%QZCHW("Visualisation des attributs de l'individu lien"),@UCONT@("AUTRE",%AA,"CTR")="V",%AA=%AA+1
 
 S @UCONT@("AUTRE",%AA)="INDIV^%QULELAP",@UCONT@("AUTRE",%AA,"TXT")=$$^%QZCHW("Lier"),@UCONT@("AUTRE",%AA,"COM")=$$^%QZCHW("Ajout d'une liaison a l'individu courant"),@UCONT@("AUTRE",%AA,"CTR")="I",%AA=%AA+1
 
 S @UCONT@("AUTRE",%AA)="COUPER^%QULELAP",@UCONT@("AUTRE",%AA,"TXT")=$$^%QZCHW("Delier"),@UCONT@("AUTRE",%AA,"COM")=$$^%QZCHW("Suppression de la liaison entre l'individu courant et son pere"),@UCONT@("AUTRE",%AA,"CTR")="G",%AA=%AA+1
 
 S @UCONT@("AUTRE",%AA)="TRAITER^%QULELAP",@UCONT@("AUTRE",%AA,"TXT")=$$^%QZCHW("Traiter"),@UCONT@("AUTRE",%AA,"COM")=$$^%QZCHW("Activation d'un traitement sur l'individu courant"),@UCONT@("AUTRE",%AA,"CTR")="T",%AA=%AA+1
 
 
 S @UCONT@("AUTRE",%AA)="ABAND^%QULELA1",@UCONT@("AUTRE",%AA,"TXT")=$$^%QZCHW("Editer"),@UCONT@("AUTRE",%AA,"COM")=$$^%QZCHW("Rappel de ce meme editeur sur un autre lien"),@UCONT@("AUTRE",%AA,"CTR")="E",%AA=%AA+1
 
 
 S @UCONT@("AUTRE",%AA)="ABAND^%QULELA1",@UCONT@("AUTRE",%AA,"TXT")=$$^%QZCHW("Abandon"),@UCONT@("AUTRE",%AA,"COM")=$$^%QZCHW("Fin de la session"),@UCONT@("AUTRE",%AA,"CTR")="F",%AA=%AA+1
 
 
 
 
 S @UCONT@("AFF")="$$ABRV^%QULELAN",@UCONT@("INFO")="$$INFO^%QULELAN",@UCONT@("FULL")="$$FULL^%QULELAN"
 
 
 
 Q
 
ABAND(TP) 
 S FINEXE=1 Q
 
CTRR(TP) 
 S MODG=1 Q
 ;
 ;

