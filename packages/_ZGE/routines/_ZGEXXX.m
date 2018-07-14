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
;! HL001 ! HL     ! 01/01/01 ! Erreur %GTM-E-INVCMD -> $ZT="G ..."            !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%ZGEXXX^INT^1^59547,74037^0
ZGEWORD ;
S S $ZT="",%P=16,EDOV=0,EDSL=19,%ALM=0,(EDBB,EDBE,EDST,EDS2,EDDC,EDDW,EDDL)="",$P(%ED,"^",1)=%EDE D INT^%MAXSIZ,INIT^%ZGEINSF W @(FF) D LOAD
ED D SET^%ZGEINSF,^%ZGEED
 K PGM,%ALM,%SEP,%EDE,%EDI,X,ED,EDBB,EDBE,EDL,EDOV,EDP,EDPP,EDR,EDRP,EDS,EDS2,EDSL,EDST,EDFL,EDCL,EDLL,EDN,WORS,EDDC,EDDW,EDDL D Q^%ZGEINSF Q
LOAD S WORS=0 G LE:PGM=EMP S DX=0,DY=EDSL+2 X XY W "Reading ",PGM X XL F Y=0,1 S ^U($J,"P",Y)=$P($T(0+Y),";",2,999)
 X ^U($J,"P",0) K Y W " (OK)"
LE D STAT Q
SAV D:PGM=EMP FILE Q:PGM=EMP  S DX=0,DY=EDSL+2,WORS=0
 X XY W "Saving ",PGM X XL F Y=0:1:2 S ^U($J,"P",Y)=$P($T(1+Y),";",2,999)
 K (RM,EDP,EDRP,EDL,ED,EDS,EDCL,EDLL,WORS,PGM,%P,EDOV,EDSL,EDBB,EDBE,EDST,EDS2,EDDC,EDDW,EDDL,%ED,%EDE)
 X ^U($J,"P",0) W " (OK)" D INIT^%ZGEINSF,SET^%ZGEINSF,STAT Q
FILE S %SAVE="X;%ED" D PUSH^%ZGESTK S $P(%ED,U,1)=%EDI D SET^%ZGEINSF S %Q="File name? ",X=PGM D ^%ZGEIN S PGM=$S(%C:EMP,1:X),WORS=EMP D POP^%ZGESTK,SET^%ZGEINSF,STAT Q
STAT S %ALM=0,$P(%ED,U,3)=$P(^%ZGE("C",+(%ED),0),U,1)_" *** File "_PGM_" "_$S(WORS:"("_WORS_" bytes)",1:EMP)_" *** "_$S(EDOV:"Overstrike",1:EMP)
 S DX=0,DY=EDSL+1 X XY W $E(%SEP,1,RM) S DY=EDSL+4 X XY W $E($P(%ED,U,3),1,RM) X XL Q
0 
 
1 
 
 
E S DX=0,DY=EDSL+3 X XY W *7,"?File not found ",$ZE X XL S $ZT="G E^%ZGEWORD",PGM="" D FILE,LOAD G ED
 
 
OLD1 
 ;
 ;

