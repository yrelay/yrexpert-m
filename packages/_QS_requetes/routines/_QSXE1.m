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

;%QSXE1^INT^1^59547,73883^0
%QSXE1 ;
QSXE1(STO,LISTE) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N TEMP,BASES,I,BASE,STO1,L1
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S BASES=$$CONCAS^%QZCHAD(TEMP,"BASES")
 D DEB^%VTEMPS($P($ZPOS,"^",2))
 S @STO=$$^%QZCHW("en cours")
 D REPI^%QSGEST9(BASES)
 S BASE=""
 
 F I=0:0 S BASE=$O(@BASES@(BASE)) Q:BASE=""  D:$$RANG^%QSGES17(BASE)>1 T1
 S @STO=$$FIN^%VTEMPS($P($ZPOS,"^",2))
 Q
T1 S STO1=""
 I LISTE D T3
 D ^%QSXE(STO,$$CONCAS^%QZCHAD("^[QUI]QUERYV",BASE),BASE,STO1)
 I LISTE D T4(STO,BASE,L1,@STO@(BASE,"NOK"))
 Q
T3 S L1=$$NOM^%QSGES11("SYS"),STO1=$$STO^%QSGES11(L1)
 Q
T4(STO,BASE,L,CARD) 
 Q:CARD=0
 D CREER^%QSGES11(BASE,L,"SYS",CARD,$$^%QZCHW("INTEGRITE"),"",$$^%QZCHW("ORPHELIN"))
 S @STO@(BASE,"LISTE")=L
 Q
 
 
 
IMP(STO,IMP) 
 N BASE,I,LI
 S LI=$ZP(@IMP@(""))+1
 S @IMP@(LI)=$$^%QZCHW("recensement des individus orphelins (sans pere)"),LI=LI+1
 I '($D(@STO)) S @IMP@(LI)=$$^%QZCHW("verification pas effectuee") Q
 S @IMP@(LI)="",LI=LI+1
 S @IMP@(LI)=$J($$^%QZCHW("repertoire"),20)_$J($$^%QZCHW("total"),10)_$J($$^%QZCHW("orphelins"),15)_$J($$^%QZCHW("liste"),12),LI=LI+1
 S BASE=""
 F I=0:0 S BASE=$O(@STO@(BASE)) Q:BASE=""  D IMP1
 S @IMP@(LI)=$$^%QZCHW("duree de la verification")_" : "_@STO,LI=LI+1
 Q
IMP1 S @IMP@(LI)=$J($E($$NOMLOG^%QSF(BASE),1,20),20)_$J(@STO@(BASE,"TOTAL"),10)_$J(@STO@(BASE,"NOK"),15)_$J($E($$^%QCAZG($$CONCAS^%QZCHAD(STO,BASE_",LISTE")),1,12),12),LI=LI+1
 Q

