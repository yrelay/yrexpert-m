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

;TOFICTIL^INT^1^59547,74872^0
TOFICTIL ;
 
 N %IETU
 F %IETU="IMPL","NOME","PHAS","FORM","CONS","KEM" G:%IETU=ETUD @ETUD
 G FIN
 
IMPL G:WB2'["~" FIN S KEY=2,TILW=WB2,TIL="PARA",PG="^TO39KEMP" D AFF G FIN
NOME G:WB2'["~" FIN S KEY=2,TILW=WB2,TIL="COMP",PG="^%AB3KEMP" D AFF G FIN
PHAS S TIL="PHASE"
PHAS1 S PG="^%AB3KEMP" F KEY=2,4 S TILW=@("WB"_KEY) I TILW["~" D AFF
 G FIN
FORM S TIL="FORMULE" G PHAS1
CONS S TIL="OUTCONS" G PHAS1
AFF D ^%ABINDPA(TILW,.RES),^TOINDBAS(RES,"LIND") S ^[QUI]INDICE(ARTI,"CLEPAR",%NUFICH,KEY)=RES
 S %V=-1 F %U=1:1 S %V=$N(LIND(%V)) Q:%V=-1  D TR
 Q
TR S BES("IMPLICI",%V)=1,^[QUI]INDICE(ARTI,"KEY",%NUFICH,KEY,%V)=RES,^[QUI]INDICE(ARTI,"LOCAI",%NUFICH,%V)=RES,^[QUI]INDICE(ARTI,"RFIND",%V,%NUFICH)=RES,^[QUI]INDICE(ARTI,"REG",TIL,%V,%NUFICH)=RES
KEM S (%BIL,PCHCOMP)=%V D @PG S %PYT="P" D ^%ABLIBTY
 Q
FIN K KEY,%U,%V,TIL,TILW Q

