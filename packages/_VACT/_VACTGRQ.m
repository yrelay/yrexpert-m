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

;%VACTGRQ^INT^1^59547,74033^0
VVACTGRQ(SCR,RESUL) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N %AJM,%LIXD,%LIXG,%LIYB,%LIYH,%U,%V,ADX,ADY,CMS,CTRLF,DEJALU,DEP
 N ECR,FRESU,IC,ICC,LIB,LXD,LXG,MOD,NOMTAB,PATOUCH,PCX,PXY
 N REFUSE,SCR1,STOPUC,TAB,UCONT
 D CLEPAG^%VVIDEO
DEB 
 S %V=^%SCRE(SCR),NOMTAB="",(ABENDSCR,CMS)=0
 F %U=1:1:%V S:'($D(RESUL(%U))) RESUL(%U)="" S PATOUCH(%U)="" I $D(^%SCRE(SCR,%U,"PATOUCH")),^%SCRE(SCR,%U,"PATOUCH")=1 S PATOUCH(%U)=1
 D ^%VAFIGRI,^%VAFISCR,^%VMODISC Q:ABENDSCR=1
 D ^%QSSTOC Q
 
AFF(SCR,RESUL) 
 N %AJM,%LIXD,%LIXG,%LIYB,%LIYH,%U,%V,ADX,ADY,CMS,CTRLF,DEJALU,DEP
 N ECR,FRESU,IC,ICC,LIB,LXD,LXG,MOD,NOMTAB,PATOUCH,PCX,PXY
 N REFUSE,SCR1,STOPUC,TAB,UCONT
 G DEB
 
 
 
 
 
 
AFF1(SCR,RESUL,ABENDSCR) 
 N CMS,NOMTAB,TEST
 N %AJM,%A,%B,%DIFL,%IGR,%LIXD,%LIXG,%LIYB,%LIYH,%MC,%U,%V,%VINV
 N %W,%X,%Y,ADX,ADY,AFF,A,AX,AY,C,CH,CP,CTRLA,CTRLB,CTRLC,CTRLD,CTRLE
 N CTRLF,CTRLG,CTRLH,CTRLI,CTRLJ,CTRLK
 N D,DEP,ECR,ESCMV,IC,ICC,I,IK,IL,IV,LGC,LIB,LL,LPG,LXD,LXG,MOD
 N NVLEG,ODX,ODY,PCX,PCY,PD,PG,PL,PS,PX,PY,REFUSE,REP,REVID,SCR1,STOPUC
 N TAB,TBMOV,I,TREETUD,UCONT,UYI,VID,VLEG,Z,UYT,XX,Y1,YY
 N T1,T2,T3,T4,T5,T6,T7,T8
 S %V=^%SCRE(SCR),NOMTAB="",(ABENDSCR,CMS)=0
 F %U=1:1:%V S:'($D(RESUL(%U))) RESUL(%U)="" S PATOUCH(%U)="" I $D(^%SCRE(SCR,%U,"PATOUCH")),^%SCRE(SCR,%U,"PATOUCH")=1 S PATOUCH(%U)=1
 D ^%VAFIGRI,^%VAFISCR,^%VMODISC
 S ABENDSCR=$S(ABENDSCR:"A",1:"")
 Q
 
 
AFFICH(SCR,RESUL) 
 N %AJM,%LIXD,%LIXG,%LIYB,%LIYH,%U,%V,ADX,ADY,CMS,CTRLF,DEJALU,DEP
 N ECR,FRESU,IC,ICC,LIB,LXD,LXG,MOD,NOMTAB,PATOUCH,PCX,PXY
 N REFUSE,SCR1,STOPUC,TAB,UCONT
 D ^%VAFIGRI
 D ^%VAFISCR
 Q
 ;
