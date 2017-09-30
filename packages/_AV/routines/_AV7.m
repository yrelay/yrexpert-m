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

;%AV7^INT^1^59547,73867^0
%AV7 ;;10:07 AM  28 Oct 1993;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
REGLE(GLOROUT,GLOREG,EVAL,EXPR,GEVAL,GEXPR) 
 N ENSPOLO,DEJAEXP
 I EVAL=2 S SSEVAL=$$CONCAS^%QZCHAD(GEVAL,"C"),@SSEVAL=0
 
 S DEROUT=0
 S DEJAEXP=$$TEMP^%SGUTIL
 S TABTXT=$$TEMP^%SGUTIL
 S ENSPOLO=$$CONCAS^%QZCHAD(GLOREG,"POLC")
 I EXPR S SSEXPR=$$CONCAS^%QZCHAD(GEXPR,"EXPC"),@SSEXPR=0
 G:$D(@ENSPOLO)<10 ACTI
 S @DEJAEXP@(0,"VV")=1,@DEJAEXP@(0,"RR")=""
 S III=0
BCC S III=III+1 G:'($D(@ENSPOLO@(III))) BCCF
 W /C(10,0),/AB,"expression ",III,/AA
 D UNEXP^%AV8D($$CONCAT^%QZCHAD(ENSPOLO,III),.VV,.RR,.TXT)
 Q:DEROUT
 S @DEJAEXP@(III,"VV")=VV,@DEJAEXP@(III,"RR")=RR,@DEJAEXP@(III,"TXT")=TXT
 G BCC
BCCF K @(DEJAEXP)
 W !,"resultat de la condition : ",VV
 I EVAL G:'(VV) FREG
ACTI S ENSPOLO=$$CONCAS^%QZCHAD(GLOREG,"POLA")
 I EVAL=2 S SSEVAL=$$CONCAS^%QZCHAD(GEVAL,"A"),@SSEVAL=0
 I EXPR S SSEXPR=$$CONCAS^%QZCHAD(GEXPR,"EXPA"),@SSEXPR=0
 S @DEJAEXP@(0,"VV")=1,@DEJAEXP@(0,"RR")=""
 S III=0
BCA S III=III+1 G:'($D(@ENSPOLO@(III))) BCAF
 W /C(10,0),/AB,"expression ",III,/AA
 D UNEXP^%AV8D($$CONCAT^%QZCHAD(ENSPOLO,III),.VV,.RR,.TXT)
 Q:DEROUT
 S @DEJAEXP@(III,"VV")=VV,@DEJAEXP@(III,"RR")=RR,@DEJAEXP@(III,"TXT")=TXT
 G BCA
BCAF W !,"resultat de l'action : ",VV
 K @(DEJAEXP)
FREG Q
 
AJEXPR(TXT,TYPE) S @SSEXPR=@SSEXPR+1,@SSEXPR@(@SSEXPR)=TXT,@SSEXPR@(@SSEXPR,"TYPE")=TYPE Q
 
AJEVAL(DESC,VAL) S @SSEVAL=@SSEVAL+1,@SSEVAL@(@SSEVAL)=DESC,@SSEVAL@(@SSEVAL,"VAL")=VAL Q
 
 
 
TEST D CLEPAG^%VVIDEO
 D DKBMS("^TEST",1,0) Q
 
DKBMS(GLOREG,EVAL,SSEXPR) 
 S GLOROUT=$$TEMP^%SGUTIL
 S @GLOROUT@("ACCES BASE")="$$qscalin^%AV7"
 S @GLOROUT@("INDIVIDU COURANT")="tcour^%AV7"
 S @GLOROUT@("PROXIMITE")="prox^%AV7"
 S @GLOROUT@("ECRITURE BASE")="$$affect^%AV7"
 S @GLOROUT@("VERBES SPECIAUX")="$$ADRVRB^%AV7"
 K:EVAL>1 ^TEST1 K:SSEXPR ^TEST2
 D REGLE(GLOROUT,GLOREG,EVAL,SSEXPR,"^TEST1","^TEST2")
 Q
 
qscalin(REP,IND,ATT,ORD) Q:$E(ATT)="%" $$^%QSCALIN("%",$J,ATT,ORD) Q $$^%QSCALIN(REP,IND,ATT,ORD)
prox(VPCT,REP,IND) S REP=CXT(VPCT,"BASE"),IND=CXT(VPCT,"OBJET") Q
tcour(REP,IND) S REP=CXT("@","BASE"),IND=CXT("@","OBJET") Q
affect(ADRESSE,VALEUR) 
 N REP,IND,ATT,ORD
 S REP=$P(ADRESSE,$C(0)),IND=$P(ADRESSE,$C(0),2),ATT=$P(ADRESSE,$C(0),3),ORD=$P(ADRESSE,$C(0),4)
 S:$E(ATT)="%" REP="%",IND=$J
 Q $$AFF^%TLOPT(REP,IND,ATT,ORD,VALEUR)
 
 
ADRVRB(VERBE) 
 Q:VERBE="$ALLER.A" "$$ALLER^%AV7" Q:VERBE="$ADRESSE" "$$ADRESSE^%AV7" Q:VERBE="$FIN" "$$FIN^%AV7" Q:VERBE="$TRAITER" "$$TRAITER^%AV7" Q:VERBE="$TRAITERL" "$$TRAITERL^%AV7" Q:VERBE="$ITERER" "$$ITERER^%AV7" Q:VERBE="$ETIQUETTE" "$$ETIQ^%AV7"
 Q ""
ALLER(IDEB,NBREG) S DEROUT=1,NOUVADR=V(IDEB),SVGDE=0 Q 1
ADRESSE(IDEB,NBREG) Q 1
FIN(IDEB,NBREG) S DEROUT=3,SVGDE=0 Q 1
ITERER(IDEB,NBREG) 
 D ITERER^%AMREXDK(V(IDEB),V(IDEB+5),V(IDEB+6),V(IDEB+10),V(IDEB+12),V(IDEB+13),V(IDEB+15))
 Q 1
ETIQ(IDEB,NBREG) Q 1
TRAITER(IDEB,NBREG) D EXECTRT^%AMREXDK(V(IDEB),V(IDEB+1),V(IDEB+2)) Q 1
TRAITERL(IDEB,NBREG) D TRAITERL^%AMREXDK(V(IDEB),V(IDEB+1)) Q 1

