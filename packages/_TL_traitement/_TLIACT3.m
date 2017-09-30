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

;%TLIACT3^INT^1^59547,74029^0
%TLIACT3 ;
 
 
 
 
ACTION 
 G:NOM="AFFECTATION" AFF
 G:NOM]"$INDIVIDU" MOITIE
 G:NOM="$ABANDON" ABANDON
 
 Q:NOM="$ADRESSE"
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 Q:NOM="$ETIQUETTE"
 
 G:NOM="$FIN" FIN
 G:NOM="$FIN.TRAITER.LISTE" HALT
 
 
 
 
 
 
 I $D(^%RQSGLO("MOTEUR","TRT","VERBE",NOM)) Q:$$^%TLBAVE  G ERR
 G ERR
MOITIE 
 
 
 
 
 
 
 
 
 
 
 G:NOM="$PROLOGUE" PROLOG^%TLIACTE
 
 
 
 G:NOM="$REPETER" BOUCLER^%TLIACTA
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 G:NOM="$TRIERL" TRIER^%TLIACT6
 
 
 
 
 I $D(^%RQSGLO("MOTEUR","TRT","VERBE",NOM)) Q:$$^%TLBAVE  G ERR
 
ERR I MODAF'=0 D ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer action"))
 S ECHEC=1 Q
 
 
SOUTER S ECHEC=1 Q
 
 
FIN S STOP=1 Q
 
ARRET I TRBOUC'=1 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Pas de boucle")) S ECHEC=1 Q
 S ARRET=1 Q
 
ADRESSE Q
 
ABANDON S ABANDON=1 Q
 
HALT I TRLIS'=1 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Pas de $TRAITERL")) S ECHEC=1 Q
 S HALT=1
 Q
 
REA D:MODAF REAF^%TLIFEN,IND Q
 
FEX D:MODEX'=1 FEX^%TLIACTM Q
 
AFF 
 N ATTA,INDA,VARA,REPA,EXP,EXP2
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Affectation"))
 S EXP=$$SUBST^%ANARBR2($$RED(ACTI,2),.CXT,"ATT^%TLIACT3",.POS)
 
 I '(POS) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer partie droite")) S ECHEC=1 Q
 D AFF^%TLIACTS($$RED(ACTI,1),EXP)
 Q
 
 
NBT D REV^%VVIDEO,BLD^%VVIDEO
 S LL=$L((NBT-1)_"/"_CARD),DX=NX,DY=NY X XY W $J("",LL)
 X XY W NBT,"/",CARD D NORM^%VVIDEO Q
 
IND D BLD^%VVIDEO,BLK^%VVIDEO S DX=2,DY=(HH+HACT)+1 X XY W $J("",MD-4)
 X XY W $E(IND,1,MD-4)
 D NORM^%VVIDEO Q
 
NET S DX=2,DY=(HH+HACT)+1 X XY W $J("",MD-4) Q
 
ATT(A,V) D:MODAF ADD^%TLIFEN("ATT",A_$S(V="":" inconnu",1:" = "_V)) Q
 
INDBAS I '($$GET^%SGVAR("ECR")) Q
 I ORIG="TRAIT" D POCLEPA^%VVIDEO W $E(TRT_$$^%QZCHW(" : Individus traites : ")_NBT_"/"_CARD_" ---> "_IND,1,78)
 Q
 
RED(N,A) 
 Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

