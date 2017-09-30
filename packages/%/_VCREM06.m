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

;%VCREM06^INT^1^59547,74034^0
GECREM06(ACT) 
 S COD=$P(ACT,",",2),NCH=$P(ACT,",",1),PAY=$P(ACT,",",3)+0,PAX=$P(ACT,",",4)+0 I ((COD="")&(NCH'>^MASQUE(M,"DESC",PAGE)))&(NCH>0) G SHOW
 I (NCH="")&(COD="I") S NCH=^MASQUE(M,"DESC",PAGE)+1 G @$A(COD)
 Q:(NCH="")&(COD'="I")
 G FIN:$T(@$A(COD))="",@$A(COD)
77 ;;M
 D CHAR,^%VCREM04("LIB",.C) S CHAR(1)=C,CHAR(2)=DXB,CHAR(3)=DYB D ^%VCREM05,AFF G FIN
CHAR K DEF,LIBEL,CHAR
 F %U=0:1 S LI=$P($T(LIB+%U),";;",2) Q:LI=""  S IT=$P(LI,"#",1),IT1=$P(IT,"/",1),IT2=$P(IT,"/",2),LIBEL(IT1)=IT2,CHAR(IT2)=$S(COD="I":"",1:$S(($D(^MASQUE(M,"DESC",PAGE,NCH,IT2))#10)=1:^MASQUE(M,"DESC",PAGE,NCH,IT2),1:"")),DEF(IT2)=$P(LI,"#",2)
 S CHAR(0)=$D(^MASQUE(M,"DESC",PAGE,NCH))#10
 Q:COD="I"
 Q
LIB ;; 1. Libelle/1#
 ;; 2. Position X/2#
 ;; 3. Position Y/3#
 ;; 4. Espace/ESPACE#X1,Y1,X2,Y2 Champs saisis entre points X1,Y1 & X2,Y2
 ;; 5. User controle/4#
 ;; 6. Mode affichage/MODAFF#N,UDL,BLD,BLK,REV,MOY ou GRD et leurs combinaisons
 ;; 7. Colonne modifiable/PATOUCH#1 OU vide
 ;;
SUITE 
SHOW D POCLEPA^%VVIDEO W NCH,?4 S L="***  vide ***"
 S:$D(^MASQUE(M,"DESC",PAGE,NCH)) L=^MASQUE(M,"DESC",PAGE,NCH,1)_"  "_^MASQUE(M,"DESC",PAGE,NCH,2)_"    "_^MASQUE(M,"DESC",PAGE,NCH,3) S:$D(^MASQUE(M,"DESC",PAGE,NCH))=11 L=L_"      "_^MASQUE(M,"DESC",PAGE,NCH) W L," [RETURN] "
 R *X:60 D POCLEPA^%VVIDEO G FIN
83 ;;S
 G FIN:'($D(^MASQUE(M,"DESC",PAGE,NCH))) D UN^%VCREM07(M,PAGE,NCH),^%VAFIMAS(M,PAGE,TB) G FIN
 Q
63 G FIN:'($D(^MASQUE(M,"DESC",PAGE,NCH))) D CHAR,^%VCREM05,AFF,^%VAFIMAS(M,PAGE,TB) G FIN
73 ;;I
 S PCH=^MASQUE(M,"DESC",PAGE)+1 S:NCH>PCH NCH=PCH D CHAR,^%VCREM04("LIB",.C) S CHAR(1)=C,CHAR(2)=DXB,CHAR(3)=DYB D ^%VCREM05
 S IL=^MASQUE(M,"DESC",PAGE),IC=IL
BOOP K ^MASQUE(M,"DESC",PAGE,IC+1)
 S:$D(^MASQUE(M,"DESC",PAGE,IC))=11 ^MASQUE(M,"DESC",PAGE,IC+1)=^MASQUE(M,"DESC",PAGE,IC)
 S ICC=-1 F %U=1:1 S ICC=$N(^MASQUE(M,"DESC",PAGE,IC,ICC)) Q:ICC=-1  S ^MASQUE(M,"DESC",PAGE,IC+1,ICC)=^MASQUE(M,"DESC",PAGE,IC,ICC)
 S IC=IC-1
 G:IC'<NCH BOOP
 S ^MASQUE(M,"DESC",PAGE)=^MASQUE(M,"DESC",PAGE)+1 D AFF,^%VAFIMAS(M,PAGE,TB) G FIN
AFF K ^MASQUE(M,"DESC",PAGE,NCH) F IC=1:1:4 S ^MASQUE(M,"DESC",PAGE,NCH,IC)=CHAR(IC)
 S:(CHAR("MODAFF")'="")&(CHAR("MODAFF")'="N") ^MASQUE(M,"DESC",PAGE,NCH,"MODAFF")=CHAR("MODAFF")
 S:CHAR("ESPACE")="" ^MASQUE(M,"DESC",PAGE,NCH,"ESPACE")=^MASQUE(M,"DESC",PAGE,"POSITION")
 S:CHAR("ESPACE")'="" ^MASQUE(M,"DESC",PAGE,NCH,"ESPACE")=CHAR("ESPACE")
 S:CHAR("PATOUCH")'="" ^MASQUE(M,"DESC",PAGE,NCH,"PATOUCH")=CHAR("PATOUCH")
 Q
80 ;;P 
 G FIN:'($D(^MASQUE(M,"DESC",PAGE,NCH))) S:PAY=0 PAY=1 D DECAL1^%VCREM07(M,PAGE,NCH,PAX,PAY),^%VAFIMAS(M,PAGE,TB) G FIN
82 ;;R
 G FIN:'($D(^MASQUE(M,"DESC",PAGE,NCH))) S:PAY=0 PAY=-1 D DECAL1^%VCREM07(M,PAGE,NCH,PAX,PAY),^%VAFIMAS(M,PAGE,TB) G FIN
FIN Q

