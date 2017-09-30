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

;%VNEWPA^INT^1^59547,74035^0
CMSNEWPA ;
 
 
 
 K RESUL,AFRESU S (%NOMO,%NOMT)=^PRESCR($I,SCR,%PCOUR),%NOMT=$E(%NOMT,1,$L(%NOMT)-1),%NOMT=$P(%NOMT,"(",2,599) K %BB F %UU=1:1:NPT S %BB(%UU)=$P(%NOMT,"""",2*%UU)
 D GOLDNOM(.%NOMO,.OLDNOM,.OLDFULL) I $D(@%NOMO)=10 D RESLG(.%NOMO,.SCR,.RESUL),^%VTNAMFU S %FNOM=%NFU_"("_$P(%NOMO,"(",2,599) D:%NFU'="" RESLG(.%FNOM,.SCR,.AFRESU) G FIN
 S RS=@%NOMO F IW=1:1:NPT S RESUL(CLE(IW))=%BB(IW)
 K FRESU D RESAUTG(.RS,.SCR,.RESUL),^%VTNAMFU
 I %NFU'="" S %FNOM=%NFU_"("_$P(%NOMO,"(",2,599) I $D(@%FNOM) S FRS=@%FNOM D RESAUTG(.FRS,.SCR,.AFRESU)
FIN D OABRES,CLEPAG^%VVIDEO,^%VAFIGRI,^%VAFISCR S DX=68,DY=0 X XY W "          " X XY W "Pge ",%PCOUR,"/",%NBPVU-1
 Q
GOLDNOM(%NOM,OLDNOM,OLDFULL) 
 D ^%VOLDNOM Q
RESAUTG(RS,SCR,RESUL) S ICCK=1 F ICC=1:1 Q:'($D(^%SCRE(SCR,ICC)))  I $D(^%SCRE(SCR,ICC))'=11 S RESUL(ICC)=$P(RS,"^",ICCK),ICCK=ICCK+1
 Q
RESLG(%NOM,SCR,RESUL) 
 D RES^%VKLONG Q
OABRES K ^OABRES($I) S YK=-1 F ZK=1:1 S YK=$N(RESUL(YK)) Q:YK=-1  S ^OABRES($I,YK)=RESUL(YK)
 K YK,ZK Q

