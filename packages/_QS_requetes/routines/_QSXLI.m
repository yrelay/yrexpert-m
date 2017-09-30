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

;%QSXLI^INT^1^59547,73884^0
%QSXLI ;
QSXLI(STO,LISTE) 
 
 
 
 
 
 
 
 
 
 
 
 N TEMP,BASES,I,LIENS,LIEN,J,BASE,L2,L3,BASED,VU
 
 S BASES=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"BASES")
 D DEB^%VTEMPS($P($ZPOS,"^",2))
 S @STO=$$^%QZCHW("calcul en cours")
 D REPI^%QSGEST9(BASES)
 S BASE=""
 F I=0:0 S BASE=$O(@BASES@(BASE)) Q:BASE=""  D T1
 S @STO=$$FIN^%VTEMPS($P($ZPOS,"^",2))
 Q
 
T1 S LIENS=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LIENS")
 K @(LIENS)
 D LIEN^%QSGEST9(BASE,LIENS)
 S LIEN=""
 F J=0:0 S LIEN=$O(@LIENS@(LIEN)) Q:LIEN=""  D T2
 Q
T2 S BASED=$$REPD^%QSGEL2(BASE,LIEN) Q:BASED=""
 S TYPEL=@LIENS@(LIEN)
 
 I (TYPEL=2)!(TYPEL=4) D T3
 
 I (TYPEL=3)&('($D(VU(BASED,BASE)))) S VU(BASE,BASED)="",VU(BASED,BASE)="" D T3
 Q
 
T3 G:LISTE T4
 S (STO2,STO3)=""
 D LIEN^%QSXL(BASE,LIEN,$$CONCAS^%QZCHAD("^[QUI]QUERYV",BASE),STO,STO2,STO3)
 Q
 
T4 S L2=$$NOM^%QSGES11("SYS"),STO2=$$STO^%QSGES11(L2)
 S L3=$$NOM^%QSGES11("SYS"),STO3=$$STO^%QSGES11(L3)
 D LIEN^%QSXL(BASE,LIEN,$$CONCAS^%QZCHAD("^[QUI]QUERYV",BASE),STO,STO2,STO3)
 D T5(STO,BASE,LIEN,L2,2),T5(STO,BASE,LIEN,L3,3)
 Q
 
T5(STO,BASE,LIEN,L,TYP) 
 N CARD
 S CARD=$$CARD^%QSGES11($$STO^%QSGES11(L))
 Q:CARD=0
 D CREER^%QSGES11(BASE,L,"SYS",CARD,$$^%QZCHW("INTEGRITE"),"",$S(TYP=2:$$^%QZCHW("DEMILIENS"),1:$$^%QZCHW("MAL CONSTRUIT")))
 S @STO@(BASE,LIEN,"LISTE",TYP)=L
 Q
 
IMP(STO,IMP) 
 N I,J,K,BASE,LIEN,LI,TAB
 S LI=$ZP(@IMP@(""))+1
 S @IMP@(LI)=$$^%QZCHW("verification unitaire des liens"),LI=LI+1
 I '($D(@STO)) S @IMP@(LI)=$$^%QZCHW("verification pas effectuee") Q
 S @IMP@(LI)=$J($$^%QZCHW("repertoire"),10)_$J($$^%QZCHW("lien"),10)_$J($$^%QZCHW("total"),6)_$J($$^%QZCHW("ok"),6)_$J($$^%QZCHW("inex"),6)_$J($$^%QZCHW("N inv"),6)_$J($$^%QZCHW("liste"),12)_$J($$^%QZCHW("prob"),6)_$J($$^%QZCHW("liste"),12),LI=LI+1
 S BASE=""
 F I=0:0 S BASE=$O(@STO@(BASE)) Q:BASE=""  D IMP1
 S @IMP@(LI)="",LI=LI+1
 S @IMP@(LI)=$$^%QZCHW("duree de la verification")_" : "_@STO,LI=LI+1
 S @IMP@(LI)="",LI=LI+1
 Q
IMP1 S @IMP@(LI)=$$NOMLOG^%QSF(BASE)
 S LI=LI+1,@IMP@(LI)="",LI=LI+1
 S LIEN=""
 F I=0:0 S LIEN=$O(@STO@(BASE,LIEN)) Q:LIEN=""  D IMP2
 S @IMP@(LI)="",LI=LI+1
 Q
IMP2 S @IMP@(LI)=$J($E(LIEN,1,20),20)_$J($E(@STO@(BASE,LIEN,"CARD"),1,6),6)_$J($E(@STO@(BASE,LIEN,"CARD1"),1,6),6)
 S @IMP@(LI)=@IMP@(LI)_$J($E(@STO@(BASE,LIEN,"CARD0"),1,6),6)_$J($E(@STO@(BASE,LIEN,"CARD2"),1,6),6)_$J($E($$^%QCAZG($$CONCAS^%QZCHAD(STO,BASE_","_LIEN_",LISTE,"_2)),1,12),12)
 S @IMP@(LI)=@IMP@(LI)_$J($E(@STO@(BASE,LIEN,"CARD3"),1,6),6)_$J($E($$^%QCAZG($$CONCAS^%QZCHAD(STO,BASE_","_LIEN_",LISTE,"_3)),1,12),12),LI=LI+1
 Q

