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

;TOGETBLO^INT^1^59547,74872^0
TOGETBLO ;
 
 S NBL="" F %80=1:1 S NBL=$O(^BLOC($I,NBL)) G:NBL="" FIN D TRAIT
FIN Q
TRAIT G:'($D(^BLOC($I,NBL,3))) END G:'($D(^BLOC($I,NBL,1))) END
 S BL3=^BLOC($I,NBL,3),BL1=^BLOC($I,NBL,1),GNUFA=$P(BL1,"^",1),GTWREF=$P(BL1,"^",2),GOP=$P(BL1,"^",6),GOG=$P(BL1,"^",7),INUFA=$P(BL3,"^",1),NUREF=$P(BL3,"^",2),USER=$P(BL3,"^",3) S:USER="" USER=QUI S TBL=$P(BL3,"^",4)
 K BL1,BL3 G:$E(INUFA,1,3)="GAM" SUIT G:$D(^[USER]TREEWORK(INUFA)) SUIT
 S JNUFA=$N(^[USER]TREEWORK(INUFA)) G:JNUFA=-1 END G:$E(JNUFA,1,$L(INUFA))'=NUFA END S INUFA=JNUFA K JNUFA
SUIT D ^TOGIVBLO I TBL="OP" S ^[QUI]COUT(GNUFA,GTWREF,GOP_"/"_GOG)=COUTOT,^[QUI]DUREE(GNUFA,GTWREF,GOP_"/"_GOG)=DURTOT
END K INUFA,NUREF,GNUFA,GTWREF,TBL,USER,COUTOT,DURTOT
 Q

