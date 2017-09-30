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

;TOWDEPCO^INT^1^59547,74876^0
TOWDEPCO ;
 
 S COL1=$P(^PLUCOL($I),"^",1),COL2=$P(^PLUCOL($I),"^",2),IDP1=$P(COL1,"/",1),IDX1=$P(COL1,"/",2),IDP2=$P(COL2,"/",1),IDX2=$P(COL2,"/",2)
 S DPDEB=$S(IDP1<IDP2:IDP1,1:IDP2),DPFIN=$S(DPDEB=IDP1:IDP2,1:IDP1),DXDEB=$S(DPDEB=IDP1:IDX1,1:IDX2),DXFIN=$S(DXDEB=IDX1:IDX2,1:IDX1),COLC=($X-9)\(ESPC+1),XCOUR=((ESPC+1)*COLC)+10,XDUPC=DXDEB,XLIM=((ESPC+1)*NBC)+9,DPCOUR=DPDEB-1E-1,YCOUR=-1
LOODP S DPCOUR=$N(^[QUW]OCGRIL(NOMG,%ALL,%ETAT,%LARG,DPCOUR)) G:DPCOUR=-1 FIN G:DPCOUR>DPFIN FIN I $D(^[QUW]OCGRIL(NOMG,%ALL,%ETAT,%LARG,DP)) D 43 G LOODP
 S YCOUR=-1
LOOPY F WW=0:0 S YCOUR=$N(^[QUW]OCGRIL(NOMG,%ALL,%ETAT,%LARG,DPCOUR,YCOUR)) Q:YCOUR=-1  S XCOUR=-1 F YY=0:0 S XCOUR=$N(^[QUW]OCGRIL(NOMG,%ALL,%ETAT,%LARG,DPCOUR,YCOUR,XCOUR)) Q:XCOUR=-1  D ECRI
TEST D ^TOWGETPH G:DPCOUR=DPFIN FIN D 43 G LOODP
ECRI 
 K ^GRPH($I) G:$D(^[QUW]OCGRIL(NOMG,%ALL,%ETAT,%LARG,DP,YCOUR,XCOUR)) FFIN
 S ^[QUW]OCGRIL(NOMG,%ALL,%ETAT,%LARG,DP,YCOUR,XCOUR)=^[QUW]OCGRIL(NOMG,%ALL,%ETAT,%LARG,DPCOUR,YCOUR,XCOUR)
 I YCOUR=8 S C=^[QUW]OCGRIL(NOMG,%ALL,%ETAT,%LARG,DP,YCOUR,XCOUR) D GETLIM^TOWREMGR
 S:YCOUR'=8 ^GRPH($I,XCOUR,YCOUR)=^[QUW]OCGRIL(NOMG,%ALL,%ETAT,%LARG,DP,YCOUR,XCOUR)
 S DX=XCOUR,DY=YCOUR X XY W ^[QUW]OCGRIL(NOMG,%ALL,%ETAT,%LARG,DP,YCOUR,XCOUR)
FFIN Q
FIN S PX=10 D ^%ABMJDPX S DX=10,DY=8 X XY Q
43 D MORE^%ABCALDP,^TOWAFGRI,^TOWEMPGR,^TOWLIGNU,PGE^TOWGRPAG,AFFICH^TOWGRPAG S DX=10,DY=8 X XY Q
OCGRI W *

