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

;%QXPPRI5^INT^1^59547,73887^0
%QXPPRI5 ;;04:17 PM  29 Jul 1992; 29 Jul 92  4:07 PM ; 30 Jul 92 10:42 AM
 
NXTXY(ETU,NOMMAT,X,Y) 
 N NDC,GLOENS
 S NDC=WHOIS("NDCOUR")
 S GLOENS="^[QUI]ETU("""_ETU_""",""REMMAT"","""_NOMMAT_""","""_X_""")"
 I $D(@GLOENS@(NDC)) Q $O(@GLOENS@(NDC,Y))
 D MKGLO(NDC)
 Q $O(@GLOENS@(NDC,Y))
 
GLOX(ETU,NOMMAT,X) 
 N NDC,GLOENS
 S NDC=WHOIS("NDCOUR")
 S GLOENS="^[QUI]ETU("""_ETU_""",""REMMAT"","""_NOMMAT_""","""_X_""")"
 I $D(@GLOENS@(NDC)) Q $O(@GLOENS@(NDC,Y))
 D MKGLO(NDC)
 Q $$CONCAS^%QZCHAD(GLOENS,NDC)
 
 
MKGLO(ND) 
 N VOID,KEY2,%PERE,%KEY,NODE
 N ARB,ARBETU
 S ARB=$$STO^%QXPPRIM(ETU),ARBETU=$$ARBETU^%QXPPRIM(ETU)
 S VOID=$$TEMP^%SGUTIL,NODE=ND,KEY2=""
BCLND S KEY2=$O(@ARB@(NODE,"MAT2",NOMMAT,X,KEY2)) I KEY2="" G NDUP
 I $D(@VOID@(KEY2)) G BCLND
 I @ARB@(NODE,"MAT2",NOMMAT,X,KEY2)=$C(0) S @VOID@(KEY2)="" G BCLND
 S @GLOENS@(ND,KEY2)=""
 G BCLND
NDUP S %PERE=$$PERE^%QARBCON(ARBETU,NODE) I (%PERE="")!(%PERE=NODE) K @(VOID) S @GLOENS@(ND)="" Q
 S NODE=%PERE
 I '($D(@GLOENS@(NODE))) S KEY2="" G BCLND
 S KEY2="" F %KEY=0:0 S KEY2=$O(@GLOENS@(NODE,KEY2)) Q:KEY2=""  I '($D(@VOID@(KEY2))) S @GLOENS@(ND,KEY2)=""
 S @GLOENS@(ND)=""
 K @(VOID) Q
 ;
 ;
 ;
 ;

