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

;%VCREADE^INT^1^59547,74034^0
GECREADE(SC,IMPR) 
 I (IMPR=0)!(IMPR=$I) D CLEPAG^%VVIDEO,132^%VVIDEO
 K LIM,REP O IMPR U IMPR S LIM=$P($T(LIM),";;",2) F %U=1:1 S IT=$P(LIM,",",%U) Q:IT=""  I $P(IT,"/",3)'="" S REP($P(IT,"/",3))=$P(IT,"/",1)+2,LIM($P(IT,"/",1))=$P(IT,"/",2)
 W !,!,!,!,"|",$TR($J("",130)," ","-"),?131,"|",!,"|" D ZD^%QMDATE4,^%QMDAHEU S UC="Detail de "_SC_"   au "_%DAT_"  a  "_HEURE W ?66-($L(UC)\2),UC
 W ?131,"|",!,"|",$TR($J("",130)," ","-"),"|",! S IT="" F %U=1:1 S IT=$O(LIM(IT)) Q:IT=""  W ?IT,"|",LIM(IT)
 W ?131,"|",!,"|",$TR($J("",130)," ","-"),?131,"|" F CHC=1:1:^%SCRE(SC) I $D(^%SCRE(SC,CHC)) D:CHC'=1 POS K POS D CHAR(1) S IT="" F %U=1:1 S IT=$O(REP(IT)) Q:IT=""  S LI=1 D @IT
 D:$D(POS) POS W !,"|",$TR($J("",130)," ","-"),"|"
FIN C IMPR Q
CHAR(NI) 
 S II="" F %I=1:1 S II=$O(LIM(II)) Q:II=""  S POS(NI,II)="|"
 S POS(NI,131)="|" Q
CHP S POS(LI,REP(IT))="["_CHC_"]" Q
KEY S POS(LI,REP(IT))=$S(($D(^%SCRE(SC,CHC))#10)=1:"*",1:"") Q
PX S POS(LI,REP(IT))=^%SCRE(SC,CHC,2) Q
PY S POS(LI,REP(IT))=^%SCRE(SC,CHC,3) Q
ESP S POS(LI,REP(IT))=$S($D(^%SCRE(SC,CHC,"ESPACE")):^%SCRE(SC,CHC,"ESPACE"),1:"") Q
AFF I '($D(^%SCRE(SC,CHC,"MODAFF"))) S POS(LI,REP(IT))="" Q
 S CON=^%SCRE(SC,CHC,"MODAFF") F %W=1:1 S UC=$P(CON,",",%W) Q:UC=""  D CHAR(LI) S POS(LI,REP(IT))=UC,LI=LI+1
 Q
MOD I $D(^%SCRE(SC,CHC,"INVISIBLE")) S POS(LI,REP(IT))="NON" Q
 S POS(LI,REP(IT))=$S('($D(^%SCRE(SC,CHC,"PATOUCH"))):"OUI",1:$S(^%SCRE(SC,CHC,"PATOUCH")=1:"NON",1:"OUI")) Q
INV S POS(LI,REP(IT))=$S($D(^%SCRE(SC,CHC,"INVISIBLE")):^%SCRE(SC,CHC,"INVISIBLE"),1:"") Q
LIS S POS(LI,REP(IT))=$S(($D(^%SCRE(SC,CHC))#10)=1:"*",1:$S($D(^%SCRE(SC,CHC,"LISTE")):"*",1:"")) Q
CON I '($D(^%SCRE(SC,CHC,4))) S POS(LI,REP(IT))="" Q
 S CON=^%SCRE(SC,CHC,4) F %W=1:1 S UC=$P(CON,",",%W) Q:UC=""  D CHAR(LI) S POS(LI,REP(IT))=UC,LI=LI+1
 Q
LIB S LIB=^%SCRE(SC,CHC,1) F %W=0:1 S PI=$E(LIB,(18*%W)+1,(18*%W)+18) Q:PI=""  D CHAR(LI) S POS(LI,REP(IT))=PI,LI=LI+1
 Q
REQ I '($D(^%SCRE(SC,CHC,"QUERY"))) S POS(LI,REP(IT))="" Q
 S QU=""
LR S QU=$O(^%SCRE(SC,CHC,"QUERY",QU)) Q:QU=""  D CHAR(LI) S LIB=QU_" "_^%SCRE(SC,CHC,"QUERY",QU) F %W=0:1 S PI=$E(LIB,(30*%W)+1,(30*%W)+30) Q:PI=""  D CHAR(LI) S POS(LI,REP(IT))=PI,LI=LI+1
 G LR
POS S LI="" F %W=0:0 S LI=$O(POS(LI)) Q:LI=""  W ! S UC="" F %W=0:0 S UC=$O(POS(LI,UC)) Q:UC=""  W ?UC,POS(LI,UC)
 K POS Q
LIM ;;0/Chp/CHP,6/Libelle/LIB,26/Cle/KEY,30/X/PX,35/Y/PY,39/Espace/ESP,47/Aff/AFF,53/Mod/MOD,59/Invisble/INV,71/Controle/CON,90/Lis/LIS,94/Requete/REQ,131

