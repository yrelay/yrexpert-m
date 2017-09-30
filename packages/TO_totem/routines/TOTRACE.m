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

;TOTRACE^INT^1^59547,74876^0
TOTRACE ;
 
 S:'($D(^TOZE($I,"TRAC"))) ^TOZE($I,"TRAC")=0
 G:^TOZE($I,"TRAC")=0 END
 S NUTRAC=$S($D(NUTRAC):NUTRAC+1,1:1)
 G:^TOZE($I,"TRAC")="E" ECR
 S IMPR=^TABIDENT(WHOIS,"PRINTER") O IMPR U IMPR
ECR W ! F I=1:1:80 W "-"
 W !,!,$$^%QZCHW("Traces No : "),NUTRAC,!,!,$$^%QZCHW("Global ^ENTREE "),!
 S I=-1 F UU=0:0 S I=$N(^[QUI]ENTREE(ARTI,I)) Q:I=-1  S J=-1 F VV=0:0 S J=$N(^[QUI]ENTREE(ARTI,I,J)) Q:J=-1  W !,"(",I,",",J,")=",^[QUI]ENTREE(ARTI,I,J)
 W !,!,$$^%QZCHW("Glogal ^SORTIE"),!
 S I=-1 F UU=0:0 S I=$N(^[QUI]SORTIE(ARTI,I)) Q:I=-1  S J=-1 F VV=0:0 S J=$N(^[QUI]SORTIE(ARTI,I,J)) Q:J=-1  W !,"(",I,",",J,")=",^[QUI]SORTIE(ARTI,I,J)
 W !,!,$$^%QZCHW("Global ^CARD"),!
 S I=-1 F UU=0:0 S I=$N(^[QUI]CARD(ARTI,I)) Q:I=-1  W !,I,?30,"====> ",^[QUI]CARD(ARTI,I)
END C:^TOZE($I,"TRAC")="I" IMPR Q

