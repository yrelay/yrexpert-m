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

;%QGSTO2^INT^1^59547,73876^0
%QGSTO2(LLISTE,LISRES) ;;07:23 PM  10 Jun 1993; ; 17 Jun 93 11:43 AM
 
 
 
 
 
 N I,J,K,LISTE,BASE,IND
 S LISTE=""
 F I=0:0 S LISTE=$O(@LLISTE@(LISTE)) Q:LISTE=""  D T1
 S LISTE=$O(@LLISENT@(""))
 S IND="" F I=0:0 S IND=$O(@GRLISTE@(IND)) Q:IND=""  I $D(@GROAFF@(IND)),@GROAFF@(IND)>0 D PA^%QSGESTI("L0",LISTE,"QUANTITE",@GRLISTE@(IND,"NB")-@GROAFF@(IND),IND)
 Q
T1 S BASE=""
 F J=0:0 S BASE=$O(@LLISTE@(LISTE,BASE)) Q:BASE=""  D T2
 Q
T2 N CARD
 N IND,%I
 G:$$INLIS^%QS0XG2(LISRES,LISTE) T2SPE
 D DEL^%QSGES11(LISTE)
 D COPY^%QSGES11(LISTE,BASE,.CARD,$$CONCAS^%QZCHAD(LLISTE,LISTE_","_BASE))
 D ^%QSGES11(BASE,LISTE,"",CARD,"GROUPAGE","")
 S IND="" F I=0:0 S IND=$O(@LLISTE@(LISTE,BASE,IND)) Q:IND=""  D PA^%QSGESTI("L0",LISTE,"QUANTITE",@LLISTE@(LISTE,BASE,IND),IND)
 Q
 
T2SPE 
 N IND,%I
 S IND="" F %I=0:0 S IND=$$SUIVL^%QS0XG1(LISTE,IND) Q:IND=""  I '($D(@LLISTE@(LISTE,BASE,IND))) D RETIRL^%QS0XG1(LISTE,IND),PA^%QSGESTI("L0",LISTE,"QUANTITE",0,IND)
 S IND="" F I=0:0 S IND=$O(@LLISTE@(LISTE,BASE,IND)) Q:IND=""  D PA^%QSGESTI("L0",LISTE,"QUANTITE",@LLISTE@(LISTE,BASE,IND),IND) I '($$INLIS^%QS0XG2(LISTE,IND)) D AJOUT^%QS0XG1(LISTE,IND)
 Q

