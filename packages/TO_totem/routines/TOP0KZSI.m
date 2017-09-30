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

;TOP0KZSI^INT^1^59547,74874^0
TOP0KZSI ;
 
 D CLEPAG^%VVIDEO S DEV="ECR",DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG="SUPPRESSION " D TO4^%VZCD
LEC S DX=0,DY=6 D CLEBAS^%VVIDEO W "Suppression de zones signific. appartenant a des cliches anterieurs (O/N) ? " R *REP G:REP=78 FIN I REP'=79 D ^%VSQUEAK G FIN
 W !,"Tous (O/N) :" R *TOUS I TOUS=79 D ZD^%QMDATE4 S DT=$P(%DAT,"/",3)_$P(%DAT,"/",2)_$P(%DAT,"/",1),DT=DT+1 G KILL
JR S DX=0,DY=8 X XY W "Jusqu'a quelle date (? aide) : " S DX=$X-1 D ^%VLEC G:CTRLA=1 FIN S DT=Y1 I DT="?" D JOUR^TOP0AID2 G JR
 I DT="" D ZD^%QMDATE4 S DT=%DAT W DT
HR S DX=0,DY=9 X XY W "Et quelle heure (? aide) : " S DX=$X-1 D ^%VLEC G:CTRLA=1 FIN S HR=Y1 I HR="?" S DAAT=DT D HEURE^TOP0AID2 G HR
 I HR="" D ^%VSQUEAK G HR
KILL S D=-1 F I=1:1 S D=$N(^[QUI]PARCLICH(D)) Q:((D=DT)!(D="z"))!(D=-1)  K ^[QUI]PARCLICH(D)
 G:(D="z")!(D=-1) FIN S HE=-1,H=$P(HR,"H",1),MN=$P(HR,"H",2) F I=1:1 S HE=$N(^[QUI]PARCLICH(D,HE)),H1=$P(HE,"H",1),MN1=$P(HE,"H",2) Q:(((HE=HR)!(HE=-1))!(H1>H))!((H=H1)&(MN1>MN))  K ^[QUI]PARCLICH(D,HE)
FIN K REP,DAT,DT,D,I,H,HR,HE Q

