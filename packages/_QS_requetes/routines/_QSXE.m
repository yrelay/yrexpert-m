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

;%QSXE^INT^1^59547,73883^0
%QSXE(STO,LISTE,BASEF,STO1) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N I,INDF,LIE,OLIE,BLIEN,TYPE,NOK
 D PEREFILS^%QSGEL2(BASEF,.BASEP,.LIEN)
 S TYPE=$$TYPE2^%QSGEST9(BASEP,LIEN)
 Q:TYPE'=2
 K @STO@(BASE)
 S NOK=0
 S INDF=""
 F I=0:1 S IND=$O(@LISTE@(INDF)) Q:INDF=""  D TPERE1
 S @STO@(BASE,"NOK")=NOK
 S @STO@(BASE,"TOTAL")=I
 Q
 
TPERE1 I $$IR^%QSGEST5(BASEP,$$NOMPERE^%QSGES10(BASEF,INDF)) Q
 S:STO1'="" @STO1@(INDF,"BASE",BASEF)="sans pere"
 S NOK=NOK+1
 Q
TEST X ^BTL
 S STO="^%QSXE"
 S LISTE="^[QUI]QUERYV(""P2"")"
 S BASE="P2"
 S LIEN="ARC"
 D ^%QSXE(STO,LISTE,BASE,LIEN)
 Q
TEST1 X ^BTL
 S STO="^%QSXE"
 S LISTE="^[QUI]QUERYV(""P1"")"
 S BASE="P1"
 S LIEN="COMPOSANT"
 D ^%QSXE(STO,LISTE,BASE,LIEN)
 Q

