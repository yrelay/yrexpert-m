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

;TOP9TLR^INT^1^59547,74874^0
TOP9TLR ;
 
 D TOP0PACL
 D TOP0GFIL
 D TOP0GGAM
 Q
 
TOP0PACL 
 
 F CLICH="0012903","0161K01" K ^[QUI]PARCLICH(CLICH) D TRAIT^TOP0PACL W "/"
FIN K ^PARAM($I),%U,FICH,NBPAR,NBP,VAL,VAR,VAR1,POSY,POSY2,CLICH,V,PARAM,PLC,LG,CD,CF,%LIB,PARA,NBCLICH Q
 
TOP0GFIL 
 
 F CLICH="0012903","0161K01" S ARC=CLICH,TBP="^TABPARA($I)",PARCL="^[QUI]PARCLICH(ARC)" D TRAIT^TOP0GFIL
 Q
FIN2 K %U7,%CUK,%UP,%UV,^TABPARA($I),CL,PACLI,ARC,NUMCLI,NUMPRO,CLIENT,CLILIV,REFCCLI,PLUTO,PLUTAR,%DAT,NCLICH,NOMTOT,ART,CRT,NORM,ETSURF Q
 Q
 
TOP0GGAM 
 
 S AA=1
 F CLICH="0012903","0161K01" S ARC=CLICH,TBP="^TABPARA($I)",PARCL="^[QUI]PARCLICH(ARC)" D TRAIT^TOP0GGAM S AA=AA+1
 Q
FIN3 K %U7,%CUK,%UP,%UV,^TABPARA($I),CL,PACLI,ARC,NUMCLI,NUMPRO,CLIENT,CLILIV,REFCCLI,PLUTO,PLUTAR,%DAT,NCLICH,NOMTOT,ART,CRT,NORM,ETSURF Q
 
TEST D ^TOP9TLR Q

