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

;%PSDKB21^INT^1^59547,73874^0
%PSDKB21 ;;10:43 AM  10 Jun 1992; ; 07 Jun 93  5:01 PM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
CALDIFF(A,B,D,TEMP) 
 N REP,IND,PRD,T,V,O,%T,%O,CXT,GRES
 D DEB^%SGMESU("ecart au but")
 S REP=@A@("REP"),IND=@A@("IND"),PRD=@B
 D SX^%QSGESTK("%",$J)
 S T="" F %T=0:0 S T=$O(@A@("%",T)) Q:T=""  S O="" F %O=0:0 S O=$O(@A@("%",T,O)) Q:O=""  S V=@A@("%",T,O) D PA^%QSGESTI("%",$J,T,V,O)
 S T="" F %T=0:0 S T=$O(@A@("CXTPCT",T)) Q:T=""  S O="" F %O=0:0 S O=$O(@A@("CXTPCT",T,O)) Q:O=""  S V=@A@("CXTPCT",T,O),CXT(T,O)=V
 S @D=1-$$EVAL2^%PSPREV(PRD,REP,IND,"GRES")
 S O="" F %O=1:1 S O=$O(GRES(O)) Q:O=""  S @D@(%O)=GRES(O)
 S @D@("TAUX")=GRES
 S @D@("PRED")=PRD
 D FIN^%SGMESU("ecart au but")
 Q
 
 
 
 
 
 
 
 
 
NODIFF(D,TEMP) N L S L=@D Q L=0
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
TROPLOIN(DI,DJ,ISTP,TEMP) Q 0
 
 
 
 
 
 
 
 
 
MKENSOP(D,E,TEMP) 
 D DEB^%SGMESU("ensemble et tri des operateurs")
 N I,J,%I,%J,OPE,TOT,TAB,REP,DOM,PRED,TBTEMP
 S TBTEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TBT") K @(TBTEMP)
 S DOM=@TEMP@("DEF","DOM")
 S PRED=@D@("PRED")
 
 S OPE="" F TOT=1:1 S OPE=$O(@TEMP@("SPD","OPE",OPE)) Q:OPE=""  I $$VALID(OPE) S @TBTEMP@("NOG",OPE)=0
 I '($D(^[QUI]RQSGLO("GPS","RED",DOM,PRED))) G MKTRI
 
 F I=1:1 Q:'($D(@D@(I)))  I '(@D@(I)) F J=2:1 S OPE=$P(^[QUI]RQSGLO("GPS","RED",DOM,PRED,I),"^",J) Q:OPE=""  I $D(@TBTEMP@("NOG",OPE)) S @TBTEMP@("NOG",OPE)=(@TBTEMP@("NOG",OPE)+150)-J
 
MKTRI S OPE="" F J=0:0 S OPE=$O(@TBTEMP@("NOG",OPE)) Q:OPE=""  S @TBTEMP@("NOG",OPE)=@TBTEMP@("NOG",OPE)+$$^%QSCALIN("OPERATEUR",DOM_","_OPE,"BONUS.UTILISATEUR",1)
 S OPE="" F J=0:0 S OPE=$O(@TBTEMP@("NOG",OPE)) Q:OPE=""  S @TBTEMP@("ORD",@TBTEMP@("NOG",OPE),OPE)=""
 
 S I="",J=0 F %I=0:0 S I=$ZP(@TBTEMP@("ORD",I)) Q:I=""  S OPE="" F %J=0:0 S OPE=$O(@TBTEMP@("ORD",I,OPE)) Q:OPE=""  S J=J+1,@E@(J)=DOM_"^"_OPE
 S @E=J
 K @(TBTEMP)
 D FIN^%SGMESU("ensemble et tri des operateurs")
 Q
 
VALID(OPE) 
 N IP,%IP,OPAP
 Q:'($$AIR^%QSGE5("OPERATEUR",DOM_","_OPE,"NE.PEUT.SUIVRE")) 1
 F IP=1:1:IPIL-1 S OPAP=@PILE@(IP,"OP") G:$$VAIR^%QSGE5("OPERATEUR",DOM_","_OPE,"NE.PEUT.SUIVRE",DOM_","_$P(OPAP,"^",2)) NOVALID
 Q 1
NOVALID Q 0
 ;

