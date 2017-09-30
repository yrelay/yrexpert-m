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

;%QZCHV^INT^1^59547,73887^0
ZV ;
 
 
 
 
 
 
 
 
 
 
 
 
IN(ADR,II,VAL) 
 N I,OVAL,N,D,F
 S OVAL=@ADR,D=0 Q:II<1 1 Q:II>($L(OVAL,"^")-1) 1
 F I=1:1:II-1 S D=$F(OVAL,"^",D)
 S F=$F(OVAL,"^",D),OVAL=$E(OVAL,1,D-1)_VAL_"^"_$E(OVAL,F,$L(OVAL))
 S @ADR=OVAL
 Q 0
 
 
 
 
 
 
 
 
 
 
OUT(ADR,II,ER) 
 N I,OVAL,N,D,F,VAL S ER=1
 I ($D(@ADR)#10)'=1 S VAL="",ER=1 Q VAL
 S OVAL=@ADR,D=0 Q:II<1 "" Q:II>($L(OVAL,"^")-1) ""
 F I=1:1:II-1 S D=$F(OVAL,"^",D)
 S F=$F(OVAL,"^",D),VAL=$E(OVAL,D,F-2),ER=0
 Q VAL
 
TEST S ADR="^TOTO($J)"
 K @(ADR)
 S @ADR="UN^DEUX^TROIS^%QUATRE^"
 W !,$$IN(ADR,3,"DREI")," ",@(ADR)
 W !,$$IN(ADR,1,"EIN")," ",@(ADR)
 W !,$$IN(ADR,4,"FUNCT")," ",@(ADR)
 W !,$$IN(ADR,5,"EIN")," ",@(ADR)
 W !,$$IN(ADR,0,"EIN")," ",@(ADR)
 W !,$$IN(ADR,3,"")," ",@(ADR)
 S @ADR="UN"
 S @ADR="UN^DEUX^TROIS^%QUATRE^"
 W !,!,@(ADR)
 W !,$$OUT(ADR,1,.V)," ",V
 W !,$$OUT(ADR,3,.V)," ",V
 W !,$$OUT(ADR,1,.V)," ",V
 W !,$$OUT(ADR,4,.V)," ",V
 W !,$$OUT(ADR,5,.V)," ",V
 W !,$$OUT(ADR,0,.V)," ",V
 S @ADR="UN"
 W !,$$OUT(ADR,1,.V)," ",V
 S @ADR="UN^DEUX^^%QUATRE^"
 W !,$$OUT(ADR,3,.V)," ",V
 Q

