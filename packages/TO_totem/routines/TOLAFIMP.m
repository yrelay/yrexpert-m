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

;TOLAFIMP^INT^1^59547,74872^0
TOLAFIMP ;
 
 S IMPR=^TABIDENT(WHOIS,"PRINTER") O IMPR U IMPR
 D ^TOLAFPRE
 S TT="^[QUI]OCGRIL(NOMG,%ALL,%ETAT,%LARG)"
 D ABS S CORY=0,PAGE=0
 S DP=-1,ODP=0,NBSH=0,FIN=0 F UU=0:0 S DP=$N(@TT@(DP)) Q:DP=-1  D ALIGN S PY=-1 F VV=0:0 S PY=$N(@TT@(DP,PY)) Q:PY=-1  S PX=-1 F WW=0:0 S PX=$N(@TT@(DP,PY,PX)) Q:PX=-1  D TRAIT
FIN H 5 S FIN=1 D AFFICH W #,*23 C IMPR Q
ALIGN I (NBSH#19)=0 D AFFICH
 S DELTA=DP-ODP,DEP=(DELTA-1E-1)*10 F ZZ=1:1:DEP W !,?73,".",! S NBSH=NBSH+1
 S ODP=DP,NBSH=NBSH+1 G END
TRAIT I PY=8 W !,?4,@TT@(DP,PY,PX),?73,DP,! G END
 W ?PX-6,@TT@(DP,PY,PX) G END
ABS 
 S LIGNU="" F UU=7:-1:1 S LIGNU=LIGNU_UU F VV=1:1:9 S LIGNU=LIGNU_"."
 S LIGNU=LIGNU_"0" G END
AFFICH I PAGE>0 W !,?3,LIGNU,!,!,?40-($L(MSG2)\2),MSG2,!,!,! S AFF=$$^%QZCHW($$PCONF^%INCASTO("NOMHOST")_" - YEXPERT ("_^INCONNE("VERSION")_")") W ?40-($L(AFF)\2),AFF G:FIN=1 END
 W # S PAGE=PAGE+1 H:(PAGE#5)=0 10 S AFF=$$^%QZCHW("Page ")_PAGE W ?40-($L(AFF)\2),AFF,?65,$$^%QZCHW("le "),%DAT,!,!,!,?3,LIGNU,! G END
END Q
 
TEST W !,$$^%QZCHW("ALLIAGE : ") R %ALL Q:%ALL=""
 W !,$$^%QZCHW("ETAT : ") R %ETAT Q:%ETAT=""
 W !,$$^%QZCHW("LARGEUR : ") R %LARG Q:%LARG=""
 D ^TOLAFIMP G TEST

