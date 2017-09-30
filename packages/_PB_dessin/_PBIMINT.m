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

;%PBIMINT^INT^1^59547,73873^0
PTIINTER(O,V) 
DIAL 
 S RESUL(1)=O,RESUL(2)=V,RESUL(3)="",RESUL(4)="" G GO
 N ABENDSCR,CMS,I,SCR K RESUL,PATOUCH
 S RESUL(1)=O,RESUL(2)=V F I=1,2 S PATOUCH(I)=1
 F I=3,4 S RESUL(I)="",PATOUCH(I)=""
DEB D CLEPAG^%VVIDEO S CMS=0,SCR="PTIINTER"
 D ^%VAFIGRI,^%VAFISCR
TEST D ^%VMODISC Q:ABENDSCR  I (RESUL(1)="")!(RESUL(2)="") D POCLEPA^%VVIDEO,^%VSQUEAK,TEST
GO D CLEPAG^%VVIDEO,INIT^%PBMFN(O,V),CLEPAG^%VVIDEO,^%PBPZGRA,CLEAR^%PBP5EC,CADRE^%PBP5EC2
 D MESUR^%PBP5EC2(^[QUI]GRAPHE2(RESUL(1),RESUL(2),0,"MESURE"))
 D SOFT(RESUL(3),RESUL(4),RESUL(1),RESUL(2),0,0,0,1)
 D ^%PBPZALF,^%VZEAVT("")
 D ^%PBPZGRA,CLEAR^%PBP5EC,^%PBPZALF,FIN^%PBMFN Q
 
 
 
 
 
 
 
 
 
 
POINTS(NUFA,TWREF,O,V,OB,PTS,PARAM,STOP) 
 D INT(NUFA,TWREF,O,V,0,0,0,1,PTS,0,PARAM,OB) Q
SOFT3(NUFA,TWREF,O,V,OB,XT,YT,ROT,AGR,PTS,PARAM,STOP,AFF) 
 D INT(NUFA,TWREF,O,V,XT,YT,ROT,AGR,PTS,AFF,PARAM,OB) Q
SOFT2(NUFA,TWREF,O,V,OB,XT,YT,ROT,AGR,PTS,PARAM,STOP) 
 D INT(NUFA,TWREF,O,V,XT,YT,ROT,AGR,PTS,1,PARAM,OB) Q
SOFT(NUFA,TWREF,O,V,XT,YT,ROT,AGR) N OBB,PB1,PB2,STOP
 D INT(NUFA,TWREF,O,V,XT,YT,ROT,AGR,"PB1",1,"PB2","OBB") Q
INT(NUFA,TWREF,O,V,XT,YT,ROT,AGR,PTS,AFF,PARAM,OBJET) N EL,M,POINT,R
 S M=^[QUI]GRAPHE2(O,V,0,"MESURE"),STOP=0
 F EL=1:1:^[QUI]GRAPHE2(O,V) D ^%PBEL2(NUFA,TWREF,O,V,EL,XT,YT,ROT,AGR,M) Q:STOP  R *R:0 D:R=1 ERR Q:STOP
 Q
ERR D ^%PBPZALF
 D POCLEPA^%VVIDEO,^%VSQUEAK W "Arret de l'interpretation (O/N) ? [O] : "
 R *R:^TOZE($I,"ATTENTE") S:R=-1 R=13 F I=13,78,79 G:I=R @I
 D ^%VSQUEAK G LL
13 G 79
78 G ENDERR
79 S STOP=1
ENDERR D POCLEPA^%VVIDEO,^%PBPZGRA Q

