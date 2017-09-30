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

;%QSNUPLE^INT^1^59547,73882^0
%QSNUPLE(A,B,N) 
 
 
 
 
 
 
 
 
 
 
 N OKECR
 S OKECR=$$GET^%SGVAR("ECR")
 K @(N) S @N=1 N I,J,L,NB,V,%V S L=$$RED^%ANA(A,"LATT") F I=1:1 S J=$P(L,",",I) Q:J=""  D ADD S @N@(J)=NB,@N=@N*NB
 Q
ADD G:IND=0 ADD2
 S V="",NB=0 F %V=0:0 S V=$$NXTRAV^%QSTRUC8(B,J,V) Q:V=""  I $$OVAR^%QSGE5(B,J,V,IND) S @N@(J,NB)=V,NB=NB+1 W:((NB#10)=0)&OKECR "."
 Q
ADD2 S V="",NB=0 F %V=0:0 S V=$$NXTRAV^%QSTRUC8(B,J,V) Q:V=""  S @N@(J,NB)=V,NB=NB+1 W:((NB#10)=0)&OKECR "."
 Q
TEST N B,%B,F,%F,FC,%FC S B="" F %B=0:0 S B=$O(^[QUI]RQS4(B)) Q:B=""  S F="" F %F=0:0 S F=$O(^[QUI]RQS4(B,F)) Q:F=""  S FC="" F %FC=0:0 S FC=$O(^[QUI]RQS4(B,F,FC)) Q:FC=""  S A=^[QUI]RQS4(B,F,FC,"ARBRE") D RQSNUPLE(A,B,"^NUPLET($J)"),TT R *BID
 Q
TT W !,!,FC
 S I="" F %I=0:0 S I=$O(^NUPLET($J,I)) Q:I=""  W !,I," ",^NUPLET($J,I)
 W !,$$^%QZCHW("Total = "),^NUPLET($J),$$^%QZCHW(" n-uplets")
 Q

