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

;%AMREXDK^INT^1^59547,73865^0
%AMREXDK ;;05:03 PM  3 Nov 1993;
 
 
 
 
EXECTRT(TRT,REP,IND) 
 N PLAN,PLIND,GLOAN
 S GLOAN=$$CONCAS^%QZCHAD("^[QUI]RQSDON(""ANTRT"")",TRT)
 S PARCO("TRT")=TRT
 S ETUF=$$CHAINAUTO^%AMG("TRT") D INIT^%AMG(ETUF,"TRT",TRT,REP,IND,"","")
 D SET^%SGVAR("JRN",ETUF)
 S CXT("%","BASE")="%",CXT("%","OBJET")=$J
 S EXP=$$TEMP^%SGUTIL
 S:'($D(^[QUI]RQSDON("EXPLTRT"))) ^[QUI]RQSDON("EXPLTRT")=0
 S PLAN=$$TEMP^%SGUTIL,TABADR=$$TEMP^%SGUTIL,TABETQ=$$TEMP^%SGUTIL
 S PLIND=$$TEMP^%SGUTIL
 S GLOROUT=$$TEMP^%SGUTIL
 D MKPLAN,MKPLIND,MKGLOROU
 S UCIND="UCIND^%AMREXDK"
 D EXEPLAN^%AMREXPL(PLIND,PLAN,$O(@PLAN@("")),UCIND)
 D DEP^%SGVAR("JRN")
 Q
 
 
TRAITERL(TRT,LISTE) 
 N PLAN,PLIND,OLDRC,OLDIC,GLOAN
 S PARCO("TRT")=TRT
 S ETUF=$$CHAINAUTO^%AMG("TRT") D INIT^%AMG(ETUF,"TRT",TRT,REP,IND,"","")
 D SET^%SGVAR("JRN",ETUF)
 S:$D(CXT("@","BASE")) OLDRC=CXT("@","BASE")
 S:$D(CXT("@","OBJET")) OLDRC=CXT("@","OBJET")
 S EXP=$$TEMP^%SGUTIL
 S:'($D(^[QUI]RQSDON("EXPLTRT"))) ^[QUI]RQSDON("EXPLTRT")=0
 S PLAN=$$TEMP^%SGUTIL,TABADR=$$TEMP^%SGUTIL,TABETQ=$$TEMP^%SGUTIL
 S PLIND=$$TEMP^%SGUTIL
 S GLOROUT=$$TEMP^%SGUTIL
 D MKPLAN,MKPLINL,MKGLOROU
 S GLOAN=$$CONCAS^%QZCHAD("^[QUI]RQSDON(""ANTRT"")",TRT)
 S UCIND="UCIND^%AMREXDK"
 D EXEPLAN^%AMREXPL(PLIND,PLAN,$O(@PLAN@("")),UCIND)
 S:$D(OLDRC) CXT("@","BASE")=OLDRC
 S:$D(OLDIC) CXT("@","OBJET")=OLDIC
 D DEP^%SGVAR("JRN")
 Q
PLITER(VARIND,VARORD,IVARORD,LIEN,REPPAR,INDPAR,ETIQ) 
 
 N PLIND
 S ETQ=@TABETQ@(ETIQ)
 S PLIND=$$TEMP^%SGUTIL
 D MKPLILI
 D EXEPLAN^%AMREXPL(PLIND,PLAN,ETQ,"UCILI^%AMREXDK")
 Q
MKPLILI 
 S REPL=$$REPD^%QSGEL2(REPPAR,LIEN)
 S TYPL=$$TYPEL^%QSGES90(LIEN)
 S ILIEN="" F %I=1:1 S ILIEN=$$NXTRIAO^%QSTRUC8(REPPAR,INDPAR,LIEN,ILIEN) Q:ILIEN=""  S INDL=$$VALEUR^%QSTRUC8(REPPAR,INDPAR,LIEN,ILIEN) S:TYPL=2 INDL=INDPAR_","_INDL S @PLIND@(%I)=VARIND_$C(0)_REPL_$C(0)_INDL_$C(0)_VARORD_$C(0)_IVARORD_$C(0)_ILIEN
 S @PLIND=REP_$C(0)_IND
 Q
 
MKPLINL N REP,IND,%I
 S REP=$$BASE^%QSGEST7(LISTE)
 S IND="" F %I=1:1 S IND=$$SUIVL^%QS0XG1(LISTE,IND) Q:IND=""  S @PLIND@(%I)=REP_$C(0)_IND
 Q
 
MKPLIND S @PLIND@(1)=REP_$C(0)_IND Q
 
