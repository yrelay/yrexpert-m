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

;%SCOCDF2^INT^1^59547,73888^0
%SCOCDF2 ;
 
 
 
 
 
 
CRETUD(ETUD,NOMLIST) 
 S ETUD=$$GEN^%QCAPOP("SCE")
 N REPET,LL S REPET=$$NOMINT^%QSF("ETUDE")
 D PA^%QSGESTI(REPET,ETUD,"NOM",ETUD,1)
 D PA^%QSGESTI(REPET,ETUD,"INDIVIDU.REFERENCE",OBSOUR,1)
 D PA^%QSGESTI(REPET,ETUD,"REPERTOIRE.REFERENCE",REPSOUR,1)
 D PA^%QSGESTI(REPET,ETUD,"TAUX.ACCORD",ACCAD,1)
 D PA^%QSGESTI(REPET,ETUD,"ARRET.SUR.PREMIER.INDIVIDU",ARPREM,1)
 D PA^%QSGESTI(REPET,ETUD,"REGLES.IGNOREES",IGNORE,1)
 D PA^%QSGESTI(REPET,ETUD,"DATE",$$DATE^%QMDATE,1)
 D PA^%QSGESTI(REPET,ETUD,"HEURE",$$HEURE^%QMDATE,1)
 S LL="" F I=1:1 S LL=$O(@NOMLIST@(LL)) Q:LL=""  D PA^%QSGESTI(REPET,ETUD,"LISTE.CIBLE",LL,I)
 S LL="" F I=1:1 S LL=$O(@LISICIB@(LL)) Q:LL=""  D PA^%QSGESTI(REPET,ETUD,"REPERTOIRE.CIBLE",LL,I)
 Q
 
RES 
 
 
 I @LISRES@(REPSOUR,OBSOUR)=1 S NOETUD=$O(@LISRES@(REPSOUR,OBSOUR,"")) G RES2
RES1 
 D INIT^%QUCHOIP($$CONCAS^%QZCHAD(LISRES,REPSOUR_","_OBSOUR),"",1,2,14,76,8),AFF^%QUCHOIP
 S DX=27,DY=14 X XY W $$^%QZCHW(" Liste des etudes ")
 S NOETUD=$$UN^%QUCHOIP
 D END^%QUCHOIP
 I NOETUD="" G BMEN^%SCOCDEF
RES2 I $$^%QSCALIN($$NOMINT^%QSF("ETUDE"),NOETUD,"LISTE",1)="" D ^%VZEAVT($$^%QZCHW("Etude vide ...")) G BMEN^%SCOCDEF
 S ADRL=$$LISTATT1^%QSGEST6($$NOMINT^%QSF("ETUDE"),NOETUD,"LISTE")
 D INIT,INIT^%QUAPAGM(FEN)
RES3 D REAFI
 S Y1=$$UN^%QUAPAGM I Y1="" G END
 S Y1=$$INT^%QS0L(Y1)
 G RES3
 
INIT 
 S @FEN@("X")=0,@FEN@("Y")=3,@FEN@("L")=80,@FEN@("H")=19
 S @FEN@("B")="L0",@FEN@("A")=ADRL,@FEN@("ATT")=1,@FEN@("AFF")="REAFI^%SCOCDF2"
 S @FEN@("LR")=13
 
 S @FEN@("C",1,"T")=$$^%QZCHW("Card."),@FEN@("C",1,"L")=6,@FEN@("C",1,"C")="CARD"
 S @FEN@("C",2,"T")=$$^%QZCHW("Repertoire"),@FEN@("C",2,"L")=15,@FEN@("C",2,"C")="OBJET"
 S @FEN@("C",3,"T")=$$^%QZCHW("Source"),@FEN@("C",3,"L")=12,@FEN@("C",3,"C")="SOURCE"
 S @FEN@("C",4,"L")=16,@FEN@("C",4,"C")="AUTRE"
 S @FEN@("C",5,"T")=$$^%QZCHW("Creation"),@FEN@("C",5,"L")=8,@FEN@("C",5,"C")="DATE.CREATION"
 S @FEN@("ECRAN")="CADR^%QS0DP",@FEN@("PADLINE")="POCLEPA^%VVIDEO"
 Q
 
END D END^%QUAPAGM K @(FEN)
 D REAFF^%SCOCDEF
 I @LISRES@(REPSOUR,OBSOUR)>1 G RES1
 G BMEN^%SCOCDEF
REAFI 
 D AFI,AFFICH^%QUAPAGM
 Q
AFI 
 D CLEPAG^%VVIDEO
 D ^%VZCD(0,39,0,2,0,0,"Etude: "_NOETUD)
 D CARSP^%VVIDEO(40,0,3,$S(SUB="C-IBM PC":38,1:40),1)
 N LCOUR S LCOUR="SAVOIR-COMPARER"
 S DX=41,DY=1 X XY W $J("",$S(SUB="C-IBM PC":35,1:38))
 S DX=60-($L(LCOUR)\2),DY=1 X XY D REV^%VVIDEO X XY W LCOUR D NORM^%VVIDEO Q

