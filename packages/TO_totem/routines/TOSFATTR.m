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

;TOSFATTR^INT^1^59547,74875^0
TOSFATTR ;
 S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG="FICHES D'UN ATTRIBUT" D CLEPAG^%VVIDEO,TO4^%VZCD
 S CMS=0,%AJCMS="",SCR="TOSFATTR" D B^%VACTISC G:ABENDSCR FIN
 K ^AFFPAG($I)
 F EGAP=1:1 Q:(CL1=-1)!(("*"_CL1)'[("*"_CL))  D T F POSY=12:1 Q:POSY=22  D AFF Q:(CL1=-1)!(("*"_CL1)'[("*"_CL))
 S TIT="Resultats de comprehension" D ^TOPAGIN
FIN K ^AFFPAG($I),%AJCMS,BIDON,CL,CL1,CMS,CTRLA,DXD,DXG,DYB,DYH,EGAP,GRAPH,MSG,POSY,REFUSE,SCR,STOPUC,TIT Q
AFF S @("NO="_$P(CL1,",",2)),^AFFPAG($I,EGAP,POSY)="                         "_NO_$E("          ",1,10-$L(NO))_"          "_^[QUI]REPFICH(RESUL(1),RESUL(2),CL1),CL1=$N(^[QUI]REPFICH(RESUL(1),RESUL(2),CL1)) Q
T S ^AFFPAG($I,EGAP,7)="                         Article  "_RESUL(1)
 S ^AFFPAG($I,EGAP,8)="                         Domaine  "_RESUL(2)
 S ^AFFPAG($I,EGAP,9)="                         Attribut "_RESUL(3)
 S ^AFFPAG($I,EGAP,11)="                         Fiches              Regles"
 Q
1 S (REFUSE,STOPUC)=0 Q
ERRUC R *BIDON D POCLEPA^%VVIDEO
ERR S (REFUSE,STOPUC)=1 Q
LART D 1 G:RESUL(IC)="" ERR
 I '($D(^[QUI]REPFICH(RESUL(1)))) D ^%VSQUEAK,POCLEPA^%VVIDEO W "Article inconnu ... [RETURN]" G ERRUC
 Q
LDOM D 1 G:RESUL(IC)="" ERR
 I '($D(^[QUI]REPFICH(RESUL(1),RESUL(2)))) D ^%VSQUEAK,POCLEPA^%VVIDEO W "Domaine ",RESUL(2)," inconnu pour ",RESUL(1)," ... [RETURN]" G ERRUC
 Q
LATT D 1 G:RESUL(IC)="" ERR
 S (CL,CL1)=""""_RESUL(3)_""",""",CL1=$N(^[QUI]REPFICH(RESUL(1),RESUL(2),CL1)) I ("***"_CL1)'[("***"_CL) D ^%VSQUEAK,POCLEPA^%VVIDEO W "Aucun attribut ",RESUL(3)," apres comprehension pour ",RESUL(1)," ",RESUL(2)," ... [RETURN]" G ERRUC
 Q

