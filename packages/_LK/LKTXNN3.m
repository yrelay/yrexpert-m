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

;LKTXNN3^INT^1^59547,74868^0
LKTXNSC3 ;
 
 
 
GLO N GLO,H,SIZ,I,J,K
 S H=$$DH1^%QMDATE("2/10/87"),SIZ=40
 S GLO="^[QUI]LK(""NSC"",""A1"",H,""DATA"",1)"
 K @(GLO) S J=1,K=1
 F I=1:1:5 D TR S J=J+1
 Q
TR S ATELIER="ATELIER"_J D STO("ATELIER",ATELIER,$$CONCAS^LKZ(GLO,K)) S K=K+1
 S ARC="ARC"_J D STO("ARC",ARC,$$CONCAS^LKZ(GLO,K)) S K=K+1
 S PARA=$P("COMMANDE^POSTE^FORME","^",$R(3)+1)
 S VAL="00"_$R(500)
 D STO(PARA,VAL,$$CONCAS^LKZ(GLO,K)) S K=K+1
 S PARA=$P("COMMANDE^POSTE^FORME","^",$R(3)+1)
 S VAL="00"_$R(500)
 D STO(PARA,VAL,$$CONCAS^LKZ(GLO,K)) S K=K+1
 Q
STO(PARA,VAL,DEST) S @DEST=$$FORMAT(PARA)_$$FORMAT(VAL) Q
FORMAT(D) Q $E(D,1,SIZ)_$J("",SIZ-$L(D))

