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

;TO43GSCR^INT^1^59547,74871^0
TO43GSCR ;
 
 S (YB,YA)=ARTI D ^TO4GEXPL S SCR=YA_"/"_$I_"/"_$J,NSR="^%SCRE(SCR)" K ^%SCRE(SCR) S NCH=1,@NSR@(NCH)="INDEX",@NSR@(NCH,1)=$$^%QZCHW("Article            : "),@NSR@(NCH,2)=0,@NSR@(NCH,3)=2,@NSR@(NCH,5)=ARTI,@NSR@(NCH,6)=0,CH=-1,DY=2,DX=0
 F NCH=2:1 S DX=((NCH-1)#2)*40 S:DX<40 DY=DY+1 S CH=$N(^ITO4GEXP($I,CH)) Q:CH=-1  S NE=^ITO4GEXP($I,CH),IT=CH D ABR S @NSR@(NCH)="INDEX",@NSR@(NCH,1)=IT,@NSR@(NCH,2)=DX,@NSR@(NCH,3)=DY,@NSR@(NCH,5)="",@NSR@(NCH,6)=0
FIN S @NSR=NCH-1 K NSR,NCH,CH,%LIB,IT,LIT,NE Q
ABR I $L(IT)>14 S %LIB=IT D PD^TOABSPEC S IT=%ABSP
 S IT=$E(IT,1,14),IT=IT_"("_NE_")",LIT=$L(IT) F %U=LIT:1:18 S IT=IT_" "
 S IT=IT_": " Q