MKPLAN S IPLAN=0,REG=""
MKPL2 S REG=$O(^[QUI]TTL(TRT,2,REG)) Q:REG=""  S TXTR=^[QUI]TTL(TRT,2,REG)
 G:$E(TXTR)=":" MKPL2
 S IPLAN=IPLAN+1,@PLAN@(IPLAN)=REG
 I $E(TXTR,1,9)="$ADRESSE(" S ADR=$P($P(TXTR,"$ADRESSE(""",2),""")"),@TABADR@(ADR)=IPLAN
 I $E(TXTR,1,11)="$ETIQUETTE(" S ADR=$P($P(TXTR,"$ETIQUETTE(""",2),""")"),@TABETQ@(ADR)=IPLAN
 G MKPL2
 Q
 
UCIND S REP=$P(@PLIND@(NUMIND),$C(0)),IND=$P(@PLIND@(NUMIND),$C(0),2)
 S CXT("@","BASE")=REP,CXT("@","OBJET")=IND
 S PARCO("TRT")=TRT,PARCO("REP")=REP,PARCO("IND")=IND
 Q
UCILI N ISY,RR,II,VOR,IVOR,VALOR
 S VALOR=@PLIND@(NUMIND)
 S ISY=$P(VALOR,$C(0)),RR=$P(VALOR,$C(0),2),II=$P(VALOR,$C(0),3),VOR=$P(VALOR,$C(0),4),IVOR=$P(VALOR,$C(0),5),VALOR=$P(VALOR,$C(0),6)
 S II=$$AJCXT^%TLOPT(ISY,RR,II)
 S II=$$AFF^%TLOPT(CXT("%","BASE"),CXT("%","OBJET"),VOR,IVOR,VALOR)
 S REP=$P(@PLIND,$C(0)),IND=$P(@PLIND,$C(0),2)
 Q
 
 
 
MKGLOROU 
 S @GLOROUT@("ACCES BASE")="$$qscalin^%AMREXDK"
 S @GLOROUT@("INDIVIDU COURANT")="tcour^%AMREXDK"
 S @GLOROUT@("PROXIMITE")="prox^%AMREXDK"
 S @GLOROUT@("ECRITURE BASE")="$$affect^%AMREXDK"
 S @GLOROUT@("VERBES SPECIAUX")="$$ADRVRB^%AMREXDK"
 Q
 
 
qscalin(REP,IND,ATT,ORD) I ORD'=$C(1) Q:$E(ATT)="%" $$^%QSCALIN("%",$J,ATT,ORD) Q $$^%QSCALIN(REP,IND,ATT,ORD)
 Q:$E(ATT)="%" $$^%QSCALVA("%",$J,ATT) Q $$^%QSCALVA(REP,IND,ATT)
 
prox(VPCT,REP,IND) 
 S (REP,IND)=""
 I $E(VPCT)="%" Q:'($D(CXT(VPCT)))  S REP=CXT(VPCT,"BASE"),IND=CXT(VPCT,"OBJET") Q
 S REP=$$REPD^%QSGEL2(CXT("@","BASE"),VPCT) Q:REP=""
 S IND=$$^%QSCALVA(CXT("@","BASE"),CXT("@","OBJET"),VPCT)
 Q
tcour(REP,IND) S REP=CXT("@","BASE"),IND=CXT("@","OBJET") Q
affect(ADRESSE,VALEUR) 
 N REP,IND,ATT,ORD
 S REP=$P(ADRESSE,$C(0)),IND=$P(ADRESSE,$C(0),2),ATT=$P(ADRESSE,$C(0),3),ORD=$P(ADRESSE,$C(0),4)
 S:$E(ATT)="%" REP="%",IND=$J
 Q $$AFF^%TLOPT(REP,IND,ATT,$S(ORD=$C(1):1,1:ORD),VALEUR)
 
ADRVRB(VERBE) 
 Q:VERBE="$ALLER.A" "$$ALLER^%AMREXDK" Q:VERBE="$ADRESSE" "$$ADRESSE^%AMREXDK" Q:VERBE="$FIN" "$$FIN^%AMREXDK" Q:VERBE="$TRAITER" "$$TRAITER^%AMREXDK" Q:VERBE="$TRAITERL" "$$TRAITERL^%AMREXDK" Q:VERBE="$ITERER" "$$ITERER^%AMREXDK" Q:VERBE="$ETIQUETTE" "$$ETIQ^%AMREXDK"
 Q "$$AFAIRE^%AMREXDK"
ALLER(IDEB,NBREG) S DEROUT=1,NOUVADR=V(IDEB),SVGDE=0 Q 1
ADRESSE(IDEB,NBREG) Q 1
FIN(IDEB,NBREG) S DEROUT=3,SVGDE=0 Q 1
ITERER(IDEB,NBREG) 
 D PLITER^%AMREXDK(V(IDEB),V(IDEB+5),V(IDEB+6),V(IDEB+10),V(IDEB+12),V(IDEB+13),V(IDEB+15))
 Q 1
ETIQ(IDEB,NBREG) Q 1
TRAITER(IDEB,NBREG) D EXECTRT^%AMREXDK(V(IDEB),V(IDEB+1),V(IDEB+2)) Q 1
TRAITER(IDEB,NBREG) D TRAITERL^%AMREXDK(V(IDEB),V(IDEB+1)) Q 1
AFAIRE(IDEB,NBREG) Q 1
 
tempo S ^%RQSGLO("MOTEUR","TRT","VERBE","$ITERER","NATURE.PARAMETRE",1)="ATT"
 S ^(2)="ATT",^(3)="ATT",^(4)="EXPR"
 Q

