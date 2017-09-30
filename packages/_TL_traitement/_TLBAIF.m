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

;%TLBAIF^INT^1^59547,74028^0
TLBAIF ;
 
INIT(TYPE) 
 I (MODAF=2)!(MODAF=3) G INIMAP
 I TYPE'=0 Q
 D CREER^%TLBAGF1("ACT",0,2,7,79,80,0,"",1,$$^%QZCHW("traitement"))
 D CREER^%TLBAGF1("ATT",0,10,13,44,80,0,"",0,"")
 D CREER^%TLBAGF1("LOG",45,9,14,34,80,0,"",1,$$^%QZCHW("messages"))
 
 Q
INIMAP 
 D CREER^%TLBAGF1("TRT",21,2,8,59,80,0,$$CONCAS^%QZCHAD(GLOETD,NIVEAU_",PLAN"),1,$$^%QZCHW("traitement")_" : "_TRT)
 
 I TYPE=2 Q
 D CREER^%TLBAGF1("LIS",0,2,8,20,80,0,$$CONCAS^%QZCHAD(GLOETD,NIVEAU_",INDIVIDUS"),1,$$^%QZCHW("liste")_" : "_LISTE)
 
 I TYPE=1 Q
 D CREER^%TLBAGF1("LOG",0,10,12,80,80,0,$$CONCAS^%QZCHAD(GLOETD,"JOURNAL"),1,$$^%QZCHW("journal"))
 
 Q
 
END(TYPE) 
 I (MODAF=2)!(MODAF=3) G ENDMAP
 I TYPE'=0 Q
 D TUER^%TLBAGF1("ATT")
 D TUER^%TLBAGF1("ACT")
 D TUER^%TLBAGF1("LOG")
 
 D CLEPAG^%VVIDEO
 Q
ENDMAP 
 D TUER^%TLBAGF1("TRT")
 I TYPE=2 Q
 D TUER^%TLBAGF1("LIS")
 I TYPE=1 Q
 D TUER^%TLBAGF1("LOG")
 I MODAF'=3 D CLEPAG^%VVIDEO
 Q
 
REAF(TYPE) 
 I TYPE=0 D CLEPAG^%VVIDEO
 I TYPE'=2 D ENTETE
 
 I (MODAF=2)!(MODAF=3) G REAMAP
 I TYPE=3 D CLEAR^%TLBAGF2("ACT"),CLEAR^%TLBAGF2("ATT"),CLEAR^%TLBAGF2("LOG")
 I TYPE'=0 Q
 D CARSP^%VVIDEO(0,9,14,45,1)
 S DX=3,DY=9 X XY W " ",$$^%QZCHW("attributs de l'individu et de la liste")," "
 D REAF^%TLBAGF1("ATT",0)
 D REAF^%TLBAGF1("ACT",0)
 D REAF^%TLBAGF1("LOG",0)
 
 Q
 
REAMAP 
 I TYPE=3 Q
 D REAF^%TLBAGF1("TRT",0)
 I TYPE=2 Q
 D REAF^%TLBAGF1("LIS",0)
 I TYPE=1 Q
 D REAF^%TLBAGF1("LOG",0)
 Q
ENTETE 
 N LL,NBT,CARD,DX,DY,I,IND
 I (MODAF=2)!(MODAF=3) G ETUDE
 D REV^%VVIDEO
 S DX=0,DY=0 X XY W $$^%QZCHW("liste")_" : " S DX=$X,DY=$Y D BLD^%VVIDEO X XY W LISTE D NORM^%VVIDEO,REV^%VVIDEO
 S DX=25 X XY W $$^%QZCHW("traitement")_" : " S DX=$X,DY=$Y
 D BLD^%VVIDEO X XY W TRT D NORM^%VVIDEO,REV^%VVIDEO
 S DX=60 X XY W $$^%QZCHW("Mode")_" : " S DX=$X,DY=$Y
 D BLD^%VVIDEO X XY W $S(MODEX=1:$$^%QZCHW("Simulation"),MODEX=0:$$^%QZCHW("reel"))
 D NORM^%VVIDEO,BLD^%VVIDEO
 S DX=0,DY=1 X XY W @GLOETD@(NIVEAU,"CARDINAL")," ",$$^%QZCHW(@GLOETD@(NIVEAU,"REPERTOIRE.LOGIQUE")),"(S)"
 D NORM^%VVIDEO
 S IND="",I=@GLOETD@(NIVEAU,"INDIVIDU.COURANT")
 I I'=0 S IND=@GLOETD@(NIVEAU,"INDIVIDUS",I)
 D BLD^%VVIDEO,BLK^%VVIDEO
 S DX=2,DY=10 X XY W $J("",42) X XY W $E(IND,1,42)
 D NORM^%VVIDEO
 S DX=45,DY=1 G NBT
ETUDE 
 S DX=0,DY=0 X XY W $J("",131)
 I @GLOETD@("ETUDE")="" G DEROUL
 D REV^%VVIDEO
 S DX=0 X XY W $$^%QZCHW("etude")_" : " S DX=$X,DY=$Y
 D BLD^%VVIDEO X XY
 W @GLOETD@("ETUDE")
DEROUL 
 D NORM^%VVIDEO,REV^%VVIDEO
 S DX=20 X XY W $$^%QZCHW("deroulement")_" : " S DX=$X X XY
 D BLD^%VVIDEO W DEROUL
 D NORM^%VVIDEO,REV^%VVIDEO
 S DX=56 X XY W $$^%QZCHW("affichage")_" : " S DX=$X X XY
 D BLD^%VVIDEO W $S(MODAF=2:$$^%QZCHW("visible"),1:$$^%QZCHW("invisible"))
 D NORM^%VVIDEO
 S DX=20,DY=1
NBT 
 D BLD^%VVIDEO
 X XY W $$^%QZCHW("nombre d'individus traites")_" : "
 S DX=$X,DY=$Y,I=NIVEAU
RECNIV I '($D(@GLOETD@(I,"INDIVIDUS.TRAITES"))) S I=I-1 G RECNIV
 S NBT=@GLOETD@(I,"INDIVIDUS.TRAITES")
 S CARD=@GLOETD@(I,"CARDINAL")
 D REV^%VVIDEO
 I NBT'=0 S LL=$L((NBT-1)_"/"_CARD) X XY W $J("",LL)
 X XY W NBT,"/",CARD
 D NORM^%VVIDEO
 Q
 
LLINE 
 D POCLEPA^%VVIDEO
 W $$^%QZCHW("traitement courant")_" : "_TRT
 I ETIQ'="" W ", "_$$^%QZCHW("etiquette")_" : "_ETIQ
 I PARTIE'="" W ", "_$$^%QZCHW("partie")_" : "_PARTIE
 Q

