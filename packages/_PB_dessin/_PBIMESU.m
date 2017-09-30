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

;%PBIMESU^INT^1^59547,73873^0
PTIMESUR ;
 N ADRESS
L0 
 D EFFBAS^%PBMEN
 S %9STR="" F I="(D)istance/1000","(M)esure","(C)oordonnees" S %9STR=%9STR_I_"  "
 D AFF^%PBMEN(0,0,%9STR),CUROFF^%PBMEN
 R *ADRESS:^TOZE($I,"ATTENTE")
 D CURON^%PBMEN
 I (ADRESS=1)!(ADRESS=6) Q
 I ADRESS=18 D RR^%PBIMCRE G L0
 S ADRESS=$C(ADRESS)
 I (ADRESS="D")!(ADRESS=1) D DIST G L0
 I (ADRESS="M")!(ADRESS=2) D MESUR G L0
 I (ADRESS="C")!(ADRESS=3) D COORD G L0
 D ^%VSQUEAK G L0
MESUR 
 N D,R,XA,XD,YA,YD
 D EFFBAS^%PBMEN,AFF^%PBMEN(0,0,"Pointez le point de depart avec la mire")
 D ^%PBPZGRA S R=$$LOC^%PBMFN(.XD,.YD) G:R=0 EMES
 
 D EFFBAS^%PBMEN,AFF^%PBMEN(0,0,"Pointez le point d'arrivee avec la mire")
 D ^%PBPZGRA S R=$$LOC^%PBMFN(.XA,.YA) G:R=0 EMES
 S DX=XA-XD,DY=YA-YD,D=$$SQROOT^%PBCACV((DX*DX)+(DY*DY)) D NORM^%VVIDEO
 
 D EFFBAS^%PBMEN,AFF^%PBMEN(0,0,"La distance est de "_D_" graduations, soit "_$P((D/1000)*DIST,".",1)_" mm [RETURN]") R *D
EMES Q
 
DIST 
 S ADRESS=$$CONFIRM^%PBMEN($$^%QZCHW("confimation")_" (O/N) : ")
 I '(ADRESS) Q
 D ^%PBPZALF,POCLEPA^%VVIDEO,REV^%VVIDEO
 W "1000 graduations correspondent (en MM) a [",DIST,"] : "
 S DX=$X,DY=$Y D NORM^%VVIDEO X XY D ^%VLEC
 D POCLEPA^%VVIDEO,^%PBPZONG
 Q:CTRLA  S:Y1="" Y1=DIST S DIST=Y1
DIST2 D SET^%PBSOV(O,V,"MESURE",DIST),^%PBPZGRA,MESUR^%PBP5EC2(DIST)
 Q
 
COORD 
 N R,X,Y
 
 D EFFBAS^%PBMEN,AFF^%PBMEN(0,0,"Pointez avec la mire le point dont vous voulez les coordonnees ...")
 D ^%PBPZGRA S R=$$LOC^%PBMFN(.X,.Y)
 G:'(R) ECOORD
 
 D EFFBAS^%PBMEN,AFF^%PBMEN(0,0,"X="_X_"   Y="_Y_"   [RETURN]"),CUROFF^%PBMEN R *R:^TOZE($I,"ATTENTE") D CURON^%PBMEN
ECCORD Q

