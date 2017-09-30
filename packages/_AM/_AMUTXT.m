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

;%AMUTXT^INT^1^59547,73865^0
%AMUTXT ;;09:21 AM  4 Nov 1993;
 
 
 
 
 
 
AFFIFEN(TITRE,GLO,ROUMORE) 
 Q $$FENETRE(TITRE,GLO,ROUMORE,10,10,60,9)
 
FENETRE(TITRE,GLO,ROUMORE,POSX,POSY,LARG,HAUT) 
 N I,LGTH
 S NBLIG=9,COUR=1,DEB=1,TOT=@GLO,LAR=58
 S LGTH=$$TEMP^%SGUTIL
 S EXIMORE=ROUMORE'=""
 W /WOPEN(POSX,POSY,LARG,HAUT,1,"","",TITRE,"tc")
 W /COLOR(7,1)
ALL S DER=(DEB+NBLIG)-1,ACOUR=1
 W /CLR
 S DX=1
 
 S I=DEB,IA=0
NXL G:'($D(@GLO@(I))) AGA
 W:I=COUR /COLOR(1,7)
 S LIG=@GLO@(I),P=1
 S J=1,AFF=$E(LIG,1,P+LAR),IA=IA+1 G:IA>NBLIG CUT S DY=IA-1 X XY W AFF S P=(P+LAR)+1,DX=0
 F J=1:1 S AFF=$E(LIG,P,(P+LAR)+1) Q:AFF=""  S IA=IA+1 G:IA>NBLIG CUT S DY=IA-1 X XY W AFF S P=(P+LAR)+2
 S DX=1
 W:I=COUR /COLOR(7,1)
 S I=I+1
 G NXL
CUT S DX=1
 
 W:I=COUR /COLOR(1,7)
AGA D:(TOT'=0)&EXIMORE MORE
NO R *x
 I TOT'=0,(((x=1)!(x=11))!(x=13))!(x=27) W:EXIMORE /WCLOSE,/COLOR(7,1)
 G:x=1 UP G:x=11 DOWN G:x=13 RETURN
 G:x'=27 NO
 
 W /COLOR(7,1)
 W /WCLOSE
 Q -1
UP G:COUR=1 AGA
 I (ACOUR-$$L(COUR-1))<1 S COUR=COUR-1,DEB=COUR G ALL
 
 S DY=ACOUR-1 X XY W @GLO@(COUR)
 S COUR=COUR-1
 S ACOUR=ACOUR-$$L(COUR)
 S DY=ACOUR-1 X XY W /COLOR(1,7),@GLO@(COUR),/COLOR(7,1)
 G AGA
 
DOWN G:COUR=TOT AGA
 I ((ACOUR+$$L(COUR))+$$L(COUR+1))>(NBLIG+1) G SCRD
 I ACOUR=NBLIG S DEB=DEB+1,COUR=COUR+1 G ALL
 G:COUR=TOT NO
 
 
 S DY=ACOUR-1 X XY W @GLO@(COUR)
 S ACOUR=ACOUR+$$L(COUR)
 
 S COUR=COUR+1,DY=ACOUR-1 X XY W /COLOR(1,7),@GLO@(COUR),/COLOR(7,1)
 G AGA
SCRD W /CLR
 S COUR=COUR+1,ACOUR=(NBLIG-$$L(COUR))+1
 S I=COUR,IA=NBLIG+1
SCRDB G:IA'>1 SCRDF
 I (IA-$$L(I))>0 S IA=IA-$$L(I) W:I=COUR /COLOR(1,7) S DY=IA-1 X XY W @GLO@(I) W:I=COUR /COLOR(7,1) S I=I-1 G SCRDB
 S P=$$L(I)-1,LIG=@GLO@(I)
 S DX=0
 F Z=P:-1 S LL=$E(LIG,(P*LAR)+1,(P+1)*LAR),IA=IA-1,DY=IA-1 X XY W LL Q:IA=1
 S DX=1
SCRDF G AGA
 
 
L(II) N V I $D(@LGTH@(II)) S V=@LGTH@(II) Q V
 S V=($L(@GLO@(II))\LAR)+1,@LGTH@(II)=V Q V
 
RETURN 
 W /WCLOSE
 Q COUR
 
MORE N VALAFF
 S @("VALAFF="_ROUMORE_"(COUR)")
 W /COLOR(1,7),/WOPEN(50,3,20,1,1,"","","","tc") D CUROF^%VVIDEO
 W VALAFF
 Q
 
TEST N TEMP
 S TEMP=$$TEMP^%SGUTIL
 F I=1:1:30 S @TEMP@(I)=I_$$TL
 S @TEMP=30
 S (A,B)=""
 S r=$$AFFIFEN("titre",TEMP,"$$UCM^%AMUTXT")
 Q
UCM(I) Q I
 
TL() N R S R=$R(3)
 Q:R=0 "eme ligne"
 Q:R=1 " eme ligne, mais n'est-elle pas un peu longue ? c'est possible mais elle devrait etre wrappee"
 Q:R=2 " eme ligne, mais n'est-elle pas un peu longue ? c'est possible mais elle devrait etre wrappee d'autant plus qu'on a encore rajoute des infos"

