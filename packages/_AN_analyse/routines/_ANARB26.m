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

;%ANARB26^INT^1^59547,73866^0
%ANARB26 ;;03:20 PM  19 Mar 1992; ; 06 Apr 93  2:57 PM
 
 
 
 
 
CHOISIR 
 K @(TEMPO) S @TEMPO@(1)="LIST",@TEMPO@(2)="ATTIL"
 S @TEMPO@(3)="NBPAR",@TEMPO@(4)="%SCPR",@TEMPO@(5)="PREMIS"
 S @TEMPO@(6)="SA",@TEMPO@(7)="TITRE",@TEMPO@(8)="TYPCHX"
 S @TEMPO@(9)="NOMLR",@TEMPO@(10)="POSX",@TEMPO@(19)="POSY"
 D EMPV^%ANGEPIL(TEMPO)
 
 S SA=A,A=$$RED(SA,1) D EMPIL^%ANGEPIL("CHX1^%ANARB26") G INT^%ANARBR2
CHX1 I (VAL="")!(POS=0) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible identifier le nom de la liste")) S VAL="",POS=0 G ERR
 I '($$IR^%QSGEST5("L0",VAL)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Liste inconnue")) S VAL="",POS=0 G ERR
 S LIST=VAL
 S A=$$RED(SA,2) D EMPIL^%ANGEPIL("CHX2^%ANARB26") G INT^%ANARBR2
CHX2 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible identifier l'attribut illustrateur")) S VAL="",POS=0 G ERR
 S ATTIL=VAL
 S A=$$RED(SA,3) D EMPIL^%ANGEPIL("CHX3^%ANARB26") G INT^%ANARBR2
CHX3 I (VAL="")!(POS=0) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible identifier le type de choix")) G ERR
 I ((VAL'=0)&(VAL'=1))&(VAL'=2) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Type de choix invalide")) G ERR
 S TYPCHX=VAL
 S A=$$RED(SA,4) D EMPIL^%ANGEPIL("CHX4^%ANARB26") G INT^%ANARBR2
CHX4 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible identifier la premiere coordonnee")) G ERR
 S POSX=$S(VAL="":10,1:VAL)
 S A=$$RED(SA,5) D EMPIL^%ANGEPIL("CHX5^%ANARB26") G INT^%ANARBR2
CHX5 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible identifier la deuxieme coordonnee")) G ERR
 S POSY=$S(VAL="":10,1:VAL)
 S A=$$RED(SA,6) D EMPIL^%ANGEPIL("CHX6^%ANARB26") G INT^%ANARBR2
CHX6 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible identifier le titre")) G ERR
 S TITRE=VAL
 D SAUVECR^%TLUTIL
 S VAL=$$CHOIX(LIST,TYPCHX,ATTIL,TITRE,POSX,POSY)
 D:TYPCHX'=0 CLEPAG^%VVIDEO
 D RESTECR^%TLUTIL
 D DEPV^%ANGEPIL
 G DEPIL^%ANGEPIL
 
ERR S VAL="",POS=0 D DEPV^%ANGEPIL G DEPIL^%ANGEPIL
 
 
 
CHOIX(LIST,TYPCHX,IATTIL,TITRE,POSX,POSY) 
 N NOMLR,BASLIS,TEMPCHX,STO,REPLIS,TABUCO,ATTIL,INDI,%IND
 S TEMPCHX=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"CHX") K @(TEMPCHX)
 S STO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"STO") K @(STO)
 S TABUCO=$$CONCAS^%QZCHAD(STO,"UCO")
 S NOMLR=$$GEN^%QCAPOP("CHX")
 S BASLIS=$$TYP^%QSGEST7(LIST)
 S ATTIL=$S(BASLIS="VALEUR":"",1:IATTIL)
 I WHOIS("ETUDE")=0 D CRETYPV^%QSGES11($S(BASLIS="VALEUR":"",1:$$BASE^%QSGEST7(LIST)),NOMLR,"CHX","CHOIX",LIST,BASLIS)
 I WHOIS("ETUDE")'=0 D CREERL^%QS0XG1(NOMLR,$$BASE^%QSGEST7(LIST),0,"CHOIX","CHX")
 D:TYPCHX'=0 CLEPAG^%VVIDEO
 G:TYPCHX=2 NOMENC
 S (@STO,REPLIS)=$S(BASLIS="VALEUR":"",1:$$BASE^%QSGEST7(LIST))
 G:WHOIS("ETUDE")'=0 ACTIE
 S ADRLIS=$$ADRLT^%QSGEST7(LIST) G:ADRLIS'="" ACTIORD
 S ADRLIS=$$ADRLIS^%QSGEST7(LIST)
 
ACTINOR S @STO@("L")=ADRLIS
 S @TABUCO@("AFF")="$$AFF^%ANARB26"
 S @TABUCO@("FULL")="$$FULL^%ANARB26"
 S:ATTIL'="" @TABUCO@("INFO")="$$INFO^%ANARB26"
 S @TABUCO@("?")="PTING^%ANARB26"
 D ^%QULCHP(ADRLIS,TEMPCHX,TABUCO,TITRE,POSX,POSY,$S($$CARD^%QSGES11(ADRLIS)=0:0,1:5),$S(TYPCHX=0:0,1:2))
 S INDI="" F %IND=0:0 S INDI=$O(@TEMPCHX@(INDI)) Q:INDI=""  D AJOUT^%QS0XG1(NOMLR,INDI)
 G FINCHX
