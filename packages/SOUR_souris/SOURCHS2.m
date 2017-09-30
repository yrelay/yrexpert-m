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

;SOURCHS2^INT^1^59547,74868^0
SOURCHSF ;
 
 S YA="SOURIS" K ^V($I,YA) S CV="^V($I,YA)",@CV@("NOMBRE.DE.DENTS")=%NBDTS,@CV@("DIRECTION.SOURIS")=DIR(DIR),DIR="?",%ABEND=0 D ^SOURGFLA
 S NTABN="IMPLICITES",NCLE=3,PNUM=2,F1=18,NFOR=1,NTRI="",PARA=" ",CONDIT=0
LOPAR S NTRI=$O(^[QUI]TRI(YA,NTRI)) G:%ABEND=1 FIN G:NTRI="" FIN
 S PRX=^[QUI]TRI(YA,NTRI),SOURCE=$E(PRX,2,$L(PRX)-1),PARA=$P(PRX,",",2),PARAP=$P(PARA,"""",2) G:$D(^V($I,YA,PARAP)) LOPAR
RETERR Q:%ABEND=1
 S ATEST="^[QUI]CIMPLICI"_PRX,CATEST=@ATEST,@("CONDIT="_CATEST) K CATEST G:CONDIT=0 LOPAR
 S AFFECT="^[QUI]AIMPLICI"_PRX I @AFFECT="" S CONDIT=0 G LOPAR
 D SIFON G:%ABEND=1 LOPAR S CAFFECT=@AFFECT
 S $ZT="^SOURERR",@("^V($I,YA,PARAP)="_CAFFECT) K CAFFECT
RBLI D VERIF I PARAP="ARRET",VPA=1 S %ABEND=1 G LOPAR
 G LOPAR
FIN I $D(^V($I,YA,"PROCHAINE.DIRECTION")) S DIR=DIR(^V($I,YA,"PROCHAINE.DIRECTION"))
 D VERIFDIR K UNDEFCI Q
AVERTI D POCLEPA^%VVIDEO,^%VSQUEAK W "* ",PARA," * non defini, nous aurons peut-etre des problemes" H 3 Q
SIFON S SIF=0 Q:@AFFECT'["$"  S CONTAF=@AFFECT G:CONTAF'["$$" FIN S SIF=1,ROUTI="^"_$P($P(CONTAF,"/",1),"$$",2),EXPFONC=$S($E(CONTAF,1)="(":$E(CONTAF,2,$L(CONTAF)-1),1:CONTAF) D @ROUTI S AFFECT="%RESUL",%RESUL="%RESULTAT" K CONTAF,EXPFONC,ROUTI Q
END K UNDEFCI,NTRI,PARA,CONDIT,HEURE,PRX,SOURCE,PARAP,ATEST,CATEST,AFFECT,VPA,%MODA,CONTAF,%RESUL,%RESULTAT,%POR,EXPFONC,ROUTI Q
 
 
VERIF 
 D POCLEPA^%VVIDEO W PARAP,"=",^V($I,YA,PARAP) H 1 Q
VERIFDIR 
 B  D POCLEPA^%VVIDEO W "je choisis donc la direction ",^V($I,YA,"PROCHAINE.DIRECTION") H 1 Q

