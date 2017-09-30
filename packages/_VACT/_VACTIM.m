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

;%VACTIM^INT^1^59547,74033^0
ACTIMPR(MENU,TIT) ;;09:41 AM  8 Jan 1996
 S IMPR=$S($D(^TABIDENT(WHOIS,"PRINTER")):^TABIDENT(WHOIS,"PRINTER"),1:0),DI=$I,DX=10,DY=5 X XY W "Impression en cours...."
 O IMPR U IMPR S PG=0,OPT=0
LPG S PG=PG+1,LC=6 G:'($D(^GM2(DI,MENU,PG))) FPG W:PG>1 #
 
 W !,"|",$TR($J("",78)," ","-"),"|"
 W !,"|",?79,"|"
 W !,"|",?40-(($L(TIT)_$S(PG=1:"",1:" Page "_PG))\2),TIT,?79,"|"
 W !,"|",?79,"|"
 W !,"|",$TR($J("",78)," ","-"),"|"
 W !
 
 W !,"|",$TR($J("",78)," ","-"),"|" S LC=6
LLC S LC=LC+1 G:LC=18 FLC I '($D(^GM2(DI,MENU,PG,LC))) W !,"|",?79,"|" G LLC
 W !,"|" S CL="" F %U=1:1 S CL=$O(^GM2(DI,MENU,PG,LC,CL)) Q:CL=""  W ?CL-($L(OPT)+1),OPT,?CL,$TR(^GM2(DI,MENU,PG,LC,CL),"#","") S OPT=OPT+1
 W ?79,"|" G LLC
FLC W !,"|",$TR($J("",78)," ","-"),"|"
 
 W !,"|",$TR($J("",78)," ","-"),"|"
 W !,"|",?40-($L($$PCONF^%INCASTO("NOMHOST")_" - YEXPERT ("_^INCONNE("VERSION")_")")\2)$$PCONF^%INCASTO("NOMHOST")_" - YEXPERT ("_^INCONNE("VERSION")_")",?79,"|"
 W !,"|",?40-($L("France")\2),"France",?79,"|"
 W !,"|",$TR($J("",78)," ","-"),"|"
 D ZD^%QMDATE4,^%QMDAK0 W !,WHOIS,?38,HEURE,?65,%DAT G LPG
FPG K DI,LC,PG,CL,OPT C IMPR S DX=10,DY=5 X XY W $J("",60)
FIN Q

