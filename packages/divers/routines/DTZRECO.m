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

;DTZRECO^INT^1^59547,74866^0
RECONST ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N LIBGLO,DX,DY,NBKEY,NIV,LIBG,J,I,REP,SEL
 D AFFI
 I '($D(^ECL)) D ^%VZEAVT($$^%QZCHW("Attention: le global intermediaire de stockage ^ECL n'existe pas...")) Q
 D POCLEPA^%VVIDEO
 S REP=$$^%VZECH2($$^%QZCHW("Reconstitution "),$$^%QZCHW("de tous les globaux"),$$^%QZCHW("Selection"))
 Q:(REP'["tous")&(REP'["Selection")
 S SEL=$S(REP["tous":0,1:1)
 S LIBGLO=""
RESTO 
 S LIBGLO=$O(^ECL(LIBGLO))
 I LIBGLO="" D CLEPAG^%VVIDEO Q
 S LIBA=$$^%QZCHW("Reconstitution de ")_LIBGLO
 D POCLEPA^%VVIDEO
 I '(SEL) W LIBA_"..." G SRESTO
 G:'($$MES^%VZEOUI(LIBA_" ?:","O")) RESTO
SRESTO S RAC=$P($P(LIBGLO,"[",2),"]")
 I RAC'="",'($D(@RAC)) D ^%VZEAVT($$^%QZCHW("Attention : la variable ")_RAC_$$^%QZCHW(" n'est pas definie...")) G RESTO
 D RESTGLO
 K ^ECL(LIBGLO)
 G RESTO
 
RESTGLO 
 D POCLEPA^%VVIDEO
 S I="",NBU=0
BVAL S I=$O(^ECL(LIBGLO,I))
 Q:I=""
 S VAL=^ECL(LIBGLO,I,"!")
 S J=$O(^ECL(LIBGLO,I,0))
 I J="!" S @(LIBGLO_"="_VAL),NBU=1 W "." G BVAL
 S LIBG=LIBGLO_"("_^ECL(LIBGLO,I,J)
BCLE S J=$O(^ECL(LIBGLO,I,J))
 I J="!" S @(LIBG_")="_VAL),NBU=NBU+1 W "." D:(NBU#70)=0 POCLEPA^%VVIDEO G BVAL
 S LIBG=LIBG_","_^ECL(LIBGLO,I,J)
 G BCLE
 
AFFI N BIG,DXG,DXD,DYH,DYB,GRAPH,MSG
 D CLEPAG^%VVIDEO
 S BIG=0,DXG=0,DXD=79,DYH=0,DYB=2,GRAPH=0,MSG="RECONSTITUTION D'UN GLOBAL A PARTIR DE SON ECLATE" D 4^%VZCD

