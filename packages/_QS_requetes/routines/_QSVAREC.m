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

;%QSVAREC^INT^1^59547,73883^0
QSVAREC(T,VA) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N P,I,ROUTREAF,BID,SITCC,%PROVEN
 S ROUTREAF="REAFFB^%QSVAREC",%PROVEN="TRT"
 S SITCC="^[QUI]QSVARACT("""_T_""","""_VA_""",""SITUATIONS"")"
AFF D REAFF
L0 
 S TABC(1)="COMMENTAIRE",TABC(2)="REPERTOIRE",TABC(3)="SITUATIONS",TABC(4)="ACTIONS",TABC(5)="ATTRIBUT",TABC(6)="TYPEMAJ",TABC(7)="ETAT"
L0S D POCLEPA^%VVIDEO S BID=$$^%VZECHO("TABC")
 F I=1,6,8,10,18,"COMMENTAIRE","REPERTOIRE","SITUATIONS","ACTIONS","ATTRIBUT","TYPEMAJ","ETAT" G:I=BID @$P(I," ",1)
 D ^%VSQUEAK G L0S
1 
 
 
6 G:BASE'="" 61
 I '($$EXIST^%QSVAREL(T,VA)) S OK=0 Q
 D ^%VZEAVT($$^%QZCHW("stockage interdit : repertoire manquant")) G L0
61 
 D ^%QSVAREL(T,VA) S OK=1 Q
8 
 D ^%QSVARHP,REAFF G L0
10 
 D DEB^%QSVARI(.P),^%QSVARI(P),FIN^%QSVARI(P) G L0
18 D REAFF G L0
ATTRIBUT 
 D AFATT(1),ATT^%QSVARE2,AFATT(0) G L0
ACTIONS 
 D AFACT(1),ACT^%QSVARE2,AFACT(0) G L0
SITUATIONS 
 D AFSIT(1),SIT^%QSVARE2,AFSIT(0) G L0
COMMENTAIRE 
 D AFCOM(1),COM^%QSVARE2,AFCOM(0) G L0
REPERTOIRE 
 D AFREP(1),REP^%QSVARE2,AFREP(0) G L0
TYPEMAJ 
 D AFMAJ(1),MAJ^%QSVARE2,AFMAJ(0) G L0
ETAT 
 D AFETAT(1),ETAT^%QSVARE2,AFETAT(0) G L0
 
AFCOM(B) D CARSP^%VVIDEO(0,3,3,80,B)
 D BLD^%VVIDEO S DX=5,DY=3 X XY W $$^%QZCHW("commentaire")
 X XY D NORM^%VVIDEO Q
AFMAJ(B) D CARSP^%VVIDEO(57,9,3,23,B)
 D BLD^%VVIDEO S DX=59,DY=9 X XY W $$^%QZCHW("type de mise a jour")
 X XY D NORM^%VVIDEO Q
AFREP(B) D CARSP^%VVIDEO(0,6,3,66,B)
 D BLD^%VVIDEO S DX=5,DY=6 X XY W $$^%QZCHW("repertoire")
 X XY D NORM^%VVIDEO Q
AFETAT(B) D CARSP^%VVIDEO(66,6,3,14,B)
 D BLD^%VVIDEO S DX=68,DY=6 X XY W $$^%QZCHW("etat")
 X XY D NORM^%VVIDEO Q
AFATT(B) D CARSP^%VVIDEO(0,9,3,57,B)
 D BLD^%VVIDEO S DX=5,DY=9 X XY W $$^%QZCHW("attribut")
 X XY D NORM^%VVIDEO Q
AFSIT(B) D CARSP^%VVIDEO(0,12,5,80,B)
 D BLD^%VVIDEO S DX=5,DY=12 X XY W $$^%QZCHW("situations")
 X XY D NORM^%VVIDEO Q
AFACT(B) D CARSP^%VVIDEO(0,17,6,80,B)
 D BLD^%VVIDEO S DX=5,DY=17 X XY W $$^%QZCHW("actions")
 X XY D NORM^%VVIDEO Q
 
REAFF D CLEPAG^%VVIDEO
CAD D ^%VZCD(0,79,0,2,0,0,VA_" ("_$S(T="AVANT":"prologue",1:"epilogue")_")")
 D AFCOM(0),AFREP(0),AFETAT(0),AFATT(0),AFMAJ(0),AFSIT(0),AFACT(0)
 S DX=2,DY=4 X XY W COMM
 S DX=2,DY=7 X XY W BASE
 S DX=2,DY=10 X XY W ATT
 S DX=59,DY=10 X XY W TYPMAJ
 S DX=68,DY=7 X XY W ETAT
 
 X XY
REAFS D REAFF^%QULIMO3(NOLS,1,SITL,0,12,80,5)
REAFA X XY
 D REAFF^%QULIMO3(NOLA,1,ACT,0,17,80,6)
 Q
 
REAFFB 
 D REAFF,A18^%QULIMO4,REAFF^%AN7
 Q

