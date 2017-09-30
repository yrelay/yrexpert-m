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

;%TLWARM2^INT^1^59547,74031^0
%TLWARM S:'($D(IOM)) IOM=80 O 0 U 0 ;;05:23 PM  11 Sep 1990
 
 
LOOP1 D CLEPOS S:'($D(IOM)) IOM=80 I '($D(ATT)) S ATT=1
LOOP R *X1:ATT D TOUCHE^%INCCLAV(X1,.X1)
 Q:TUE
 I X1=-1,$P($H,",",2)>(OLDH+1) D AV^%TLWAR Q:TUE  S OLDH=$P($H,",",2)
 D ^%VZANVT G:$D(%XLEC) 27+1
 G:X1=27 @X1 G FIN
27 I $P($H,",",2)>(OLDH+1) D AV^%TLWAR Q:TUE  S OLDH=$P($H,",",2)
 R *X2,*X3 I $P($H,",",2)>(OLDH+1) D AV^%TLWAR Q:TUE  S OLDH=$P($H,",",2)
 G FIN:(X2=27)!(X3=27) I (((X1'=27)!(X2'=91))!(X3'>64))!(X3'<69) D SQUEAK G LOOP
 I $P($H,",",2)>(OLDH+1) D AV^%TLWAR Q:TUE  S OLDH=$P($H,",",2)
 D @X3,TEST G LOOP
CLEPOS X XY W *27,"N",$C(34) X XY Q
FIN I $P($H,",",2)>(OLDH+1) D AV^%TLWAR Q:TUE  S OLDH=$P($H,",",2)
 O 0 U 0 Q
65 S DDX=0,DDY=-(MPASY) I $P($H,",",2)>(OLDH+1) D AV^%TLWAR Q:TUE  S OLDH=$P($H,",",2)
 Q
66 S DDX=0,DDY=MPASY I $P($H,",",2)>(OLDH+1) D AV^%TLWAR Q:TUE  S OLDH=$P($H,",",2)
 Q
67 S DDY=0,DDX=MPASX I $P($H,",",2)>(OLDH+1) D AV^%TLWAR Q:TUE  S OLDH=$P($H,",",2)
 Q
68 S DDY=0,DDX=-(MPASX) I $P($H,",",2)>(OLDH+1) D AV^%TLWAR Q:TUE  S OLDH=$P($H,",",2)
 Q
TEST I $P($H,",",2)>(OLDH+1) D AV^%TLWAR Q:TUE  S OLDH=$P($H,",",2)
 S NX=DX+DDX,NY=DY+DDY W *-1 I $P($H,",",2)>(OLDH+1) D AV^%TLWAR Q:TUE  S OLDH=$P($H,",",2)
 I (((NX'>NXI)!(NX'<NXS))!(NY'>NYI))!(NY'<NYS) D SQUEAK Q
 I $P($H,",",2)>(OLDH+1) D AV^%TLWAR Q:TUE  S OLDH=$P($H,",",2)
 X XY W " " S DX=NX,DY=NY D CLEPOS K NX,NY Q
SQUEAK I $P($H,",",2)>(OLDH+1) D AV^%TLWAR Q:TUE  S OLDH=$P($H,",",2)
 W *7,*7,*-1 Q