ACTIORD S @STO@("L")=ADRLIS
 S @TABUCO@("AFF")="$$AFFT^%ANARB26"
 S @TABUCO@("FULL")="$$FULLT^%ANARB26"
 S:ATTIL'="" @TABUCO@("INFO")="$$INFOT^%ANARB26"
 S @TABUCO@("?")="PTINGT^%ANARB26"
 D ^%QULCHP(ADRLIS,TEMPCHX,TABUCO,TITRE,POSX,POSY,$S($$CARD^%QSGES11(ADRLIS)=0:0,1:5),$S(TYPCHX=0:0,1:2))
 S INDI="" F %IND=0:0 S INDI=$O(@TEMPCHX@(INDI)) Q:INDI=""  D AJOUT^%QS0XG1(NOMLR,@ADRLIS@(INDI))
 G FINCHX
ACTIE 
 S INDI="" F %IND=1:1 S INDI=$$SUIVL^%QS0XG1(LIST,INDI) Q:INDI=""  S @STO@("L",%IND)=INDI
 S @TABUCO@("AFF")="$$AFFE^%ANARB26"
 S @TABUCO@("FULL")="$$FULLE^%ANARB26"
 S:ATTIL'="" @TABUCO@("INFO")="$$INFOE^%ANARB26"
 S @TABUCO@("?")="PTING^%ANARB26"
 D ^%QULCHP($$CONCAS^%QZCHAD(STO,"L"),TEMPCHX,TABUCO,TITRE,POSX,POSY,$S($$^%QSCALIN("L0",LIST,"CARD",1)=0:0,1:5),$S(TYPCHX=0:0,1:2))
 S INDI="" F %IND=0:0 S INDI=$O(@TEMPCHX@(INDI)) Q:INDI=""  D AJOUT^%QS0XG1(NOMLR,@STO@("L",INDI))
 G FINCHX
 
NOMENC S DEFETU=$$NOMLOG^%QSF($$BASE^%QSGEST7(LIST))_$C(0)_$C(0)_POSX_$C(0)_$C(0)_LIST_$C(0)_$C(0)_ATTIL_$C(0)_$C(0)
 D SELEC^%QULELC(DEFETU,TEMPCHX,POSY,TITRE)
 S INDI="" F %IND=0:0 S INDI=$O(@TEMPCHX@(INDI)) Q:INDI=""  D AJOUT^%QS0XG1(NOMLR,INDI)
 G FINCHX
 
FINCHX K @(STO),@(TABUCO),@(TEMPCHX)
 Q NOMLR
 
 
 
AFF(TAB) N GAG S GAG=@TAB@("O") Q GAG
FULL(TAB) N GAG S GAG=@TAB@("O") Q GAG
INFO(TAB) N STO,REP
 S STO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"STO")
 S REP=@STO Q:REP=""
 Q $$^%QSCALIN(REP,@TAB@("O"),ATTIL,1)
PTING(TAB) N REP,STO
 S STO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"STO")
 S REP=@STO Q:REP=""
 Q:'($$IR^%QSGE5(REP,@TAB@("O")))
 D MEMX^%QCAMEM,CLEPAG^%VVIDEO,^%QSATTRI(@TAB@("O"),@STO,5,2,70,18),CLEPAG^%VVIDEO,RVARX^%QCAMEM
 Q
 
AFFT(TAB) N GAG,STO,ADRLIS
 S STO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"STO")
 S ADRLIS=@STO@("L")
 S GAG=@ADRLIS@(@TAB@("O")) Q GAG
FULLT(TAB) N GAG,STO,ADRLIS
 S STO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"STO")
 S ADRLIS=@STO@("L")
 S GAG=@ADRLIS@(@TAB@("O")) Q GAG
INFOT(TAB) N STO,REP,ADRLIS
 S STO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"STO")
 S REP=@STO Q:REP=""  S ADRLIS=@STO@("L")
 Q $$^%QSCALIN(REP,@ADRLIS@(@TAB@("O")),ATTIL,1)
PTINGT(TAB) N REP,STO,ADRLIS,IDV
 S STO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"STO")
 S REP=@STO Q:REP=""  S ADRLIS=@STO@("L")
 S IDV=@ADRLIS@(@TAB@("O"))
 Q:'($$IR^%QSGE5(REP,IDV))
 D MEMX^%QCAMEM,CLEPAG^%VVIDEO,^%QSATTRI(IDV,@STO,5,2,70,18),CLEPAG^%VVIDEO,RVARX^%QCAMEM
 Q
 
AFFE(TAB) N GAG,STO,ADRLIS
 S STO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"STO")
 S GAG=@STO@("L",@TAB@("O")) Q GAG
FULLE(TAB) N GAG,STO,ADRLIS
 S STO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"STO")
 S GAG=@STO@("L",@TAB@("O")) Q GAG
INFOE(TAB) N STO,REP,ADRLIS
 S STO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"STO")
 S REP=@STO Q:REP=""
 Q $$^%QSCALIN(REP,@STO@("L",@TAB@("O")),ATTIL,1)
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

