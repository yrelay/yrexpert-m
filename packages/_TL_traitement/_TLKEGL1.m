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

;%TLKEGL1^INT^1^59547,74029^0
TLKEGL1 ;
 
 
 
 
TRAIT(GL,GK,GU,TRD) 
 
 
 
 
 
 
 
 
 
 N TEMP,TAB,GKA,GKT,I,TR,UTI,TAB2,GKAA,GKAF,GKTA,GKTF,ABORT,TRC,MSG,REA
 W *-1
 S ABORT=0
 S MSG=$$^%QZCHW("Voulez-vous abandonner la recherche ?")
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S TAB=$$CONCAS^%QZCHAD(TEMP,"TABLE1")
 S TAB2=$$CONCAS^%QZCHAD(TEMP,"TABLE2")
 S GKA=$$CONCAS^%QZCHAD(GK,"ATTRIBUT")
 S GKAA=$$CONCAS^%QZCHAD(GKA,"ATTR"),GKAF=$$CONCAS^%QZCHAD(GKA,"FONC")
 S GKT=$$CONCAS^%QZCHAD(GK,"TRAITEMENT")
 S GKTA=$$CONCAS^%QZCHAD(GKT,"ATTR"),GKTF=$$CONCAS^%QZCHAD(GKT,"FONC")
 I GU="" S TR="" F I=1:1 S TR=$O(@GL@(TR)) Q:((TR="")!(TR="z"))!ABORT  D TRLN(GL,TR,TAB,TAB2,GKAA,GKAF,GKTA,GKTF) S TRC=TR
 I GU'="" S TR="" F I=1:1 S TR=$O(@GU@(TR)) Q:(TR="")!ABORT  D TRLN(GL,TR,TAB,TAB2,GKAA,GKAF,GKTA,GKTF) S TRC=TR
 S TRD="" I ABORT S TRD=TRC
 K @(TEMP)
 Q
 
TRLN(GL,TRT,TAB,TAB2,GA1,GA2,GT1,GT2) 
 
 N L,GSTO
 I $$ABEND^%TLKEGL3(MSG,.REA) S ABORT=1 Q
 I '($D(@GL@(TRT))) Q
 I $$OKANA^%TLGEST(TRT)'=1 D ^%VZEAVT($$^%QZCHW("Le traitement")_" "_TRT_" "_$$^%QZCHW("est incorrect")) Q
 S GSTO=$$CONCAS^%QZCHAD(GL,TRT),GSTO=$$CONCAS^%QZCHAD(GSTO,2)
 F L=1:1:$ZP(@GSTO@("")) K @(TAB),@(TAB2) S:$$ABEND^%TLKEGL3(MSG,.REA) ABORT=1 Q:ABORT  D VISU(TRT,L,1),TLIG,SATT(TAB,GA1,GT1,TRT,L),SFONC(TAB2,GA2,GT2,TRT,L)
 Q
 
TLIG N POS,TETE,COND,ACTI
 S TETE=@GSTO@(L,"TETE")
 S COND=$$RED^%ANA(TETE,1)
 S ACTI=$$RED^%ANA(TETE,2)
 D SUBST^%TLKEAN1(COND,"consultation",TAB,TAB2,.POS)
 I '(POS) D ^%VZEAVT($$^%QZCHW("Erreur au cours de l'evaluation"))
 D SUBST^%TLKEAN1(ACTI,"",TAB,TAB2,.POS)
 I '(POS) D ^%VZEAVT($$^%QZCHW("Erreur au cours de l'evaluation"))
 Q
 
SATT(TAB,GL1,GL2,TRT,L) 
 
 N U,I,I2,AT,MOD,REP
 S AT=""
 F I=1:1 S AT=$O(@TAB@(AT)) Q:AT=""  S REP="" F I2=1:1 S REP=$O(@TAB@(AT,REP)) Q:REP=""  S MOD="" F U=1:1 S MOD=$O(@TAB@(AT,REP,MOD)) Q:MOD=""  S @GL1@(AT,REP,TRT,L,MOD)="",@GL2@(TRT,AT,REP,L,MOD)=""
 S @GL2@(TRT)=$$DATE2^%QMDATE_"  "_$$HEURE^%QMDATE
 Q
 
SFONC(TAB,GL1,GL2,TRT,L) 
 
 N NF,I,MOD,REP
 S NF="",REP=0,MOD=0
 F I=1:1 S NF=$O(@TAB@(NF)) Q:NF=""  S @GL1@(NF,REP,TRT,L,MOD)="",@GL2@(TRT,NF,REP,L,MOD)=""
 Q
 
VISU(T,L,F) 
 Q:F=0
 D POCLEPA^%VVIDEO
 W $$^%QZCHW("Traitement")_"  "_T_"     "_$$^%QZCHW("ligne")_" "_$J(L,3)
 Q

