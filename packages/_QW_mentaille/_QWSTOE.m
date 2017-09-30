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

;%QWSTOE^INT^1^59547,73886^0
%QWSTOE ;
 
 
 
 
 
 
 
AFFECT(TYPREG,NOMREG,NOUV,REP,IND,ATT,ORD,VAL) 
 I $D(@WWSTOCK@(REP,IND,ATT,ORD)),@WWSTOCK@(REP,IND,ATT,ORD)=VAL Q 0
 D:SWITCHAF AFFI^%QWAFFI($$NOMLOG^%QSF(REP),12),AFFI^%QWAFFI(IND,14),AFFI^%QWAFFI(ATT,16),AFFI^%QWAFFI(ORD,18),AFFI^%QWAFFI(VAL,20)
 I NOUV S @WWHIST@(IH)="A^"_ISTP_"^"_(ISTP+1)_"^"_TYPREG_"^"_NOMREG,IH=IH+1 D:SWITCHAF AFFI^%QWAFFI(IH,3),AFFI^%QWAFFI(ISTP+1,5)
 S @WWSTOCK@(REP,IND,ATT,ORD)=VAL
 S @WWSTEP@(ISTP,"P",REP,IND,ATT,ORD)=VAL
 S @WWORDAT@(REP,IND,ATT,ORD,ISTP)=VAL
 Q 1
 
 
 
 
RECUSE 
 N R,I,A,O,IS,%IS,ID,%ID,TLIEN,TROUV,GLAF,%P,PAR,REPR,INDR,DOMR,TYRG,REGC,CHOIX
 S CHOIX=@WWSTEP@(ISTP,"CHOIX")
 S %P=1
 F PAR="REPR","INDR","TYRG","DOMR","REGC" S @(PAR_"=$P(SOURCE,""^"",%P)"),%P=%P+1
 S @WWHIST@(IH)="R^"_(ISTP+1)_"^"_ISTP_"^"_TYRG_"^"_REGC
 S IH=IH+1 D:SWITCHAF AFFI^%QWAFFI(IH,3),AFFI^%QWAFFI(ISTP,5)
 
 S GLAF=$$CONCAT^%QZCHAD($$CONCAT^%QZCHAD(WWSTEP,ISTP),"""P""")
 S R=""
REBCR S R=$O(@GLAF@(R)) I R="" K @(GLAF) Q
 S I=""
REBCI S I=$O(@GLAF@(R,I)) G:I="" REBCR S A=""
REBCA S A=$O(@GLAF@(R,I,A)) G:A="" REBCI S O=""
REBCO S O=$O(@GLAF@(R,I,A,O)) G:O="" REBCA
 G:A'="NOM" RECA2
 G:R'=$$ONE^%QSGEL3("LIEN") RECA2
 
 S TV=0,TLIEN=$P(I,"/")
 S IS=""
 F %IS=0:0 Q:TV  S IS=$O(@WWLSTOCK@(TLIEN,"F",IS)) Q:IS=""  S OR="" F %OR=0:0 Q:TV  S OR=$O(@WWLSTOCK@(TLIEN,"F",IS,OR)) Q:OR=""  S ID="" F %ID=0:0 Q:TV  S ID=$O(@WWLSTOCK@(TLIEN,"F",IS,OR,ID)) Q:ID=""  I @WWLSTOCK@(TLIEN,"F",IS,OR,ID)=I S TV=1
 K @WWLSTOCK@(TLIEN,"F",IS,OR,ID)
RECA2 
 S V=@WWORDAT@(R,I,A,O,ISTP)
 K @WWORDAT@(R,I,A,O,ISTP)
 K @WWSTOCK@(R,I,A,O)
 I $D(@WWORDAT@(R,I,A,O)) S V=@WWORDAT@(R,I,A,O,$ZP(@WWORDAT@(R,I,A,O,""))) G RECA3
 I $D(@WWINIT@(R,I,A,O)) S V=@WWINIT@(R,I,A,O) G RECA3
 G REBCO
RECA3 
 S @WWSTOCK@(R,I,A,O)=V
 D:SWITCHAF AFFI^%QWAFFI($$NOMLOG^%QSF(R),12),AFFI^%QWAFFI(I,14),AFFI^%QWAFFI(A,16),AFFI^%QWAFFI(O,18),AFFI^%QWAFFI(V,20)
 G REBCO

