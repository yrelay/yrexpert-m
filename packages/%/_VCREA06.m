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

;%VCREA06^INT^1^59547,74034^0
GECREA06(ACT) 
 S COD=$P(ACT,",",2),NCH=$P(ACT,",",1),PAY=$P(ACT,",",3)+0,PAX=$P(ACT,",",4)+0 I COD="" G SHOW
 I (NCH="")&(COD="I") S NCH=^%SCRE(M)+1 G @$A(COD)
 Q:(NCH="")&(COD'="I")
 G FIN:$T(@$A(COD))="",@$A(COD)
77 ;;M
 D CHAR,^%VCREA04("LIB",.C,1)
 S CHAR(1)=C,CHAR(2)=DXB,CHAR(3)=DYB D ^%VCREA05,AFF G FIN
CHAR K DEF,LIBEL,CHAR
 F %U=0:1 S LI=$P($T(LIB+%U),";;",2) Q:LI=""  S IT=$P(LI,"#",1),IT1=$P(IT,"/",1),IT2=$P(IT,"/",2),LIBEL(IT1)=IT2,CHAR(IT2)=$S(COD="I":"",1:$S(($D(^%SCRE(M,NCH,IT2))#10)=1:^%SCRE(M,NCH,IT2),1:"")),DEF(IT2)=$P(LI,"#",2)
 S CHAR(0)=$D(^%SCRE(M,NCH))#10
 Q:COD="I"  G:'($D(^%SCRE(M,NCH,"QUERY"))) CHAR0
 S NQ="" F %U=1:1 S NQ=$N(^%SCRE(M,NCH,"QUERY",NQ)) Q:NQ=-1  S CHK=^%SCRE(M,NCH,"QUERY",NQ),CHAR("QUERY"_"."_%U)=NQ_","_$P(CHK,"~",1)_","_$P(CHK,"~",2)_","_$P(CHK,"~",3)
CHAR0 G:'($D(^%SCRE(M,NCH,"LIEN"))) CHAR1
 S NQ="" F %U=1:1 S NQ=$N(^%SCRE(M,NCH,"LIEN",NQ)) Q:NQ=-1  S CHK=^%SCRE(M,NCH,"LIEN",NQ),CHAR("LIEN"_"."_%U)=CHK
CHAR1 S:CHAR(6)=0 CHAR(6)="" Q:CHAR(6)=""  S CHAR(6)="" F IT=7:1 Q:'($D(^%SCRE(M,NCH,IT)))  S CHAR(6)=CHAR(6)_$S(CHAR(6)="":"",1:",")_^%SCRE(M,NCH,IT)
 Q
LIB ;; 0. Nom/NOM#Nom du champ (indispensable si champ invisible)
 ;; 2. Libelle/1#
 ;; 3. Position X/2#
 ;; 4. Position Y/3#
 ;; 1. Index/0#0 ou 1
 ;; 6. Limites en X/ESPACE#X1,X2 Champ saisie entre colonne X=X1 & X=X2
 ;; 7. User controls/4#
 ;; 8. Valeur par defaut/5#
 ;; 9. Valeurs legales/6#Separees par une virgule
 ;;10. Modif interdite/PATOUCH#0 ou 1
 ;;11. Champ invisible /INVISIBLE#Si invisible, nom de la variable contenant la valeur
 ;;12. Caracteres speciaux/CARASPEC#police,nom du caractere
 ;; 5. Mode affichage/MODAFF#N,UDL,BLD,BLK,REV,MOY ou GRD et leurs combinaisons
 ;;13. Attribut requete.1/QUERY.1#Rep,attribut,idf,numero ordre (pour multivalue)
 ;;14. Attribut requete.2/QUERY.2#Rep,attribut,idf,numero ordre (pour multivalue)
 ;;15. Lien.1/LIEN.1#Rep source,idf,ord,Rep cible,idf,ord
 ;;16. Lien.2/LIEN.2#Rep source,idf,ord,Rep cible,idf,ord
 ;;17. Liste/LISTE#==> 1 si doit apparaitre avec CTRLL
 ;;
SUITE 
SHOW D POCLEPA^%VVIDEO W NCH,?4 S L="***  vide ***" S:$D(^%SCRE(M,NCH)) L=^%SCRE(M,NCH,1)_"  "_^%SCRE(M,NCH,2)_"    "_^%SCRE(M,NCH,3) S:$D(^%SCRE(M,NCH))=11 L=L_"      "_^%SCRE(M,NCH) W L," [RETURN] " R *X:60 D POCLEPA^%VVIDEO G FIN
83 ;;S
 G FIN:'($D(^%SCRE(M,NCH))) D ^%VCREA07(M,NCH),^%VAFIGRI G FIN
QUERYS S IK=IC+1,IK1=IC G QUERY
QUERYI S IK=IC,IK1=IC+1 G QUERY
QUERY S NQ=-1 F %U=1:1 S NQ=$N(^%SCRE(M,IK,ICC,NQ)) Q:NQ=-1  S ^%SCRE(M,IK1,ICC,NQ)=^%SCRE(M,IK,ICC,NQ)
 Q
63 G FIN:'($D(^%SCRE(M,NCH))) S SPMAHC=1
 D CHAR,^%VCREA05,AFF S DX=0,DY=0 X XY W "               " D ^%VAFIGRI K SPMAHC G FIN
73 ;;I
 S PCH=^%SCRE(M)+1 S:NCH>PCH NCH=PCH S SPMAHC=1
 D CHAR,^%VCREA04("LIB",.C,1)
 S CHAR(1)=C,CHAR(2)=DXB,CHAR(3)=DYB D ^%VCREA05
 S IL=^%SCRE(M) F IC=IL:-1:NCH K ^%SCRE(M,IC+1) S:$D(^%SCRE(M,IC))=11 ^%SCRE(M,IC+1)=^%SCRE(M,IC) S ICC=-1 F %U=1:1 S ICC=$N(^%SCRE(M,IC,ICC)) Q:ICC=-1  D:ICC="QUERY" QUERYI S:($D(^%SCRE(M,IC,ICC))#10)=1 ^%SCRE(M,IC+1,ICC)=^%SCRE(M,IC,ICC)
 S ^%SCRE(M)=^%SCRE(M)+1 D AFF S DX=0,DY=0 X XY W "               " K SPMAHC D ^%VAFIGRI G FIN
AFF K ^%SCRE(M,NCH) F IC=1:1:5 S ^%SCRE(M,NCH,IC)=CHAR(IC)
 S ^%SCRE(M,NCH,6)=0,IC=7
 I CHAR(6)'="" F %U=1:1 S IT=$P(CHAR(6),",",%U) Q:IT=""  S ^%SCRE(M,NCH,IC)=IT,^%SCRE(M,NCH,6)=^%SCRE(M,NCH,6)+1,IC=IC+1
 F %U=1:1 Q:'($D(CHAR("QUERY."_%U)))  I CHAR("QUERY."_%U)'="" S IT=CHAR("QUERY."_%U),QU=$P(IT,",",1),NM=$P(IT,",",2),CHK=$P(IT,",",3),ORD=$P(IT,",",4),^%SCRE(M,NCH,"QUERY",QU)=NM_"~"_CHK_"~"_ORD
 F %U=1:1 Q:'($D(CHAR("LIEN."_%U)))  I CHAR("LIEN."_%U)'="" S IT=CHAR("LIEN."_%U),QU=$P(IT,",",4),^%SCRE(M,NCH,"LIEN",QU)=IT
 S:CHAR("NOM")'="" ^%SCRE(M,NCH,"NOM")=CHAR("NOM")
 S:CHAR("PATOUCH")=1 ^%SCRE(M,NCH,"PATOUCH")=1 S:(CHAR("INVISIBLE")'="")&(CHAR("INVISIBLE")'=0) ^%SCRE(M,NCH,"INVISIBLE")=CHAR("INVISIBLE")
 S:CHAR("CARASPEC")'="" ^%SCRE(M,NCH,"CARASPEC")=CHAR("CARASPEC") S:(CHAR("MODAFF")'="")&(CHAR("MODAFF")'="N") ^%SCRE(M,NCH,"MODAFF")=CHAR("MODAFF")
 S:CHAR("ESPACE")'="" ^%SCRE(M,NCH,"ESPACE")=CHAR("ESPACE")
 S:CHAR("LISTE")=1 ^%SCRE(M,NCH,"LISTE")=CHAR("LISTE")
 S:CHAR(0)=1 ^%SCRE(M,NCH)="INDEX" Q
80 ;;P 
 G FIN:'($D(^%SCRE(M,NCH))) S:PAY=0 PAY=1 D DECAL^%VCREA07(M,NCH,PAX,PAY),^%VAFIGRI G FIN
82 ;;R
 G FIN:'($D(^%SCRE(M,NCH))) S:PAY=0 PAY=-1 D DECAL^%VCREA07(M,NCH,PAX,PAY),^%VAFIGRI G FIN
FIN Q

