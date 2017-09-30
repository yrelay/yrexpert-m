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

;%QS0COMP^INT^1^59547,73879^0
%QS0COMP() 
 
 
 
 
 N ADRES,B,BL,C,I,LISTE,LB,M,R,S
D S M="COMPLEMENTAIRE" D ^%QUAPAD(M)
 S R=1,LISTE=$$UN^%QUAPAGM Q:LISTE="" R
 S ADRES=$$^%QSCALVA("L0",LISTE,"ADRESSE") I ADRES="" D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Impossible de retrouver les individus de la liste ... desole") H 3 G D
 S BL=$$^%QSCALVA("L0",LISTE,"BASE") I BL="" D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Impossible de retrouver le repertoire des individus de la liste ... desole") H 3 G D
L0 D POCLEPA^%VVIDEO W $$^%QZCHW("Liste a partir de laquelle on calcule le complementaire : ") S DX=$X,DY=$Y D ^%VLEC Q:CTRLA R S B=Y1 G:B'="" DOK
 S B=$$NOMLOG^%QSF(BL) D POCLEPA^%VVIDEO
L00 
 
 I $$MES^%VZEOUI("--> "_B_" "_$$^%QZCHW("OK")_" ? ","O")'=1 G 78
 G 79
13 G 79
78 Q R
79 G OK
DOK G:B'="?" OK S B=$$^%QS1CHLI(BL),R=2 Q:B="" R
OK S LB=$S($D(^[QUI]RQSNOLOG(B)):$$LISTIND^%QSGEST6($$NOMINT^%QSF(B)),1:$$^%QSCALVA("L0",B,"ADRESSE"))
 S B=$S($D(^[QUI]RQSNOLOG(B)):$$NOMINT^%QSF(B),1:$$^%QSCALVA("L0",B,"BASE")) I (B="")!(LB="") D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Impossible de retrouver les individus de la liste ... desole") H 3 G L0
 I B'=BL D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("La liste n'est pas constituee par des individus de ce repertoire ... desole") H 3 Q R
 S R=2 H 1 D POCLEPA^%VVIDEO S %R=$$COMPL(LISTE,ADRES,LB,.S) D POCLEPA^%VVIDEO W $$^%QZCHW("Le resultat est dans ") D BLD^%VVIDEO W S," (",$$^%QSCALVA("L0",S,"CARD"),")" D NORM^%VVIDEO W " [RETURN]" R *%R
 D INIT2^%QUAPAGM,AFFP^%QUAPAGM(S) Q R
 
 
 
 
 
 
 
 
COMPL(NO,LISTE,B,S) 
 N AAA,N,NR,O,%O,OKECR
 D USE^%QS0(NO)
 S OKECR=$$GET^%SGVAR("ECR"),S=$$GEN^%QCAPOP("COM")
 D:OKECR POCLEPA^%VVIDEO
 W:OKECR "." S N=0,NR=0,O=-1 F %O=0:0 S O=$N(@B@(O)) Q:O=-1  S N=N+1 S:'($D(@LISTE@(O))) NR=NR+1,^[QUI]ZLIGCOMP(S,O)="" W:((N#100)=0)&OKECR "%"
 S AAA("ADRESSE",1)="^[QUI]ZLIGCOMP("_""""_S_""""_")",AAA("CARD",1)=NR,AAA("BASE",1)=$$^%QSCALVA("L0",NO,"BASE"),AAA("SOURCE",1)="COMPLEMENTAIRE",AAA("AUTRE",1)=NO D ADD^%QS0(S,"AAA")
 Q 1

