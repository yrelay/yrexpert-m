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

;%ABCALDP^INT^1^59547,73864^0
CCALDP ;
 
MORE S DIST=0 F VV=1:1:NBC S DIST=DIST+PVAR
 I ^[QU]STRUCT(NOMG,1,4)="H" G MOREH
 S DP=$S(DPNUM=1:DP+DIST,1:DPDP_($P(DP,DPDP,2)+DIST)) G FIN
MOREH S XXX=DP,MIN=$E(DP,3,4),HEU=$E(DP,1,$L(DP)-2),TOTMIN=((HEU*60)+MIN)+DIST,NHEU=(TOTMIN\60)#24,NMIN=TOTMIN#60,DP=$S($L(NHEU)=1:"0",1:"")_NHEU_$S($L(NMIN)=1:"0",1:"")_NMIN G FIN
LESS S DIST=0 F VV=1:1:NBC S DIST=DIST+PVAR
 I ^[QU]STRUCT(NOMG,1,4)="H" G LESSH
 S DP=$S(DPNUM=1:DP-DIST,1:DPDP_($P(DP,DPDP,2)-DIST)) G FIN
LESSH S MIN=$E(DP,3,4),HEU=$E(DP,1,$L(DP)-2)
LOLESS S T1=(HEU*60)+MIN,TOTMIN=T1-DIST I T1<DIST S TOTMIN=TOTMIN+(24*60)
 S NHEU=(TOTMIN\60)#24,NMIN=TOTMIN#60,DP=$S($L(NHEU)=1:"0",1:"")_NHEU_$S($L(NMIN)=1:"0",1:"")_NMIN
FIN Q

