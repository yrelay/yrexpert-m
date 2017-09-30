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

;%PBCFPAC^INT^1^59547,73873^0
PTPAPCMS ;
 S %PLUS="CALPAP^%PBCFPAC",%AJCMS="Cons/Mod/Sup"
 S NOMTAB="^ENVPAP",SCR="CONFPAP",ROUTI="^%VMULTGE"
 S NOMPROG=$T(+0)
 S NOMAP=$E(NOMPROG,4,$L(NOMPROG)),NOMPROG="^"_NOMPROG
 S NOMAJ="^%PBCFPAJ"
 S CMS=0 D CLEPAG^%VVIDEO,B^%VACTISC G FIN:ABENDSCR=1 D ^%VKCORP G PTPAPCMS:X1<2
FIN K CMS,%PLUS U 0 Q
CALPAP S ^ENVPAP(RESUL(1),RESUL(2),"SZX")=$P(^ENVPAP(RESUL(1),RESUL(2)),"^",1)
 S ^ENVPAP(RESUL(1),RESUL(2),"SZY")=$P(^ENVPAP(RESUL(1),RESUL(2)),"^",2)
 S ^ENVPAP(RESUL(1),RESUL(2),"%PFXI")=$P(^ENVPAP(RESUL(1),RESUL(2)),"^",3)
 S ^ENVPAP(RESUL(1),RESUL(2),"%PFYI")=$P(^ENVPAP(RESUL(1),RESUL(2)),"^",4)
 S ^ENVPAP(RESUL(1),RESUL(2),"W")=$P(^ENVPAP(RESUL(1),RESUL(2)),"^",5)
 S ^ENVPAP(RESUL(1),RESUL(2),"H")=$P(^ENVPAP(RESUL(1),RESUL(2)),"^",6)
 Q

