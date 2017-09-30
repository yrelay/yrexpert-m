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

;TOP0KCLI^INT^1^59547,74874^0
TOP0KCLI ;
 
 D CLEPAG^%VVIDEO S DEV="ECR",DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG="SUPPRESSION DE CLICHES" D TO4^%VZCD
LEC S DX=0,DY=6 D CLEBAS^%VVIDEO W "Suppression de cliches anterieurs (O/N) ? " R *REP G:REP=78 FIN I REP'=79 D ^%VSQUEAK G FIN
 W !,"Tous (O/N) :" R *TOUS D TOUCHE^%INCCLAV(TOUS,.TOUS) G:TOUS=1 FIN I TOUS=79 D ZD^%QMDATE4 S DT=$P(%DAT,"/",3)_$P(%DAT,"/",2)_$P(%DAT,"/",1),DT=DT+1 G KILL
LJ S DX=0,DY=8 X XY W "Jusqu'a quelle date (? aide) : " S DX=$X-1 D ^%VLEC G:CTRLA=1 FIN I Y1="?" D JOUR^TOP0AID1 G LJ
 I Y1="" D ZD^%QMDATE4 W %DAT S Y1=%DAT
 S DT=$P(Y1,"/",3)_$P(Y1,"/",2)_$P(Y1,"/",1),DATE=DT,DAAT=Y1
LH S DY=9,DX=0 X XY W "Et quelle heure (? aide) : " S DX=$X-1 D ^%VLEC G:CTRLA=1 FIN I Y1="?" D HEURE^TOP0AID1 G LH
 I Y1="" D ^%VSQUEAK G LH
 S HR=$P(Y1,"H",1)_"."_$P(Y1,"H",2)
KILL W !,!," ..." S TB="^[QUI]P0GETARC",D=-1 F %U=1:1 S D=$N(@TB@(D)) Q:((D=DT)!(D="z"))!(D=-1)  S HE=-1 F %U1=1:1 S HE=$N(@TB@(D,HE)) Q:HE=-1  S CL=-1 F %U2=1:1 S CL=$N(@TB@(D,HE,CL)) Q:CL=-1  K ^[QUI]CLICHE(CL),^[QUI]ERLECBD(D)
 G:(D="z")!(D=-1) FIN S HE=-1 F %U=1:1 S HE=$N(@TB@(D,HE)) Q:(HE>HR)!(HE=-1)  S CL=-1 F %U1=0:0 S CL=$N(@TB@(D,HE,CL)) Q:CL=-1  K ^[QUI]CLICHE(CL),^[QUI]ERLECBD(D,HE)
FIN K %U,%U1,%U2,REP,DAT,DT,D,I,H,HR,HE Q

