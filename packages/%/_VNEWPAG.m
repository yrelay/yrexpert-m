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

;%VNEWPAG^INT^1^59547,74035^0
GENEWPAG(SC,PGE,XX,YY,TBP) 
 
 S AD="G" G BEG
NG(SC,PGE,XX,YY,TBP) 
 S AD="NG"
BEG K KEY S %NBPVU=@TBP,%U=^%SCRE(SC),NK=0 F %V=1:1:%U S:($D(^%SCRE(SC,%V))#10)=1 NK=NK+1,KEY(NK)=%V
 K RESUL,AFRESU S (%NOMO,%NOMT)=@TBP@(PGE),%NOMT=$E(%NOMT,1,$L(%NOMT)-1),%NOMT=$P(%NOMT,"(",2,599) K %BB F %UU=1:1:NK S %BB(%UU)=$P(%NOMT,"""",2*%UU)
 D GOLDNOM^%VMULTGE(.%NOMO,.OLDNOM,.OLDFULL) G:$D(@%NOMO)'=10 NDIX D RESLG(.%NOMO,.SC,.RESUL),^%VTNAMFU I %NFU'="" S %FNOM=%NFU_"("_$P(%NOMO,"(",2,599) D RESLG(.%FNOM,.SC,.AFRESU) G FIN
 D RESLG(.%NOMO,.SC,.AFRESU) G FIN
NDIX S RS=@%NOMO F IW=1:1:NK S RESUL(KEY(IW))=%BB(IW),AFRESU(KEY(IW))=%BB(IW)
 K FRESU D RESAUTG(.RS,.SC,.RESUL),^%VTNAMFU
 I %NFU'="" S %FNOM=%NFU_"("_$P(%NOMO,"(",2,599) I $D(@%FNOM) S FRS=@%FNOM D RESAUTG(.FRS,.SC,.AFRESU) G FIN
 D RESAUTG(.RS,.SC,.AFRESU)
FIN K PATOUCH S IW=^%SCRE(SCR) F NK=1:1:IW S PATOUCH(NK)="" S:$D(^%SCREC(SCR,"GERQS",NK)) @("RESUL(NK)="_^%SCREC(SCR,"GERQS",NK)) I $D(^%SCRE(SCR,NK,"PATOUCH")),^%SCRE(SCR,NK,"PATOUCH")=1 S PATOUCH(NK)=1
 D OABRES D:AD="G" DECH^%VCHOSCR D:AD="NG" ^%VAFIGRI D ^%VAFISCR S DX=XX,DY=YY X XY W $J("",7) X XY W "P:",PGE,"/",%NBPVU
 Q
GOLDNOM(%NOM,OLDNOM,OLDFULL) 
 D ^%VOLDNOM Q
RESAUTG(RS,SC,RESUL) S ICCK=1 F ICC=1:1 Q:'($D(^%SCRE(SC,ICC)))  I $D(^%SCRE(SC,ICC))'=11 S RESUL(ICC)=$P(RS,"^",ICCK),ICCK=ICCK+1
 Q
RESLG(%NOM,SC,RESUL) 
 D RES^%VKLONG Q
OABRES K ^OABRES($I) S YK=-1 F ZK=1:1 S YK=$N(RESUL(YK)) Q:YK=-1  S ^OABRES($I,YK)=RESUL(YK)
 K YK,ZK Q

