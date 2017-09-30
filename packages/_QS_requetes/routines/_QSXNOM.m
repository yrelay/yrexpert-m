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

;%QSXNOM^INT^1^59547,73884^0
%QSXNOM ;
QSXNOM(STO,LISTEO) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N TEMP,BASES,I,BASE
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S BASES=$$CONCAS^%QZCHAD(TEMP,"BASES")
 D DEB^%VTEMPS($P($ZPOS,"^",2))
 S @STO=$$^%QZCHW("calcul en cours")
 D REPI^%QSGEST9(BASES)
 S BASE=""
 F I=0:0 S BASE=$O(@BASES@(BASE)) Q:BASE=""  D T1(BASE,$$CONCAS^%QZCHAD("^[QUI]QUERYV",BASE),STO,0,LISTEO)
 S @STO=$$FIN^%VTEMPS($P($ZPOS,"^",2))
 K @(TEMP)
 Q
 
T1(BASE,LISTE,STO,VISU,LISTEO) 
 N I,IND,NCLES,NOK,NOM,NOK1,STO1,L1
 S NCLES=^[QUI]RQSNCLES(BASE)
 I LISTEO D T3
 S NOK=0,NOK1=0
 S IND=""
 F I=0:1 S IND=$O(@LISTE@(IND)) Q:IND=""  D T2
 S @STO@(BASE,"IND")=NOK
 S @STO@(BASE,"NOM")=NOK1
 S @STO@(BASE,"TOTAL")=I
 I LISTEO D T4(STO,BASE,L1,NOK,1),T4(STO,BASE,L2,NOK1,2)
 Q
T2 I $L(IND,",")'=NCLES S NOK=NOK+1 S:LISTEO @STO1@(IND)="" Q
 S NOM=$$^%QSCALVA(BASE,IND,"NOM")
 I NOM'=$$NOMEX^%QSGES10(BASE,IND) S NOK1=NOK1+1 S:LISTEO @STO2@(IND)="" Q
 I VISU W !,IND,?20,NOK,?25,NOM,?40,NOK1
 Q
T3 S L1=$$NOM^%QSGES11("SYS"),STO1=$$STO^%QSGES11(L1)
 S L2=$$NOM^%QSGES11("SYS"),STO2=$$STO^%QSGES11(L2)
 Q
T4(STO,BASE,L,CARD,TYP) 
 Q:CARD=0
 D CREER^%QSGES11(BASE,L,"SYS",CARD,$$^%QZCHW("INTEGRITE"),"",$S(TYP=1:$$^%QZCHW("NOM INCORRECT"),1:$$^%QZCHW("ATTRIBUT NOM INCORRECT")))
 S @STO@(BASE,$S(TYP=1:"IND",1:"NOM"),"LISTE")=L
 Q
 
IMP(STO,IMP) 
 N I,LI,BASE,J,TX,VISU
 S VISU=0
 S LI=$ZP(@IMP@(""))+1
 S @IMP@(LI)=$$^%QZCHW("resultat de la verification sur les noms"),LI=LI+1
 I '($D(@STO)) S @IMP@(LI)=$$^%QZCHW("verification pas effectuee") Q
 S @IMP@(LI)="",LI=LI+1
 S @IMP@(LI)=$J($$^%QZCHW("repertoire"),10)_$J($$^%QZCHW("total"),6)_$J($$^%QZCHW("nom incorrect"),14)_$J($$^%QZCHW("liste"),12)_$J($$^%QZCHW("attribut nom incorrect"),23)_$J($$^%QZCHW("liste"),12),LI=LI+1
 S BASE=$O(@STO@(""))
 F I=0:0 Q:BASE=""  D IMP1 S BASE=$O(@STO@(BASE))
 S @IMP@(LI)="",LI=LI+1
 S @IMP@(LI)=$$^%QZCHW("duree de la verification")_" : "_@STO,LI=LI+1
 S @IMP@(LI)="",LI=LI+1
 Q
IMP1 S @IMP@(LI)=$J($E($$NOMLOG^%QSF(BASE),1,10),10)_$J($E(@STO@(BASE,"TOTAL"),1,6),6)_$J($E(@STO@(BASE,"IND"),1,14),14)
 S @IMP@(LI)=@IMP@(LI)_$J($E($$^%QCAZG($$CONCAS^%QZCHAD(STO,BASE_",IND,LISTE")),1,12),12)_$J($E(@STO@(BASE,"NOM"),1,23),23)_$J($E($$^%QCAZG($$CONCAS^%QZCHAD(STO,BASE_",NOM,LISTE")),1,12),12)
 W:VISU @IMP@(LI)
 S LI=LI+1
 Q

