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

;%QMLILAL^INT^1^59547,73878^0
%QMLILAL ;;04:44 PM  8 Oct 1992; ; 08 Oct 92  4:55 PM
 
 
 
MKLIS() N NL,TABUCO,TEMP1,TABUTI,ATT,%A,LIST,CTR
 S TEMP1=$$TEMP^%SGUTIL,TABUTI=$$TEMP^%SGUTIL
 S TABUCO=$$TEMP^%SGUTIL
 D MKLISTE^%QSGEL4(TEMP1)
 S @TABUCO@("INFO")="$$INFO^%QMLILAL"
 D ^%QULCHP(TEMP1,TABUTI,TABUCO,"                         nom des liens                              ",5,1,12,2)
 Q:$O(@TABUTI@(""))="" ""
 S ATT="" F %A=0:0 S ATT=$O(@TABUTI@(ATT)) Q:ATT=""  S @TABUTI@(ATT)=ATT
 S NL=$$GEN^%QCAPOP("ATT")
 S CTR="" D LIRE2^%VREAD("Nom de la liste : ",NL,2,75,7,18,"","",.CTR,.LIST)
 Q:LIST="" ""
 D ADD^%QMLILA(LIST,TABUTI)
 Q LIST
 
INFO(TAB) N GAG,T
 S T=$P(@TEMP1@(@TAB@("O")),"^",3)
 I T>3 Q $$^%QZCHW("lien involutif sur le repertoire")_" "_$P(@TEMP1@(@TAB@("O")),"^")
 S T=$S(T=3:$$^%QZCHW("relationnel"),1:$$^%QZCHW("hierarchique"))
 Q $$^%QZCHW("lien")_" "_T_" "_$$^%QZCHW("entre")_" "_$P(@TEMP1@(@TAB@("O")),"^")_" "_$$^%QZCHW("et")_" "_$P(@TEMP1@(@TAB@("O")),"^",2)
 ;

