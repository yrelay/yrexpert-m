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

;%QSCOP1^INT^1^59547,73881^0
QSCOP1 ;
 
 
 
 N I,CTR,VAL,BASE,IND,LISTE,TEMP,NOM,LLB,ABORT,NOMCOUR,LLB1
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S LISTE=$$CONCAS^%QZCHAD(TEMP,"LISTE")
 D CLEPAG^%VVIDEO
 S (CTR,VAL)=""
 F I=0:0 Q:(CTR'="")!(VAL'="")  D T1 W !
 Q:((CTR'="")&(CTR'="F"))!(VAL="")
 S BASE=$$NOMINT^%QSF(VAL) Q:BASE=""
 S (CTR,VAL)=""
 F I=0:0 Q:(CTR'="")!(VAL'="")  D T2 W !
 Q:((CTR'="")&(CTR'="F"))!(VAL="")
 S NOM=VAL
 D ^%QSCOP(LISTE,BASE,VAL)
 D CLEPAG^%VVIDEO W $$^%QZCHW("confirmer vous la duplication ?") S ABORT=$$^%VZEOUI("O")
 Q:ABORT=0
 W !
 D REP^%QSGEST9("LLB1")
 S NOMCOUR=$O(LLB1(""))
 F I=0:0 Q:NOMCOUR=""  S LLB($$NOMINT^%QSF(NOMCOUR))="",NOMCOUR=$O(LLB1(NOMCOUR))
 S NOMCOUR=$O(@LISTE@(""))
 F I=0:0 Q:NOMCOUR=""  D RECOP^%QSGEST2(BASE,NOM,@LISTE@(NOMCOUR),.LLB) S NOMCOUR=$O(@LISTE@(NOMCOUR))
 Q
T1 D MES^%VLECFL2($$^%QZCHW("Quel est le repertoire de l'individu a dupliquer ? : "),.CTR,.VAL)
 I CTR="F" S CTR=""
 Q:(CTR'="F")&(CTR'="")
 I VAL="?" S VAL=$$REP^%QSGES14 Q
 I $$REPM^%QSGEST9(VAL)=0 D ^%VZEAVT(VAL_$$^%QZCHW(" n'est pas un nom de repertoire, ? pour consulter les susdits")) Q
 Q
T2 D MES^%VLECFL2($$^%QZCHW("Quel individu souhaiter vous dupliquer ? : "),.CTR,.VAL)
 I CTR="F" S CTR=""
 Q:(CTR'="F")&(CTR'="")
 I $$IR^%QSGEST5(BASE,VAL)=0 D ^%VZEAVT(VAL_$$^%QZCHW(" n'est pas un individu de ")_$$NOMLOG^%QSF(BASE)) Q
 Q

