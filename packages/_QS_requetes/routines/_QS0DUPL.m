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

;%QS0DUPL^INT^1^59547,73879^0
%QS0DUPL() 
 N LISTE,MSG,OK,RES,SORTIE S MSG=$$^%QZCHW("DUPLICATION D'UNE LISTE"),RES=1
 D ^%QUAPAD(MSG)
 S LISTE=$$UN^%QUAPAGM G:LISTE="" FIN
 S SORTIE=$$GEN^%QCAPOP("DUP") D DUPL(LISTE,SORTIE,.OK) I OK D INIT2^%QUAPAGM,AFFP^%QUAPAGM(SORTIE) S RES=2
FIN D POCLEPA^%VVIDEO Q RES
 
 
 
DUPL(E,S,R) 
 N A,%A,N,V,%V,O,%O,OKECR,AXX
 S OKECR=$$GET^%SGVAR("ECR")
 D USE^%QS0(E)
 S A=$$^%QSCALVA("L0",E,"ADRESSE")
 I A="" D:OKECR POCLEPA^%VVIDEO,^%VSQUEAK W:OKECR $$^%QZCHW("Impossible de retrouver la liste ... desole") H 2 S R=0 Q
 I OKECR D POCLEPA^%VVIDEO,BLD^%VVIDEO W E," --> ",S," " D NORM^%VVIDEO W "."
 K ^[QUI]ZLIGDUPL(S) S N=0,V=-1 F %V=0:0 S V=$N(@A@(V)) Q:V=-1  S ^[QUI]ZLIGDUPL(S,V)="",N=N+1 W:((N#100)=0)&OKECR "%"
 S ^[QUI]ZLIGDUPL(S)=N
 I OKECR D POCLEPA^%VVIDEO,BLD^%VVIDEO W N D NORM^%VVIDEO W $$^%QZCHW(" individus recopies ...")
 S A="" F %A=0:0 S A=$$NXTRIA^%QSTRUC8("L0",E,A) Q:A=""  S O="" F %O=0:0 S O=$$NXTRIAO^%QSTRUC8("L0",E,A,O) Q:O=""  S V=$$VALEUR^%QSTRUC8("L0",E,A,O) D PA^%QSGESTI("L0",S,A,V,O)
 S AXX("AUTRE",1)=E,AXX("SOURCE",1)="DUPLICATION",AXX("ADRESSE",1)="^[QUI]ZLIGDUPL("""_S_""")",AXX("CARD",1)=N,R=1
 S A=$$^%QSCALVA("L0",E,"TRIEE")
 I A="" D ADD^%QS0(S,"AXX") Q
 S AXX("TRIABLE",1)="OUI",N=$$GEN^%QCAPOP("TRI")
 
 S %V="" F V=1:1 S %V=$O(@A@(%V)) Q:%V=""  S ^[QUI]ZLIGTRIE(N,V)=@A@(%V),^[QUI]ZLIGDUPL(S,@A@(%V))=V
 S ^[QUI]ZLIGTRIE(N)=V-1
 S AXX("TRIEE",1)="^[QUI]ZLIGTRIE("""_N_""")"
 D ADD^%QS0(S,"AXX")
 Q

